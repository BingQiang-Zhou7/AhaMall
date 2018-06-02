<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="zhou.database.*" %>
    <%@page import="zhou.dao.*"  %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//���¹��ﳵ��Ʒ����
	String commodityId = request.getParameter("commodityId");
	String numOfCommodity = request.getParameter("numOfCommodity");
	//�˳���¼ �Լ� ��ȡ���ﳵ��Ʒ��Ϣ
	String logout = request.getParameter("logout");
	String url = request.getRequestURI();//��ȡ��ǰ����
	User user = (User)session.getAttribute("userInfo");//��ȡ�û���Ϣ
	ArrayList<Commodity> commodityCart =null;
	if(user != null)
	{
		if(logout != null && logout.equals("1"))
		{
			session.removeAttribute("userInfo");
		}
		else{
			//ɾ����Ʒ �Լ���չ��ﳵ
			if(commodityId != null && numOfCommodity == null)
			{
				new DataProcess(application.getInitParameter("DBName")).DeleteCommodityToShoppingCart(user.phoneNum, commodityId);
			}
			//�Ӽ���Ʒ
			else if(commodityId != null && numOfCommodity != null && Integer.parseInt(numOfCommodity) > 0)
			{
				new DataProcess(application.getInitParameter("DBName")).UpdateCommodityToShoppingCart(user.phoneNum, commodityId, numOfCommodity);
			}
			//��ѯ�û����ﳵ��Ʒ
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
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <c:if test="${empty sessionScope.userInfo}">
	                            <a href="../register/register.htm">ע��</a>
	                         </c:if>
	                         <c:if test="${not empty sessionScope.userInfo}">
	                            <a href="../shoppingCart/shoppingCart.jsp?logout=1">ע��</a>
	                         </c:if>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <a href="../index/index.jsp">�̳���ҳ</a>
                        </div>
                        </div>
                </li>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <a href="../toBeDevelop/toBeDevelop.htm">�ҵĶ���</a>
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
            <p>����û�е�¼����¼��ɲ鿴֮ǰ�������Ʒ~</p>
            <a href="../login/login.htm">��¼</a>
        </div>
</c:if>
<!-- TODO ���ﳵû����Ʒ -->     
<c:if test="${not empty sessionScope.userInfo}">
<c:if test="${empty requestScope.commodityCart}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>���Ĺ��ﳵ��ʲôҲû��Ŷ~</p>
            <a href="../index/index.jsp">ȥ���</a>
        </div>
</c:if>
<c:if test="${not empty requestScope.commodityCart}">
		<div class="sc-pro-title clearfix" id="shopping-cart-product-list">
			<label><i class="icon-choose-normal icon-choose-all icon-choose" id="checkAll-top"></i>ȫѡ</label>
			<ul class="clearfix">
                <li>��Ʒ</li> 
                <li>����</li>
                <li>����</li>
                <li>С��</li>
                <li>����</li>
			</ul>
		</div>
		<c:forEach items="${requestScope.commodityCart}" var="commodity">
        <form id="cart-form" autocomplete="off" method="get">
        	<div id="cart-list"><!--product-list start-->
        		<div class="sc-pro"><!--��Ʒstart-->
        			<div class="sc-pro-list clearfix">
        				<i class="icon-choose-normal icon-choose ${commodity.commodityID}"></i>
        				<div class="sc-pro-area ">
        					<div class="sc-pro-main clearfix">
        							<img class="p-img" alt="${commodity.commodityDescription}" src="../images/${commodity.commodityAddressOfImage}">
        						<ul>            
        							<li>            
        								<p class="p-name">${commodity.commodityDescription}</p>                
        								<!-- <p class="p-sku" style="display: none;">
        									<em>�汾��ȫ��ͨ&nbsp;6GB+64GB</em>
        									<em>��ɫ����Ӱ��</em>
        								</p>  
        								-->                       
        							</li>            
        							<li>                
        								<div class="p-price">            
        									<span>�0�6&nbsp;${commodity.commodityPrice}</span>                
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
        											href="<%=url %>?commodityId=${commodity.commodityID}&numOfCommodity=${commodity.commodityNumber-1}">�6�1</a>
        										</p>
        									</div>          
        								</div>
        								</li>            
        								<li class="p-price-total ${commodity.commodityID}">�0�6&nbsp;${ commodity.commodityNumber*commodity.commodityPrice}
        								</li>            
        								<li>
        									<a href="javascript:;" class="p-del">ɾ��
        									</a>
        									<div id="popup-area" class="popup-area popup-define-area hide" style="position: absolute; top: -12px; left: 70%">
        									<div class="b"><p>��ȷ��Ҫɾ������Ʒ�� </p> 
        									<div class="popup-button-area">
        									<a href="<%=url %>?commodityId=${commodity.commodityID}" class="button-action-yes">
        									<span>��</span></a> 
        									<a href="javascript:;" class="button-action-no"><span>��</span></a>
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
        			<label><i class="icon-choose-normal icon-choose-all icon-choose" id="checkAll-buttom"></i>ȫѡ</label>
        			<a href="javascript:;" class="p-del-all">��չ��ﳵ</a>
        		</div>
        		<div id="popup-area" class="popup-area popup-define-area hide"  style="position: absolute;width: 20%;top:30%;left: 40%">
						<div class="b"><p>��ȷ��Ҫ��չ��ﳵ�� </p> 
							<div class="popup-button-area">
								<a href="<%=url %>?commodityId=all" class="button-action-yes"><span>��</span></a> 
								<a href="javascript:;" class="button-action-no"><span>��</span></a>
							</div>
						</div> 
					</div> 
        		<div class="sc-total-btn ">
        			<a href="../toBeDevelop/toBeDevelop.htm" >��������</a>
        		</div>
        		<div class="sc-total-price">
        			<p><label>�ܼƣ�</label>
        				<span>�0�6&nbsp;<label id="sc-cartInfo-totalOriginalPrice">0.00</label></span>
        			</p>
        	</div>
   </div>
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