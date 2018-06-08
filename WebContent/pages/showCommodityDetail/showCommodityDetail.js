/**
 * 
 */
function load() {
	"use strict";
	var number = GetUrlParameter("number");
	if (number != null) {
		var cart = document.getElementById("cart-tips");
		cart.className="pro-popup-area";
	}
}

function GetUrlParameter(name)
{
	"use strict";
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)
	 {
		return  decodeURIComponent(r[2]);	 
	 }
	else
		{
			return null;
		}
}

$(document).ready(function(){
	"use strict";
	$("#plus").click(
	function()
	  {
		var num = $(".product-stock-text").val();
		$(".product-stock-text").val(Number(num)+1);
		  if(Number(num)+1 > 1)
			  {
				  $("#reduce").removeClass("disabled");
			  }
	  }
	);
	$("#reduce").click(
  	function()
	  {
		  if($(this).hasClass("disabled"))
			  {
				  return;
			  }
		var num = $(".product-stock-text").val();
		$(".product-stock-text").val(Number(num)-1);
		  if(Number(num)-1 <= 1)
			  {
				  $("#reduce").addClass("disabled");
			  }
	  }
  );
//	$("#pro-operation").click(
//		function showCartDialog(islogin)
//		{
//			if (islogin == 2) {
//				$("#cart-tips").removeClass("hide");
//			}
//			alert("hello");
//		}
//	);
	$("#button_continue_look").click(
		function()
		{
			$("#cart-tips").addClass("hide");
		}
	);
});


function showCartDialog(parm) {
	"use strict";
	//alert(parm.id);
	var cart = null;
	if (parm.id != null && parm.id != "404") {
//		var cart = document.getElementById("cart-tips");
//		cart.className="pro-popup-area";
		var num = document.getElementById("product-text").value;
		//alert(num);
		location.href = "ShowCommodityDetailServlet?number="+num+"&commodityID="+parm.id;
		return false;
	}
	cart = document.getElementById("cart-error-tips");
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