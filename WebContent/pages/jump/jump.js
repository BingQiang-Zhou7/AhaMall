// JavaScript Document

function load() {
	"use strict";
	var sec = document.getElementById("second");
	var page1 = GetUrlParameter("topage");
	  var i = 5;
	  //setInterval方法可按照指定的周期（以毫秒计）来调用函数或计算表达式。
	  var timer = setInterval(function(){
	    i--;
	    sec.innerHTML = i;
	    if(i==1){
	  	  if (page == "login") {
	    		window.location.href = "../login/login.htm";
	  		}
	    	else {
	    		 window.location.href = "../index/index.jsp";
	  		}
	    }
	  },1000);
}

function GetUrlParameter(name)
{
	"use strict";
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)
	 {
		return decodeURIComponent(r[2]); 
	 }
	else
		{
			return null;
		}
}