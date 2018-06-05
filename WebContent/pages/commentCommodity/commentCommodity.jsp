<%@page import="java.util.ArrayList"%>
<%@page import="zhou.database.*"%>
<%@page import="zhou.dao.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
//��ȡ��Ʒ��Ϣ
	String commodityID = request.getParameter("commodityID");
	String orderID = request.getParameter("orderID");
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
	Commodity commodity = new DataProcess(application.getInitParameter("DBName")).SearchCommodityByID(commodityID,orderID);
	request.setAttribute("commodity", commodity);
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall Comment Commodity</title>
<link rel="shortcut icon" href="../images/icon/aha64.ico">
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="commentCommodity.js"></script>
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
				                                <span>���ﳵ</span>
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

    <div class="ce-post-area">
            <div class="" style="background: #f5f5f5">
                <div class="">
                    <!-- 20141212-��Ŀ-start -->
                    <div class="top-section-header">
                        <div class="layout clearfix">
                            <div class="fl" id="orderInfo">  <h2>������Ʒ<span>������ţ�</span><b>${commodity.orderID }</b></h2></div>
                            <div class="fr">
                                <a class="button-operate-merge-pay" href="javascript:;" id="remarkSubmit"><span>�ύ</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="myEval-detail-add layout">
                        <div class="myEval-detail-tips red hide" id="commodityTip">����д�������ݺ����ύ��</div>
                        <ul id="productList">
                        <li class="clearfix  " id="li-10113020401701">
                        <div class="myEval-pro fl">
                        <p class="p-img">
                        <a href="../comment/comment.jsp?commodityID=${commodity.commodityID}">
                        <img id="img-10113020401701" title="${commodity.commodityDescription}" alt="${commodity.commodityDescription}" src="../images/${commodity.commodityAddressOfImage}"></a>
                        </p>
                        <p class="p-name" id="name-10113020401701">
                        <a href="../comment/comment.jsp?commodityID=${commodity.commodityID}">${commodity.commodityDescription}</a></p>
                        <p class="p-price" id="price-10113020401701">�0�6&nbsp;${commodity.commodityPrice}</p>
                        </div>
                        <div class="myEval-form fr">
                        <div class="form-edit-panels">
                        <div class="form-edit-table">
                        <table>
                         <tbody>
                         <tr class="tr-rel" style="height: 80px;">
                         <th></th></tr>
                         <tr class="tr-rel">
                         <th class="vat">
                         <label>����</label>
                         </th>
                         <td>
                         <c:if test="${empty commodity.commentContent}">
                         <textarea maxlength="255" placeholder="������10�����Ͼ��л�������������һ��" class="textarea" onchange="changeText();">nice �ܲ���</textarea>
                         <div class="count fr">
                         <span class="WordNum">9</span>&nbsp;/&nbsp;255
                         </div>
                         </c:if>
                          <c:if test="${not empty commodity.commentContent}">
                          <textarea maxlength="255" placeholder="������10�����Ͼ��л�������������һ��" class="textarea" onchange="changeText();">${commodity.commentContent}</textarea>
                          <div class="count fr">
                         <span class="WordNum">${fn:length(commodity.commentContent)}</span>&nbsp;/&nbsp;255
                         </div> 
                          </c:if>
                         </td>
                         </tr>	                                                                
                         </tbody>
                         </table>
                         </div>
                         </div>
                         </div>
                         </li>
                         </ul>
                    </div><!-- 20161021-�ҵ�����-����-end -->
                </div>
                <div class="hr-40"></div>
            </div>
        </div>

<div class="slogan-container">
    <div class="slogan">
        <p>Copyright �0�8 2012-2018 Aha. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>