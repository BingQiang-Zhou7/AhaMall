// JavaScript Document
function load()
{
	"use strict";
	//alert("hello");
	$(document).ready(
			function() {
				//初始设置减键是否可以点
				$(".p-stock-text").each(function(){	
					var num = $(this).val();
					var myClass = $(this).attr("class");
					myClass = myClass.substring(myClass.indexOf(" ")+1,myClass.length);
					myClass = "."+myClass;
					//alert(myClass);
					$(myClass).each(
						function()
						{
							//alert(num);
							if($(this).hasClass("pro-quantity-minus"))
								{
									if(Number(num) <= 1)
										{
										//alert(myClass);
											$(this).addClass("disabled");
										}
									else
										{
											$(this).removeClass("disabled");
										}
								}
						}
					);
				}
				);
			});
}

$(document).ready(
	function(){
		"use strict";
		//全选 以及单选 全部单选好了 相当于全选
		$(".icon-choose-normal").click
		(
			function()
			{
				if ($(this).hasClass("icon-choose-all")) {
					if($(".icon-choose-all").hasClass("icon-choose"))
					{
						$(".icon-choose-normal").removeClass("icon-choose");
						$("#sc-cartInfo-totalOriginalPrice").text(0.00);
					}
					else
					{
						$(".icon-choose-normal").addClass("icon-choose");
						$(".p-price-total").each(function(){	
							var price = $(this).text();
							price = price.substring(2,price.length);
							//alert(Number(price));
							var all = $("#sc-cartInfo-totalOriginalPrice").text();
							//alert(Number(all));
							var allPrice = Number(price)+Number(all);
							$("#sc-cartInfo-totalOriginalPrice").text(allPrice);
							//alert(allPrice);
						});
					}
				}
				else
					{
						if($(this).hasClass("icon-choose"))
							{
							//alert("hello");
								$(this).removeClass("icon-choose");
								if ($(".icon-choose-all").hasClass("icon-choose")) {
									$(".icon-choose-all").removeClass("icon-choose");
								}
							}
						else
							{
								$(this).addClass("icon-choose");
								var isall=true;
								$(".icon-choose-normal").each(function(){	
									if ($(this).hasClass("icon-choose-all")) {
										//alert("11");
										return true;
									}
									else {
										if ($(this).hasClass("icon-choose")) {
											//alert("22");
											return true;
										}
										else {
											//alert("33");
											isall=false;
											return false;
										}
									}
								});
								if (isall == true) {
									$(".icon-choose-all").addClass("icon-choose");
								}
							}
					}
				$("#sc-cartInfo-totalOriginalPrice").text("0.00");
				$(".p-price-total").each(function(){	
				var myClass = $(this).attr("class");
				var price = $(this).text();
				price = price.substring(2,price.length);
				myClass = myClass.substring(myClass.indexOf(" ")+1,myClass.length);
				myClass = "."+myClass; 
				$(myClass).each(
					function()
					{
						if($(this).hasClass("icon-choose"))
							{
								//alert(Number(price));
								var all = $("#sc-cartInfo-totalOriginalPrice").text();
								//alert(Number(all));
								var allPrice = Number(price)+Number(all);
								$("#sc-cartInfo-totalOriginalPrice").text(allPrice);
							}
					}
				);
			});
			}
		);
		//初始价格：全部商品价格
		$(".p-price-total").each(function(){
			var price = $(this).text();
				price = price.substring(2,price.length);
			var all = $("#sc-cartInfo-totalOriginalPrice").text();
			//alert(Number(all));
			var allPrice = Number(price)+Number(all);
			$("#sc-cartInfo-totalOriginalPrice").text(allPrice);
		});
		
		//点击删除键
		$(".p-del").click(
				function() {
					$(this).next().removeClass("hide");
				}
				);
		//点击清空购物车
		$(".p-del-all").click(
				function() {
					$(this).parent().next().removeClass("hide");
				}
				);
		//点击否
		$(".button-action-no").click(
				function() {
					$(this).parent().parent().parent().addClass("hide");
				}
				);
	}
);
	
	
