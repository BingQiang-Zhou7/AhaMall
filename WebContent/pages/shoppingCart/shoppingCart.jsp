<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="zhou.dao.*"  %>
<%
	String logout = request.getParameter("logout");
	User user = (User)session.getAttribute("userInfo");
	if(user != null)
	{
		if(logout != null && logout.equals("1"))
		{
			session.removeAttribute("userInfo");
		}
	}
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall Shopping Cart</title>
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body class="wide sc">
<div class="header">
    <div class="layout">
        <div class="left">
            <div class="logo"><b style="font-size: 28px">AhaMall</b></div>
        </div>
    <div class="shortcut">
		<div class="s-main " style="margin-top: 10px;">
            <ul>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" id="header-toolbar-minicart">
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
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <c:if test="${empty sessionScope.userInfo}">
	                            <a href="../register/register.htm">注册</a>
	                         </c:if>
	                         <c:if test="${not empty sessionScope.userInfo}">
	                            <a href="../shoppingCart/shoppingCart.jsp?logout=1">注销</a>
	                         </c:if>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <a href="../toBeDevelop/toBeDevelop.htm">我的订单</a>
                        </div>
                        </div>
                </li>
            </ul>
        </div>
    </div>
	</div>
</div>
<div class="layout">
<!-- 
	<c:if test="${empty sessionScope.userInfo}">
        <div id="login-prompt-cart" class="login-prompt" style="">您还没有登录！登录后可查看之前加入的商品
   			<a id="top-index-loginUrl" href="../login/login.htm">登录</a>
   		</div>                   
	</c:if>
	<div class="hr-20"></div>
 -->	
<div class="sc-list">
<c:if test="${empty sessionScope.userInfo}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>您还没有登录！登录后可查看之前加入的商品~</p>
            <a href="../login/login.jsp">登录</a>
        </div>
</c:if>
<!-- TODO 购物车没有物品 -->
<c:if test="${not empty sessionScope.userInfo}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>您的购物车里什么也没有哦~</p>
            <a href="../index/index.jsp">登录</a>
        </div>
</c:if>        
<c:if test="${empty sessionScope.userInfo}">
		<div class="sc-pro-title clearfix" id="shopping-cart-product-list">
			<label><i class="icon-choose-normal icon-choose-all icon-choose" id="checkAll-top"></i>全选</label>
			<ul class="clearfix">
                <li>商品</li> 
                <li>单价</li>
                <li>数量</li>
                <li>小计</li>
                <li>操作</li>
			</ul>
		</div>
        <form id="cart-form" autocomplete="off" method="get">
        	<div id="cart-list"><!--product-list start-->
        		<div class="sc-pro"><!--单品start-->
        			<div class="sc-pro-list clearfix" id="order-pro-10086431508342">
        				<i class="icon-choose-normal " id="icon-choose-10086431508342" onclick="ec.shoppingCart.check(this);" >
        				</i>
        				<div class="sc-pro-area " id="sc-pro-area-10086431508342">
        					<div class="sc-pro-main clearfix"><!--至灰时添加class="disabled"-->
        							<img class="p-img" alt="荣耀10&nbsp;AI摄影手机&nbsp;6GB+64GB&nbsp;幻影蓝&nbsp;全网通&nbsp;双卡双待&nbsp;高配版" src="1.jpg">
        							<span></span>
        						<ul>            
        							<li>            
        								<p class="p-name">荣耀10&nbsp;AI摄影手机&nbsp;6GB+64GB&nbsp;幻影蓝&nbsp;全网通&nbsp;双卡双待&nbsp;高配版</p>                
        								<p class="p-sku" style="display: none;">
        									<em>版本：全网通&nbsp;6GB+64GB</em>
        									<em>颜色：幻影蓝</em>
        								</p>                        
        							</li>            
        							<li>                
        								<div class="p-price">            
        									<span>¥&nbsp;2599.00</span>                
        								</div>
        									<div id="popup-area" class="popup-area popup-define-area" style="position: absolute; top: -12px; left: 70%">
        									<div class="b"><p>您确认要删除该商品吗？ </p> <div class="popup-button-area">
        									<a href="javascript:;" class="button-action-yes"><span>是</span></a> 
        									<a href="javascript:;" class="button-action-no"><span>否</span></a></div></div> 
	        									<div class="f">
	        									<b class="icon-arrow-down">
	        									</b>
	        									</div>
        									</div>            
        							</li>            
        							<li>                
        								<div class="p-stock">
        									<div class="p-stock-area">                    
        										<input id="quantity-10086431508342" class="p-stock-text" value="1" data-skuid="10086431508342" data-type="1"  style="ime-mode: disabled;" type="text">
        										<p class="p-stock-btn" id="p-stock-btn-area">
        											<a id="pro-quantity-plus" href="javascript:;">+</a>
        											<a id="pro-quantity-minus" href="javascript:;" class="disabled">−</a>
        										</p>
        									</div>          
        								</div>
        								</li>            
        								<li class="p-price-total" id="p-price-total-10086431508342">¥&nbsp;2599.00
        								</li>            
        								<li>
        									<a href="javascript:;" class="p-del" onclick="ec.shoppingCart.del(this , 10086431508342,1)">删除
        									</a>
        								</li>
        							</ul>
        						</div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</form>
        <div id="locationForEnd"></div>
        <div id="center_balance" class="">
        	<div id="cart-total-area" class="sc-total-tool layout clearfix ">
        		<div class="sc-total-control">
        			<label><i class="icon-choose-normal icon-choose-all" id="checkAll-buttom"></i>全选</label>
        		</div>
        		<div class="sc-total-btn ">
        			<a href="../toBeDevelop/toBeDevelop.htm" >立即结算</a>
        		</div>
        		<div class="sc-total-price">
        			<p><label>总计：</label>
        				<span id="sc-cartInfo-totalOriginalPrice">¥&nbsp;0.00</span>
        			</p>
        	</div>
        </div>
   </div>
</c:if>
</div>
</div>
<div class="slogan-container">
    <div class="slogan">
        <p>Copyright © 2012-2018 Aha. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>