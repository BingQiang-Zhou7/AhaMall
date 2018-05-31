// JavaScript Document
function load()
{
	"use strict";
	var category = ["category-0","category-1", "category-2","category-3","category-4", "category-5"];
	var categoryName = ["全部","手机", "笔记本","平板","智能穿戴", "配件"];
	var sort = ["sort-0","sort-1","sort-2","sort-3"];
	var sortName = ["默认","价格","评价数","上架时间"];
	var categoryUrl = GetUrlParameter('categoryName');
	var sortUrl = GetUrlParameter('sortName');
	var fuzzyStr = GetUrlParameter('fuzzyStr');
	if (fuzzyStr != null && fuzzyStr != "false") {
		 document.getElementById("search-kw").value = fuzzyStr;
	}
	if(categoryUrl == null || sortUrl == null)
		{
			return ;
		}
	
	for(var i = 0;i<category.length;i++)
	{
		if(categoryName[i] == categoryUrl)
			{
				document.getElementById(category[i]).className="selected";
				//alert(parameter);
			}
		else 
			{

				document.getElementById(category[i]).className="unselected";
			}
	}
	for(var j = 0;j<sort.length;j++)
	{
		if(sortName[j] == sortUrl)
			{
				document.getElementById(sort[j]).className="selected";
				//alert(parameter);
			}
		else
			{

				document.getElementById(sort[j]).className="unselected";
			}
	}
	//window.location.reload();
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


function onClickLink(parameter,type)
{
	"use strict";
	var category = ["category-0","category-1", "category-2","category-3","category-4", "category-5"];
	var categoryName = ["全部","手机", "笔记本","平板","智能穿戴", "配件"];
	var sort = ["sort-0","sort-1","sort-2","sort-3"];
	var sortName = ["默认","价格","评价数","上架时间"];
	var url = "index.jsp?";
	
	for(var i = 0;i<category.length;i++)
	{
		if(category[i] == parameter)
			{
				document.getElementById(category[i]).className="selected";
				url=url+"categoryName="+categoryName[i];
				//alert(parameter);
			}
		else if(document.getElementById(category[i]).className == "selected")
			{
				if(type == 1)
					{
						document.getElementById(category[i]).className="unselected";
					}
				else
					{
						url=url+"categoryName="+categoryName[i];
					}
			}
	}
	for(var j = 0;j<sort.length;j++)
	{
		if(sort[j] == parameter)
			{
				document.getElementById(sort[j]).className="selected";
				url=url+"&sortName="+sortName[j];
				//alert(parameter);
			}
		else if(document.getElementById(sort[j]).className == "selected")
			{
				if(type == 2)
					{
						document.getElementById(sort[j]).className="unselected";
					}
				else
					{
						url=url+"&sortName="+sortName[j];
					}
			}
	}
	var searchFuzzy = document.getElementById("search-kw").value;
	if(searchFuzzy == "")
		{
			searchFuzzy = "false";
		}
	url=url+"&fuzzyStr="+searchFuzzy;
	//alert(url);
	window.location.href=encodeURI(url);
}