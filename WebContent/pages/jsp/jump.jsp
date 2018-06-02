<%@page import="zhou.dao.User"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
//	User user = (User)session.getAttribute("userInfo");
//	if(user != null)
//	{
//		session.removeAttribute("userInfo");
//		request.setAttribute("userInfo", user);
//	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link rel="shortcut icon" href="../images/icon/aha64.ico">
<link rel="stylesheet" type="text/css" href="jump.css">
<script src="jump.js"></script> 
<title>Jumping...</title>
</head>
<body onload="load()">
    <div class="flex-container">
      <div class="unit">
        <div class="heart">
          <div class="heart-piece-0"></div>
          <div class="heart-piece-1"></div>
          <div class="heart-piece-2"></div>
          <div class="heart-piece-3"></div>
          <div class="heart-piece-4"></div>
          <div class="heart-piece-5"></div>
          <div class="heart-piece-6"></div>
          <div class="heart-piece-7"></div>
          <div class="heart-piece-8"></div>
        </div>
        <p>
        	<c:choose>
        		<c:when test="${sessionScope.userInfo == null}">
        		<label id="Tip">操作成功</label><br>
        		<b id="second">5</b>秒后跳转到登录页面 <br>
        		 <a href="../login/login.htm" style="color: #7287FE">立即跳转</a>
        		</c:when>
        		<c:otherwise>
        		<label id="Tip">欢迎您，<c:out value="${sessionScope.userInfo.userName}"></c:out></label><br>
        		<b id="second">5</b>秒后跳转到主页面 <br>
        		<a href="../index/index.jsp" style="color: #7287FE">立即跳转</a>
        		</c:otherwise>
        	</c:choose>
 		</p>
      </div>
    </div>
</body>
</html>