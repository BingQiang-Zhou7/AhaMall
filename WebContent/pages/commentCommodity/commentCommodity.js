// JavaScript Document

$(document).ready(
	function(){
	"use strict";
		$("#remarkSubmit").click(
			function()
			{
				//alert("hello");
				var urlParam = window.location.search;
				//alert(urlParam);
				var content = $("textArea").val();
				//alert(content);
				if(content == null || content == "")
					{
						$("#commodityTip").removeClass("hide");
						//alert("hello");
					}
				else
					{
						$("#commodityTip").addClass("hide");						
						window.location.href=encodeURI("CommentCommodityServlet"+urlParam+"&content="+content);
					}
				return false;
			}
		);
//		$("textarea").blur(
//			function()
//			{
//				var content = $("textArea").val();
//				//alert(content.length);
//				$(".WordNum").text(content.length);
//			}
//		);
//		$("textarea").keydown(
//				function()
//				{
//					var content = $("textArea").val();
//					//alert(content.length);
//					$(".WordNum").text(content.length);
//				}
//			);
//		$("textarea").keypress(
//				function()
//				{
//					var content = $("textArea").val();
//					//alert(content.length);
//					$(".WordNum").text(content.length);
//				}
//			);
		$("textarea").keyup(
				function()
				{
					var content = $("textArea").val();
					//alert(content.length);
					$(".WordNum").text(content.length);
				}
			);
//		$("textarea").focus(
//				function()
//				{
//					var content = $("textArea").val();
//					//alert(content.length);
//					$(".WordNum").text(content.length);
//				}
//			);
	}
);

//function GetUrlParameter(name)
//{
//	"use strict";
//	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
//	var r = window.location.search.substr(1).match(reg);
//	if(r!=null)
//	 {
//		return  decodeURIComponent(r[2]);	 
//	 }
//	else
//		{
//			return null;
//		}
//}