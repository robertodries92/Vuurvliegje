/**
 * Created by landervanbreda on 18/10/14.
 */
/*
 Routes for the recognition api
 */
var recognition = require('./recognition.js');


exports.init = function(app){
    recognition.init(app);
}