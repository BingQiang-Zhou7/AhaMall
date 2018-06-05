<%@page import="java.util.ArrayList"%>
<%@page import="zhou.database.*"%>
<%@page import="zhou.dao.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//��ȡ��Ʒ��Ϣ
	String commodityID = request.getParameter("commodityID");
	User user = (User)session.getAttribute("userInfo");
	String logout = request.getParameter("logout");
	if(user != null)
	{
	//	System.out.println(logout);
		if(logout != null && logout.equals("1"))
		{
			session.setAttribute("userInfo",null);
			response.sendRedirect("../index/index.jsp");
		}
	}
	ArrayList<Comment> commentList =null;
	request.removeAttribute("commentList");
	if(commodityID != null)
	{
		commentList = new DataProcess(application.getInitParameter("DBName")).getCommentInfo(commodityID);
	}
	//System.out.println(commodityList.size());
//	if(commentList != null)
//	{		
///		for (Comment comment : commentList) {
//			System.out.println(comment.getCommentConent());
//			System.out.println(comment.getCommentTime());
//			System.out.println(comment.getCommodityName());
//			System.out.println(comment.getUserPhoneNum());
//			System.out.println("----------------------------------------");
//		}
//	}
	
	request.setAttribute("commentList", commentList);
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall Comment</title>
<link rel="shortcut icon" href="../images/icon/aha64.ico">
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
<link href="main_002.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body class="wide detail" >
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
				                            <a href="../login/login.htm">���¼</a>
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
				                            <a href="../register/register.htm">ע��</a>
				                         </c:if>
				                         <c:if test="${not empty sessionScope.userInfo}">
				                            <a href="../comment/comment.jsp?logout=1">ע��</a>
				                         </c:if>
				                        </div>
				                    </div>
				                </li>
				                <li>
				                    <div class="s-dropdown">
				                        <div class="h h-wide" >
				                            <a href="../orders/orders.jsp">�ҵĶ���</a>
				                        </div>
				                        </div>
				                </li>
				                <li>
				                    <div class="s-dropdown">
				                        <div class="h h-wide" >
				                            <a href="../shoppingCart/shoppingCart.jsp" class="icon-minicart">
				                                <span>���ﳵ(<span id="header-cart-total">0</span>)</span>
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
            <a href="../index/index.jsp">��ҳ</a>&nbsp;&gt;&nbsp;
        <span>${commentList[0].commodityName}</span>
    </div>
    </div>
		</div>

<!-- 20170519-��Ʒ����-��ǩ-start -->
<!--
<div class="product-tab product-tab-top" id="product-tab" style="position: fixed; top: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; width: 100%; z-index: 100;">�Ƶ�������ʱ�����class="product-tab-top"
    <div class="layout relative" id="layoutRelative">
        <p>
             <a href="javascript:;" id="pro-tab-feature" class="">��Ʒ����<em></em></a>
            <a href="javascript:;" id="pro-tab-parameter" class="">������<em></em></a>
            <a href="javascript:;" id="pro-tab-package-service" style="display: inline;" class="">��װ���ۺ�<em></em></a> 
            <a href="" id="pro-tab-feature" style="float: left;" class="selected">�û�����<em></em><span>(0)�û�������(TOBE CODE)</span></a>
        </p>
    </div>
</div>
-->
<!-- 20170519-��Ʒ����-��ǩ-end -->



<div id="productCommentId" class="layout">
	<!-- ����ɸѡ��ǩ -->
     <div class="product-comment">
         <!--�û�����-->
        <ul id="pro-msg-list" class="product-comment-list">
        <c:if test="${not empty requestScope.commentList}">
        <li class="clearfix"></li>
        <c:forEach items="${requestScope.commentList}" var="comment">
        <li class="clearfix">
        	<div class="product-comment-user"><p class="product-comment-user-img">
        	<img src="defaultface_user_after.png" alt="defaultface_user_after.png">
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
        	<div class="product-comment-no" id="product-remark-comment-no" style="font-size: 20px;">����Ʒ��������</div>
        </c:if>
    </div>
</div>        
<div class="slogan-container">
    <div class="slogan">
        <p>Copyright �0�8 2012-2018 Aha. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>