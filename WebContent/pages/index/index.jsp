<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="zhou.database.*"%>
<%@page import="zhou.dao.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//当前URL
	String url = request.getRequestURL().toString()+"?";
	if(request.getQueryString() != null)
	{
		url+=request.getQueryString()+"&";	
	}

	// 获取商品信息
	String categoryName = request.getParameter("categoryName");	
	String sortName = request.getParameter("sortName");
	String fuzzyStr = request.getParameter("fuzzyStr");
	
	
	//获取加入购物车相关信息
	String commodityId = request.getParameter("commodityID");
	String userPhoneNum = request.getParameter("userPhoneNum");

	if(commodityId != null && userPhoneNum != null)
	{
		new DataProcess(application.getInitParameter("DBName")).InsertcommodityToshoppingCart(userPhoneNum,commodityId,"1"); 
	}
	
	if(categoryName != null && sortName != null)
	{
		session.setAttribute("categoryName", categoryName);
		session.setAttribute("sortName", sortName);
		session.setAttribute("fuzzyStr", fuzzyStr);
	}
	else
	{
		categoryName = (String)session.getAttribute("categoryName");
		sortName = (String)session.getAttribute("sortName");
		fuzzyStr = (String)session.getAttribute("fuzzyStr");
	}
	String logout = request.getParameter("logout");
	ArrayList<Commodity> commodityList =null;
	User user = (User)session.getAttribute("userInfo");
	if(user != null)
	{
//		System.out.println(logout);
		if(logout != null && logout.equals("1"))
		{
			session.setAttribute("userInfo",null);
		}
	}
//	if(user != null)
//	System.out.println(user.userName);
	request.removeAttribute("commodityList");
	if(categoryName == null)
	{
		commodityList = new DataProcess(application.getInitParameter("DBName")).getCommodityInfo("全部", "默认", "false");
	}
	else
	{
//		System.out.println(categoryName);
//		System.out.println(sortName);
//		System.out.println(fuzzyStr);
		commodityList = new DataProcess(application.getInitParameter("DBName")).getCommodityInfo(categoryName, sortName,fuzzyStr);
	}
	//System.out.println(commodityList.size());
	request.setAttribute("commodityList", commodityList);
//	for (Commodity commodity : commodityList) {
//		System.out.println(commodity.getCommodityID());
//		System.out.println(commodity.getCommodityName());
//		System.out.println(commodity.getCommodityType());
//		System.out.println(commodity.getCommodityPrice());
//		System.out.println(commodity.getCommodityAddressOfImage());
//		System.out.println(commodity.getCommodityNumberOfComment());
//		System.out.println(commodity.getCommodityAddTime());
//		System.out.println(commodity.getCommodityDescription());
//		System.out.println("----------------------------------------");
//	}
//	System.out.println(commodityList.size());
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall</title>
<link rel="shortcut icon" href="../images/icon/aha64.ico">
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script src="link.js"></script>
<script src="showDialog.js"></script>
</head>
<body class="wide" onLoad="load();">
<div class="header">
    <div class="layout">
        <div class="left">
            <div class="logo">
            <a href="../index/index.jsp" title="AhaMall">
            <img src="../images/icon/aha256.png" alt="AhaMall">
            </a>
            </div>
				<div class="shortcut">
					<div class="layout">
						<div class="s-main " style="margin-top: 10px;">
				            <ul>
				                <li>
				                    <div class="s-dropdown">
				                        <div class="h h-wide" >
				                        <c:if test="${empty sessionScope.userInfo}">
				                            <a href="../login/login.htm">请登录</a>
				                         </c:if>
				                         <c:if test="${not empty sessionScope.userInfo}">
				                            ${sessionScope.userInfo.userName}
				                         </c:if>
				                        </div>
				                    </div>
				                </li>
				             	<li>
				                    <div class="s-dropdown">
				                        <div class="h h-wide" >
				                        <c:if test="${empty sessionScope.userInfo}">
				                            <a href="../register/register.htm">注册</a>
				                         </c:if>
				                         <c:if test="${not empty sessionScope.userInfo}">
				                            <a href="../index/index.jsp?logout=1">注销</a>
				                         </c:if>
				                        </div>
				                    </div>
				                </li>
				                <li>
				                    <div class="s-dropdown">
				                        <div class="h h-wide" >
				                            <a href="../toBeDevelop/toBeDevelop.htm">我的订单</a>
				                        </div>
				                        </div>
				                </li>
				                <li>
				                    <div class="s-dropdown">
				                        <div class="h h-wide" >
				                            <a href="../shoppingCart/shoppingCart.jsp" class="icon-minicart">
				                                <span>购物车<span id="header-cart-total" class="hide">(0)</span></span>
				                            </a>
				                        </div>
				                    </div>
				                </li>
				            </ul>
        				</div>
    				</div>
				</div>
			</div>
		</div>
	</div>
<div class="hr-10"></div>
<div class="shortcut">
	<div class="layout">
        <div class="breadcrumb-area fcn" style="color: #333333; float: left;">
       商品&nbsp;&gt;&nbsp;
   <span>尽情选购吧</span>
	</div>
	<div class="right">
       	<div class="search-bar relative" id="searchBar-area">
           	<div class="search-bar-form" id="search-bar-form">
                   <input class="text" placeholder="搜索商品" maxlength="16" id="search-kw" type="text">
                   <input class="button" value="搜索" onClick="onClickLink('fuzzy',3);">
               	</div>
           	</div>
       	</div>
   	</div>
</div>	
<div class="hr-10"></div>
<div class="layout">
	<div class="pro-cate-area">
		<div class="pro-cate-attr clearfix">
			<div class="p-title">分类：</div>
			<div class="p-default">
				<ul>
                    <li id="category-0" class="selected"><a href="javascript:onClickLink('category-0',1);" >全部</a></li>
				</ul>
			</div>
			
			<!-- 二级虚拟分类 -->
			<div class="p-values">
				<!-- 一行的高度为30px,显示n行，p-expand的高度为nx30 -->
				<div class="p-expand">
					<ul class="clearfix">					
	                    <li id="category-1"><a href="javascript:onClickLink('category-1',1);">手机</a></li>
	                    <li id="category-2"><a href="javascript:onClickLink('category-2',1);">笔记本</a></li>
	                    <li id="category-3"><a href="javascript:onClickLink('category-3',1);">平板</a></li>
	                    <li id="category-4"><a href="javascript:onClickLink('category-4',1);">智能穿戴</a></li>
	                    <li id="category-5"><a href="javascript:onClickLink('category-5',1);">配件</a></li>
					</ul>
				</div>
			</div>	
		</div>
			
		<div class="pro-cate-sort clearfix">
			<div class="p-title">排序：</div>
			<div class="p-default">
				<ul>
					<li id="sort-0" class="selected"><a href="javascript:onClickLink('sort-0',2);">默认</a></li>
				</ul>
			</div>
			<div class="p-values">
				<div class="p-expand">					
					<ul class="clearfix">
						<li id="sort-1"><a href="javascript:onClickLink('sort-1',2);" class="sort-price" >价格</a></li>
						<li id="sort-2"><a href="javascript:onClickLink('sort-2',2);" class="sort-eval"  >评价数</a></li>
						<li id="sort-3"><a href="javascript:onClickLink('sort-3',2);" class="sort-added" >上架时间</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="hr-20"></div>			
<div class="layout">
	<c:if test="${empty requestScope.commodityList}">
		<div class="pro-cate-null">
			            抱歉，没有找到<span class="red"> <%=fuzzyStr %> </span>的相关商品!
			</div>
	</c:if>
	<div id="cart-tips" class="pro-popup-area hide" >
		<div class="b" style="display: block;">
			<div class="pro-add-success">
				<dl>
					<dt><b style="background-position:-34px 0" id="IconTip"></b></dt>
					<dd>
						<div class="pro-add-success-msg" id="CartTip">成功加入购物车!</div>
					</dd>
					<!--
					 <dt><b style="background-position:-116px 0"></b></dt>
					<dd>
						<div class="pro-add-success-msg" style="color: #e01d20;">操作失败，请登录后再试！</div>
					</dd>
					 -->
				</dl>					
			</div>
		</div>
	</div>
	<!-- 
	<div id="comment-tips" class="pro-popup-area hide" >
		<div class="b" style="display: block;">
			<dl>
				<dd>
					<div class="pro-add-success-msg" align="center" style="color: #e01d20">暂时还没有评论！</div>
				</dd>
			</dl>					
		</div>
	</div>
	 -->
    <div class="channel-list">
		<div class="pro-list clearfix">
			<ul>
			<c:if test="${not empty requestScope.commodityList}">
				<c:forEach items="${requestScope.commodityList}" var="commodity" >
				<li>
					<div class="pro-panels">
						<p class="p-img"><a  href="../comment/comment.jsp?commodityID=${commodity.commodityID}&commodityName=${commodity.commodityName}" 
						title="${commodity.commodityDescription}" >
						<img alt="${commodity.commodityDescription}" src="../images/${commodity.commodityAddressOfImage}"></a></p>
						<p class="p-name"><a href="../comment/comment.jsp?commodityID=${commodity.commodityID}&commodityName=${commodity.commodityName}"
						 title="${commodity.commodityDescription}" >${commodity.commodityDescription}<span class="red"></span></a></p>
						<p class="p-price"><b>¥&nbsp;${commodity.commodityPrice}</b></p>
						<c:if test="${commodity.commodityIsRecommend == 1}">
						<b class="p-tag"><img alt="" src="sell.png"></b>
						</c:if>
						<div class="p-button clearfix">
							<table border="1">
								<tbody>
									<tr>
									<td>
									<c:if test="${not empty sessionScope.userInfo}">
									<a href="<%=url%>commodityID=${commodity.commodityID}&userPhoneNum=<%=user.phoneNum%>&status=1"  class="p-button-cart"><span>加入购物车</span></a>
									</c:if>
									<c:if test="${empty sessionScope.userInfo}">
									<a href="javascript:;" onclick="return showCartDialog(2);" class="p-button-cart"><span>加入购物车</span></a>
									</c:if>
									</td>
										<td><label class="p-button-score"><span id="numOfComment">${commodity.commodityNumberOfComment}</span>人评价</label></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</li>
				</c:forEach>
			</c:if>
			</ul>
		</div>
    </div>
    
</div>
<div class="slogan-container">
    <div class="slogan">
        <p>Copyright © 2012-2018 Aha. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>