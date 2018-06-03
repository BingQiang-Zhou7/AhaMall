<%@page import="java.util.ArrayList"%>
<%@page import="zhou.database.*"%>
<%@page import="zhou.dao.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//获取商品信息
	String commodityID = request.getParameter("commodityID");
	User user = (User)session.getAttribute("userInfo");
	String logout = request.getParameter("logout");
	if(user != null)
	{
	//	System.out.println(logout);
		if(logout != null && logout.equals("1"))
		{
			session.setAttribute("userInfo",null);
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
<title>AhaMall Orders</title>
<link rel="shortcut icon" href="../images/icon/aha64.ico">
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
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
				                            <a href="../comment/comment.jsp?logout=1">注销</a>
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
				                                <span>购物车(<span id="header-cart-total">0</span>)</span>
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
	<div id="base_index" class="">

<div class="hr-10"></div>
<div class="g">
<div class="section-header">
    <div class="fl">
        <h2><span>我的订单</span></h2>
    </div>
</div>
<div class="hr-10"></div>
<div class="myOrder-record" id="myOrders-list-content">
	<div class="list-group-title">
		<table >
			<thead>
				<tr>
					<th class="col-pro">商品</th>
					<th class="col-price">单价/元</th>
					<th class="col-quty">数量</th>
					<th class="col-pay">实付款/元</th>
					<th class="col-operate">订单状态及操作</th>
				</tr>
			</thead>
		</table>
	</div>

	<div class="list-group" id="list-group">
	<div class="list-group-item">
	<div class="o-info">
	<div class="col-info">
	<span class="o-date">2015-12-01&nbsp;&nbsp;00:11</span>
	<span class="o-no">订单号：
	<a href="https://www.vmall.com/member/order-8640027202?isHisData=0" title="8640027202">8640027202</a>
	</span><span class="o-logistics">
	</span>
	</div>
	<div class="col-state">已完成&nbsp;|&nbsp;已付款</div>
	</div>
	<div class="o-pro">
	<table>
	<tbody>
	
	<tr><td class="col-pro-img">
	<p class="p-img">
	<a title="【荣耀7送福利活动】华为 HUAWEI 电源适配器 华为快充 兼容9V2A 5V2A 手机充电器 USB充电头（白色）" href="" onclick="pushProMsg(6106,'300130101')">
	<img class="nocomment-10113020401701" alt="【荣耀7送福利活动】华为 HUAWEI 电源适配器 华为快充 兼容9V2A 5V2A 手机充电器 USB充电头（白色）" src=""></a></p>
	</td>
	<td class="col-pro-info">
	<p class="p-name">
	<a title="【荣耀7送福利活动】华为 HUAWEI 电源适配器 华为快充 兼容9V2A 5V2A 手机充电器 USB充电头（白色）" class="nocomment-10113020401701" href="">【荣耀7送福利活动】华为 HUAWEI 电源适配器 华为快充 兼容9V2A 5V2A 手机充电器 USB充电头（白色）</a></p>
	</td><td class="col-price"><em>¥</em><span>69.00</span></td>
	<td class="col-quty">1</td><td rowspan="1" class="col-pay">
	<p><em>¥</em><span>7.00</span></p><p><em>支付宝</em></p></td>
	<td rowspan="1" class="col-operate" style="color: #ca141d;"><p class="p-button">
	<a class="button-operate-revie pl-10113020401701" href="javascript:;" ><span>我要评论</span></a></p>
	<p class="p-link"><a href="javascript:;" onclick="ec.member.orderList.del(this,'8640027202');">删除订单</a></p>
	</td>
	</tr>

	</tbody>
	</table>
	</div>
	</div></div>

	<div class="list-group-page">
		<div class="pager" id="list-pager"></div>
	</div>
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