<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall Comment</title>
<link rel="shortcut icon" href="pages/images/icon/aha64.ico">
<link href="pages/comment/ec.css" rel="stylesheet" type="text/css">
<link href="pages/comment/main.css" rel="stylesheet" type="text/css">
<link href="pages/comment/main_002.css" rel="stylesheet" type="text/css">
<link href="pages/comment/style.css" rel="stylesheet" type="text/css">
</head>
<body class="wide detail" >
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
				                            <a href="CommentServlet?logout=1">注销</a>
				                         </c:if>
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
				                <li>
				                    <div class="s-dropdown">
				                        <div class="h h-wide" >
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

    <div class="shortcut">
    <div class="layout">
            <div class="breadcrumb-area fcn" style="color: #333333; float: left;">
            <a href="IndexServlet">首页</a>&nbsp;&gt;&nbsp;
        <span>${commentList[0].commodityName}</span>
    </div>
    </div>
		</div>
<div id="productCommentId" class="layout">
	<!-- 评价筛选标签 -->
     <div class="product-comment">
         <!--用户评价-->
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
      			<div class="product-comment-no" id="product-remark-comment-no" style="display: block;">该商品暂无评价</div>
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