
var express = require('express');
var path = require('path');
var fs = require('fs');
var app = express();
var allRoutes = require('./routes/all.js');
/*
    Vettige shizle maar allow all CORS requests here.
 */
var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');

    next();
}

/*
    Configure express globally
 */
app.configure(function(){
    app.use(express.logger('dev'));
    app.use(express.cookieParser());
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express.compress());
    app.use(express.session({secret: 'geheim vuurvliegje met een rode poep'}));
    app.use(allowCrossDomain);
    app.use(app.router);
    app.use(express.static(path.join(__dirname, 'img')));
    app.use(express.errorHandler());
});


allRoutes.init(app);

app.listen(3000, function () {
    console.log('Express server listening on port %d in %s mode', 3000, app.get('env'));
});