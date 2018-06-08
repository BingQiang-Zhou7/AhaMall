<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall</title>
<link rel="shortcut icon" href="pages/images/icon/aha64.ico">
<link href="pages/showCommodityDetail/ec.css" rel="stylesheet" type="text/css">
<link href="pages/showCommodityDetail/main_002.css" rel="stylesheet" type="text/css">
<link href="pages/showCommodityDetail/main.css" rel="stylesheet" type="text/css">
<link href="pages/showCommodityDetail/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="pages/showCommodityDetail/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="pages/showCommodityDetail/showCommodityDetail.js"></script>
</head>
<body class="wide detail" onload="load();">
<div class="header">
    <div class="layout">
        <div class="left">
            <div class="logo">
            <a href="IndexServlet" title="AhaMall">
            <img src="pages/images/icon/aha256.png" alt="AhaMall">
            </a>
            </div>
                <div class="shortcut">
                    <div class="layout">
                        <div class="s-main " style="margin-top: 10px;">
                            <ul>
                                <li>
                                    <div class="s-dropdown">
                                        <div class="h h-wide">
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
                                        <div class="h h-wide">
                                        <c:if test="${empty sessionScope.userInfo}">
                                            <a href="pages/register/register.htm">注册</a>
                                         </c:if>
                                         <c:if test="${not empty sessionScope.userInfo}">
                                            <a href="ShowCommodityDetailServlet?logout=1&commodityID=${commodity.commodityID}">注销</a>
                                         </c:if>
                                        </div>
                                    </div>
                                </li>
                                <c:if test="${not empty sessionScope.userInfo}">
                                <li>
                                    <div class="s-dropdown">
                                        <div class="h h-wide">
                                            <a href="OrderServlet">我的订单</a>
                                        </div>
                                        </div>
                                </li>
                                </c:if>
                                <li>
                                    <div class="s-dropdown">
                                        <div class="h h-wide">
                                            <a href="ShoppingCartServlet" class="icon-minicart">
                                                <span>购物车</span>
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
<div class="g">
	<div class="breadcrumb-area fcn"><a href="IndexServlet" title="首页">首页</a>&nbsp;&gt;&nbsp;
	<span id="bread-pro-name">${commodity.commodityTitle}</span></div>
	<div class="line"></div>
</div>
<div class="hr-10"></div>
<div class="product clearfix">
    <div class="left">
        <div class="product-gallery">
        	<div class="relative">
        		<div class="product-gallery-img" id="pic-container">
	            		<img src="pages/images/${commodity.commodityAddressOfImage}" alt="${commodity.commodityTitle}" style="display: block;">
	            </div>
            </div>
        </div>
    </div>
    <div class="right relative">
    	<div id="cart-tips" class="pro-popup-area hide">
	    <div class="b">
			<div class="pro-add-success">
				<dl>
				<dt><b></b></dt>
					<dd>
						<p>${commodity.commodityTitle}</p>
						<div class="pro-add-success-msg">成功加入购物车!</div>
						<div class="pro-add-success-button">
						<a id="button_go_cart" href="ShoppingCartServlet" class="button-style-1 button-go-cart">去结算</a>
						<a id="button_continue_look" class="button-style-4 button-walking" href="javascript:;">继续逛逛&nbsp;&gt;&gt;</a></div>									
					</dd>
				</dl>					
			</div>
	    </div>
	</div>
		<div id="cart-error-tips" class="pro-popup-area hide" >
		<div class="b" style="display: block;">
			<div class="pro-add-success">
				<dl>
					 <dt><b style="background-position:-116px 0"></b></dt>
					<dd>
						<div class="pro-add-success-msg" style="color: #e01d20;">操作失败，请登录后再试！</div>
					</dd>
				</dl>					
			</div>
		</div>
	</div>
        <div class="product-property clearfix relative">
        	<div id="product-property-recommand">
            <div class="product-meta">
                <h1 id="pro-name">${commodity.commodityTitle}</h1>
                <input class="hide" value="10086671638910" id="product_sku">
                <input class="hide" value="10086291890006" id="product_productId">
                <div class="product-slogan" id="skuPromWord" style="display: -webkit-box;">
                 <span>${commodity.commodityDescription}</span></div>
            </div>
            <div class="product-info">
                <div class="product-info-list clearfix">
                <label>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</label>
                    <div class="product-price clearfix">
                        <div class="product-price-info">
                              <span id="pro-price-label" class="f24" style="display: none;"></span>
                              <span id="pro-price" class="f24"><em>¥</em>${commodity.commodityPrice}</span>
                        </div> 
                    </div>
                </div>
            </div>
			<div class="hr-20"></div>
	            <div class="product-pulldown clearfix product-description" id="product-pulldown1">
	                <label>商品编码</label>
	                <div class="fl">
			    	<div class="product-description clearfix">
						<p>${commodity.commodityID}</p>
			            </div>
			         </div>
	            </div>
            <div class="hr-5"></div>
            <!-- 20171024-商品简介-商品编码-start -->
            <div class="product-description clearfix">
                <label>上架时间</label>
                <div class="fl" id="pro-sku-code2">${commodity.commodityAddTime}</div>
            </div>
            <div class="hr-7"></div>
            <div class="line"></div>
            <div class="hr-16"></div>
			<div class="product-operation-main" style="min-height: 49px;">
            	<div id="product-operation" class="product-operation relative" style="display: block;">
               	 	<div class="clearfix">
                    	<div class="product-stock hide" id="pro-quantity-area-nochange" style="display: block;">
                    		<input class="product-stock-text" id="product-text" placeholder="1" value="1" readonly="readonly" type="text">
                    		<p class="product-stock-btn"><a href="javascript:;" id="plus" class="">+</a>
                    		<a href="javascript:;" id="reduce" class="disabled">−</a></p>
                    	</div>
						<div class="product-buttonmain">
	                    	<div id="pro-operation" class="product-button clearfix" style="visibility: visible;">
	                    	<c:if test="${not empty sessionScope.userInfo}">
	                    	<a class="product-button02" onclick="return showCartDialog({id:'${commodity.commodityID}'});"><span>加入购物车</span></a>
							</c:if>
							<c:if test="${empty sessionScope.userInfo}">
							<a href="javascript:;" onclick="return showCartDialog({id:404});" class="product-button02"><span>加入购物车</span></a>
							</c:if>
	                    	</div>
		            	</div>    
	                </div>
            	</div>
            </div>
        </div>
    </div>
</div>
<div class="hr-20"></div>
<div class="line"></div>
<div class="layout">		
    <div id="product-relation-area" class="product-relation">
        <h2 class="product-title01">关联商品<em></em></h2>
        <div id="pro-relation-main" class="product-relation-main relative">
            <div class="product-relation-thumbs swiper-container" id="pro-relation-scroll">
                <ul class="grid-list swiper-wrapper">
                <c:forEach items="${requestScope.commodityList}" var="recommendCommodity">
	                    <li data-id="10086262026261" class="swiper-slide swiper-slide-visible swiper-slide-active">
	                    <img src="pages/images/${recommendCommodity.commodityAddressOfImage}" alt="${recommendCommodity.commodityTitle}">
	                     <div class="product-relation-detail">
                            <a href="ShowCommodityDetailServlet?commodityID=${recommendCommodity.commodityID}" title="${recommendCommodity.commodityTitle}">
	                            <span>${recommendCommodity.commodityTitle}</span>
	                            <br><em>¥${recommendCommodity.commodityPrice}</em>
	                        </a>
	                        </div>
	                    </li>
				</c:forEach>
                </ul>
            </div>
            <a href="javascript:;" class="product-relation-forward btn-next swiper-button-next disabled" style="display: none;"></a>
        </div>
    </div>
</div>

<div class="product-tab" id="product-tab" style="position: static; top: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; width: 100%; z-index: 100;"><!--移到顶部的时候添加class="product-tab-top"-->
    <div class="layout relative" id="layoutRelative">
        <p>
            <a href="javascript:;" id="pro-tab-evaluate" class="selected" style="float: left;">用户评价</a>
        </p>
    </div>
</div>
<div id="productCommentId" class="layout">
	     <div class="product-comment">
        <ul id="pro-msg-list" class="product-comment-list">
        <c:if test="${not empty requestScope.commentList}">
        <li class="clearfix"></li>
        <c:forEach items="${requestScope.commentList}" var="comment">
        <li class="clearfix">
        	<div class="product-comment-user"><p class="product-comment-user-img">
        	<img src="pages/comment/defaultface_user_after.png" alt="defaultface_user_after.png">
        	<i class="icon-vip-level-3"></i></p><p class="product-comment-user-name">${comment.userPhoneNum}</p>
        	</div>
        	<div class="product-user-comment">
        		<div class="product-user-comment-detial">
        			<div class="h clearfix">
        				<div class="product-star"><span class="starRating-area"><b style="width:100%"></b></span>
        				</div>
        			</div>
        			<div class="product-user-comment-word" id="10086855140565-38760693648105">${comment.commentConent}</div>
        			<div class="product-user-comment-time">${comment.commentTime}</div>
        		</div>
   		 	</div>
   		 </li>
   		 </c:forEach>
   		 <li class="clearfix"></li>
   		 </c:if>
		</ul>
		<c:if test="${empty requestScope.commentList}">
        	     <div class="product-comment">
        			<div class="product-comment-no hide" id="product-remark-comment-no" style="display: block;">该商品暂无评价</div>
    			</div> 
        </c:if>
        </div>
    </div>
</div>
<div class="slogan-container">
    <div class="slogan">
        <p>Copyright © 2012-2018 Aha. All Rights Reserved.</p>
    </div>
</div>
</body></html>