// JavaScript Document

function showCartDialog() {
	"use strict";
	var cart = document.getElementById("cart-tips");
	cart.className="pro-popup-area";
	  var i = 3;
	  //setInterval方法可按照指定的周期（以毫秒计）来调用函数或计算表达式。
	  var timer = setInterval(function(){
	    i--;
	    if(i==1){
	      cart.className="pro-popup-area hide";
	    }
	  },1000);
	//跳转
	return false;
}