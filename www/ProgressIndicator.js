var exec = require("cordova/exec");


function  Progress() {};

//transparentbackcolor是否需要透明背景
//time 多久后自动消失,毫秒
//message 显示加载的信息
Progress.prototype.showAnnularWithLabel = function (istransparentbackcolor,time,message) {

     istransparentbackcolor=istransparentbackcolor||false;
     time=time|| 30000
     message=message||""

     exec(null, null, 'CDVXYProgress', 'showProgress', [istransparentbackcolor,message,time]);
};


//transparentbackcolor是否需要透明背景
//message 显示加载的信息
Progress.prototype.showAnnular = function (istransparentbackcolor,message) {

     istransparentbackcolor=istransparentbackcolor||false;
     message=message||""

     exec(null, null, 'CDVXYProgress', 'showProgress', [istransparentbackcolor,message]);
};


Progress.prototype.dismissProgress = function () {
     exec(null, null, 'CDVXYProgress', 'dismissProgress', null);
};
               
//new一个Progress的类对象，并赋值给module.exports
var progressModel = new Progress();
module.exports = progressModel;

