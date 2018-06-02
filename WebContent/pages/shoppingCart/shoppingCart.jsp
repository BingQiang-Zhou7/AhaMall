<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="zhou.database.*" %>
    <%@page import="zhou.dao.*"  %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//更新购物车商品数据
	String commodityId = request.getParameter("commodityId");
	String numOfCommodity = request.getParameter("numOfCommodity");
	//退出登录 以及 获取购物车商品信息
	String logout = request.getParameter("logout");
	String url = request.getRequestURI();//获取当前链接
	User user = (User)session.getAttribute("userInfo");//获取用户信息
	ArrayList<Commodity> commodityCart =null;
	if(user != null)
	{
		if(logout != null && logout.equals("1"))
		{
			session.removeAttribute("userInfo");
		}
		else{
			//删除商品 以及清空购物车
			if(commodityId != null && numOfCommodity == null)
			{
				new DataProcess(application.getInitParameter("DBName")).DeleteCommodityToShoppingCart(user.phoneNum, commodityId);
			}
			//加减商品
			else if(commodityId != null && numOfCommodity != null && Integer.parseInt(numOfCommodity) > 0)
			{
				new DataProcess(application.getInitParameter("DBName")).UpdateCommodityToShoppingCart(user.phoneNum, commodityId, numOfCommodity);
			}
			//查询用户购物车商品
			commodityCart = new DataProcess(application.getInitParameter("DBName")).getCartCommodityInfo(user.phoneNum);
			request.setAttribute("commodityCart", commodityCart);
//			for (Commodity commodity : commodityCart) {
//				System.out.println(commodity.getCommodityID());
//				System.out.println(commodity.getCommodityName());
//				System.out.println(commodity.getCommodityType());
//				System.out.println(commodity.getCommodityPrice());
//				System.out.println(commodity.getCommodityAddressOfImage());
//				System.out.println(commodity.getCommodityNumberOfComment());
//				System.out.println(commodity.getCommodityAddTime());
//				System.out.println(commodity.getCommodityDescription());
//				System.out.println(commodity.getCommodityIsRecommend());
//				System.out.println(commodity.getCommodityNumber());
//				System.out.println("----------------------------------------");
//			}
		}
	}
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall Shopping Cart</title>
<link rel="shortcut icon" href="../images/icon/aha64.ico">
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="shoppingCart.js"></script>
</head>
<body class="wide sc" onload="load();">
<div class="header">
    <div class="layout">
        <div class="left">
            <div class="logo">
            <a href="../index/index.jsp" title="AhaMall">
            <img src="../images/icon/aha256.png" alt="AhaMall">
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
                            <a href="../index/index.jsp">商城主页</a>
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
<div class="sc-list">
<c:if test="${empty sessionScope.userInfo}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>您还没有登录！登录后可查看之前加入的商品~</p>
            <a href="../login/login.htm">登录</a>
        </div>
</c:if>
<!-- TODO 购物车没有物品 -->     
<c:if test="${not empty sessionScope.userInfo}">
<c:if test="${empty requestScope.commodityCart}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>您的购物车里什么也没有哦~</p>
            <a href="../index/index.jsp">去逛逛</a>
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
        							<img class="p-img" alt="${commodity.commodityDescription}" src="../images/${commodity.commodityAddressOfImage}">
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
        											href="<%=url %>?commodityId=${commodity.commodityID}&numOfCommodity=${commodity.commodityNumber+1}">+</a>
        											<a class="pro-quantity-minus ${commodity.commodityName} disabled" 
        											href="<%=url %>?commodityId=${commodity.commodityID}&numOfCommodity=${commodity.commodityNumber-1}">−</a>
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
        									<a href="<%=url %>?commodityId=${commodity.commodityID}" class="button-action-yes">
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
	</c:if>
        <div id="locationForEnd"></div>
        	<div id="cart-total-area" class="sc-total-tool layout clearfix ">
        		<div class="sc-total-control">
        			<label><i class="icon-choose-normal icon-choose-all icon-choose" id="checkAll-buttom"></i>全选</label>
        			<a href="javascript:;" class="p-del-all">清空购物车</a>
        		</div>
        		<div id="popup-area" class="popup-area popup-define-area hide"  style="position: absolute;width: 20%;top:30%;left: 40%">
						<div class="b"><p>您确认要清空购物车吗？ </p> 
							<div class="popup-button-area">
								<a href="<%=url %>?commodityId=all" class="button-action-yes"><span>是</span></a> 
								<a href="javascript:;" class="button-action-no"><span>否</span></a>
							</div>
						</div> 
					</div> 
        		<div class="sc-total-btn ">
        			<a href="../toBeDevelop/toBeDevelop.htm" >立即结算</a>
        		</div>
        		<div class="sc-total-price">
        			<p><label>总计：</label>
        				<span>¥&nbsp;<label id="sc-cartInfo-totalOriginalPrice">0.00</label></span>
        			</p>
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