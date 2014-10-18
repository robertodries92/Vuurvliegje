/**
 * Created by landervanbreda on 18/10/14.
 */
/*
    Routes for the recognition api
 */
var recognition = require('../controllers/recognition.js');


exports.init = function(app){
    app.post('/recognize',recognition.recognize);
}