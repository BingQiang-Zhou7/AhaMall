<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall Shopping Cart</title>
<link rel="shortcut icon" href="pages/images/icon/aha64.ico">
<link href="pages/shoppingCart/ec.css" rel="stylesheet" type="text/css">
<link href="pages/shoppingCart/index.css" rel="stylesheet" type="text/css">
<link href="pages/shoppingCart/main.css" rel="stylesheet" type="text/css">
<link href="pages/shoppingCart/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pages/shoppingCart/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="pages/shoppingCart/shoppingCart.js"></script>
</head>
<body class="wide sc" onload="load();">
<div class="header">
    <div class="layout">
        <div class="left">
            <div class="logo">
            <a href="IndexServlet" title="AhaMall">
            <img src="pages/images/icon/aha256.png" alt="AhaMall">
            </a>
            </div>
        </div>
    <div class="shortcut">
		<div class="s-main " style="margin-top: 10px;">
            <ul>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <c:if test="${empty sessionScope.userInfo}">
	                            <a href="pages/login/login.htm">请登录</a>
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
	                            <a href="pages/register/register.htm">注册</a>
	                         </c:if>
	                         <c:if test="${not empty sessionScope.userInfo}">
	                            <a href="shoppingCartServlet?logout=1">注销</a>
	                         </c:if>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <a href="IndexServlet">商城主页</a>
                        </div>
                        </div>
                </li>
                <c:if test="${not empty sessionScope.userInfo}">
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" >
                            <a href="OrderServlet">我的订单</a>
                        </div>
                        </div>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
	</div>
</div>
	<div id="cart-tips" class="pro-popup-area hide">
		<div class="b" style="display: block;">
			<div class="pro-add-success">
				<dl>
					<dt><b style="background-position:-34px 0; float: left;" id="IconTip"></b></dt>
					<dd>
						<div class="pro-add-success-msg">购买成功！</div>
					</dd>
				</dl>					
			</div>
		</div>
	</div>
<div class="layout">
<div class="myEval-detail-tips red hide" id="NoSelectTip">请选择商品后，再结算！</div>	
<div class="sc-list">
<c:if test="${empty sessionScope.userInfo}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>您还没有登录！登录后可查看之前加入的商品~</p>
            <a href="pages/login/login.htm">登录</a>
        </div>
</c:if>
<!-- TODO 购物车没有物品 -->     
<c:if test="${not empty sessionScope.userInfo}">
<c:if test="${empty requestScope.commodityCart}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>您的购物车里什么也没有哦~</p>
            <a href="IndexServlet">去逛逛</a>
        </div>
</c:if>
<c:if test="${not empty requestScope.commodityCart}">
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
		<c:forEach items="${requestScope.commodityCart}" var="commodity">
        <form id="cart-form" autocomplete="off" method="get">
        	<div id="cart-list"><!--product-list start-->
        		<div class="sc-pro"><!--单品start-->
        			<div class="sc-pro-list clearfix">
        				<i class="icon-choose-normal icon-choose ${commodity.commodityID}"></i>
        				<div class="sc-pro-area ">
        					<div class="sc-pro-main clearfix">
        							<img class="p-img" alt="${commodity.commodityDescription}" src="pages/images/${commodity.commodityAddressOfImage}">
        						<ul>            
        							<li>            
        								<p class="p-name">${commodity.commodityDescription}</p>                
        								<!-- <p class="p-sku" style="display: none;">
        									<em>版本：全网通&nbsp;6GB+64GB</em>
        									<em>颜色：幻影蓝</em>
        								</p>  
        								-->                       
        							</li>            
        							<li>                
        								<div class="p-price">            
        									<span>¥&nbsp;${commodity.commodityPrice}</span>                
        								</div>         
        							</li>            
        							<li>                
        								<div class="p-stock">
        									<div class="p-stock-area">                    
        										<input class="p-stock-text ${commodity.commodityName}" value="${commodity.commodityNumber}"  style="ime-mode: disabled;" type="text">
        										<p class="p-stock-btn" id="p-stock-btn-area">
        											<a class="pro-quantity-plus" 
        											href="${requestScope.url}?commodityId=${commodity.commodityID}&numOfCommodity=${commodity.commodityNumber+1}">+</a>
        											<a class="pro-quantity-minus ${commodity.commodityName} disabled" 
        											href="${requestScope.url}?commodityId=${commodity.commodityID}&numOfCommodity=${commodity.commodityNumber-1}">−</a>
        										</p>
        									</div>          
        								</div>
        								</li>            
        								<li class="p-price-total ${commodity.commodityID}">¥&nbsp;${ commodity.commodityNumber*commodity.commodityPrice}
        								</li>            
        								<li>
        									<a href="javascript:;" class="p-del">删除
        									</a>
        									<div id="popup-area" class="popup-area popup-define-area hide" style="position: absolute; top: -12px; left: 70%">
        									<div class="b"><p>您确认要删除该商品吗？ </p> 
        									<div class="popup-button-area">
        									<a href="${requestScope.url}?commodityId=${commodity.commodityID}" class="button-action-yes">
        									<span>是</span></a> 
        									<a href="javascript:;" class="button-action-no"><span>否</span></a>
        									</div>
        									</div> 
	        									<div class="f">
	        									<b class="icon-arrow-down">
	        									</b>
	        									</div>
        									</div>   
        								</li>
        							</ul>
        						</div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</form>
        </c:forEach>
        <div id="locationForEnd"></div>
        	<div id="cart-total-area" class="sc-total-tool layout clearfix ">
        		<div class="sc-total-control">
        			<label><i class="icon-choose-normal icon-choose-all icon-choose" id="checkAll-buttom"></i>全选</label>
        			<a href="javascript:;" class="p-del-all">清空购物车</a>
        		</div>
        		<div id="popup-area" class="popup-area popup-define-area hide"  style="position: absolute;width: 20%;top:30%;left: 40%">
						<div class="b"><p>您确认要清空购物车吗？ </p> 
							<div class="popup-button-area">
								<a href="${requestScope.url}?commodityId=all" class="button-action-yes"><span>是</span></a> 
								<a href="javascript:;" class="button-action-no"><span>否</span></a>
							</div>
						</div> 
					</div> 
        		<div class="sc-total-btn">
        			<a href="javascript:;" id="buyCommodity">立即结算</a>
        		</div>
        		<div class="sc-total-price">
        			<p><label>总计：</label>
        				<span>¥&nbsp;<label id="sc-cartInfo-totalOriginalPrice">0.00</label></span>
        			</p>
        	</div>
   </div>
   	</c:if>
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