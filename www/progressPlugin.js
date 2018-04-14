var exec = require("cordova/exec");


function  Progress() {};


//showAlertWithTitle是我们OC的方法
//option是入参
Progress.prototype.showProgress = function (success,fail,option) {
     exec(success, fail, 'CDVXYProgress', 'showProgress', option);
};

Progress.prototype.dismissProgress = function () {
     exec(null, null, 'CDVXYProgress', 'dismissProgress', null);
};
               
//new一个Progress的类对象，并赋值给module.exports
var progressModel = new Progress();
module.exports = progressModel;

