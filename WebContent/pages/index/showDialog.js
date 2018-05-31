// JavaScript Document

function showCartDialog(islogin) {
	"use strict";
	//alert(islogin);
	if (islogin == "2") {
		var iconTip = document.getElementById("IconTip");
		var cartTip = document.getElementById("CartTip");
		
		cartTip.innerHTML="操作失败，请登录后再试！";
		cartTip.style.color="#e01d20";
		iconTip.style.backgroundPosition="-116px 0";
	}
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
	//alert(commodity);
	return false;
}