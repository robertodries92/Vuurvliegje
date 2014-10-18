var unirest = require('unirest');
var fs = require('fs');
var url =  'http://localhost:3000';
var _ = require('underscore');
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
            console.log(result);
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
                callback({
                    message : 'Sorry this image takes to long to process'
                },undefined)
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
exports.recognize = function(req,res){
    console.log(req.body.image_url);
        getToken(req.body.image_url,req.body.location,function(err,result){
            if(err){
                res.json(500,err);
                return;
            }
            console.log(result.token);
            getProduct(result.token,function(err,result){

                if(err){
                    res.json(404,err);
                    return;
                }
               res.json(200,result);
            })
        })

}



