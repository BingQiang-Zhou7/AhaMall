// JavaScript Document

function load() {
	"use strict";
	var sec = document.getElementById("second");
	  var i = 5;
	  //setInterval方法可按照指定的周期（以毫秒计）来调用函数或计算表达式。
	  var timer = setInterval(function(){
	    i--;
	    sec.innerHTML = i;
	    if(i==1){
	      window.location.href = "../../pages/login/login.htm";
	    }
	  },1000);
}