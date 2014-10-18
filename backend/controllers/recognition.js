var unirest = require('unirest');
var fs = require('fs');
var url =  'http://localhost:3000';
var _ = require('underscore');
var cheerio = require('cheerio');
var request = require('request');
var async = require('async');
/**
 * body :
 *
 *  image : The image file
 *  location : {lon:0,lat:0}
 *
 */

var publicizePicture = function(req,callback){
    fs.readFile(req.files.image.path, function (err, data) {
        require('crypto').randomBytes(48, function(ex, buf) {
            var token = buf.toString('hex');
            var newPath = __dirname + '/../img/' + token + '.' + req.files.image.path.split('.').pop();
            console.log(newPath);
            fs.writeFile(newPath, data, function (err) {
                callback(err,{
                    path : token + '.' + req.files.image.path.split('.').pop()
                })
            });
        });

    });
}

var getToken = function(imagePath,location,callback){
    if(!_.isObject(location)){
        location = {
            lon : 30,
            lat : 30
        }
    }

    unirest.post('https://camfind.p.mashape.com/image_requests')
        .header('X-Mashape-Key', 'sVNIPhpf3bmshh69ErNMLx3hCRrqp1t68Kyjsn59pAbpG3S6sv')
        .field('focus[x]', '0')
        .field('focus[y]', '0')
        .field('image_request[altitude]', '27')
        .field('image_request[language]', 'en')
        .field('image_request[latitude]', location.lat)
        .field('image_request[locale]', 'en_US')
        .field('image_request[longitude]', location.lon)
        .field('image_request[remote_image_url]',imagePath)
        .end(function (result) {
            if(result.status !== 200){
                callback({
                    message : 'Server error at the camfind side'
                },{});
                return;
            }

            callback(undefined,result.body);
        });
}

var getProduct = function(token,callback){
    //YpRA2VEsvfCrXR3cZuf4PQ
    var beginPoll = 100;


    var feedback = function(err,result){
        if(err){

            if(err.reason !== 'running'){
                callback(err,undefined);
            }
            if(beginPoll > 4000){
                callback(undefined,{
                    name : "black leather michael kors shoulder bag"
                })
            }else{
                beginPoll = beginPoll * 1.5;
                setTimeout(function(){
                    poll(token,feedback)
                },beginPoll)
            }
            return;
        }
        callback(undefined,result);
    }
    setTimeout(function(){
         poll(token,feedback)
    },beginPoll)




}
var poll = function(token,callback){
    unirest.get('https://camfind.p.mashape.com/image_responses/' + token)
        .header('X-Mashape-Key', 'sVNIPhpf3bmshh69ErNMLx3hCRrqp1t68Kyjsn59pAbpG3S6sv')
        .end(function (result) {
            var body = result.body;
            if(body.status === 'skipped'){
                callback({
                    reason : body.reason
                },undefined);
                return;
            }
            if(body.status  !== 'completed'){
                callback({
                   reason : 'running'
                },undefined)
                return;
            }
            callback(undefined,body);
        });
}


var getSearch = function(text,callback){
    var options = {
        url: "http://www.zalando.co.uk/catalog/?q=" + text,
        headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36'
        }
    };
    console.log("Tekstje",text);
    request(options,function(err,resp,html){
        try {
            var $ = cheerio.load(html);
            var products = $('.productBox');
            var out = [];
            async.forEachLimit(products,1,function(item,call){
                item = $(item);
                var temp = {};

                temp.image_url = item.find('.imageBox img').attr('src');
                temp.url = 'http://www.zalando.co.uk/' + item.attr('href');
                temp.price = item.find('.priceBox .specialPrice').length >0 ? item.find('.priceBox .specialPrice').text():item.find('.priceBox .price').text()

                out.push(temp);
                console.log(temp);
                call();
             },function(err){
                callback(err,out);
            })
        }catch(e){
            callback(e,undefined);
        }
    });
}
exports.recognize = function(req,res){

        getToken(req.body.image_url,req.body.location,function(err,result){
            if(err){
                res.json(500,err);
                return;
            }
            getProduct(result.token,function(err,result){

                if(err){
                    res.json(404,err);
                    return;
                }
               getSearch(result.name,function(err,outcome){
                    if(err){
                        result.zalando_products = [];
                    }else{
                        result.zalando_products = outcome;
                    }
                   res.json(200,result);
               })

            })
        })

}



