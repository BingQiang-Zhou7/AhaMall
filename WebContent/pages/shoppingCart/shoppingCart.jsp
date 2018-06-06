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
	                            <a href="pages/login/login.htm">���¼</a>
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
	                            <a href="pages/register/register.htm">ע��</a>
	                         </c:if>
	                         <c:if test="${not empty sessionScope.userInfo}">
	                            <a href="shoppingCartServlet?logout=1">ע��</a>
	                         </c:if>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" id="header-toolbar-minicart">
                            <a href="IndexServlet">�̳���ҳ</a>
                        </div>
                        </div>
                </li>
                <c:if test="${not empty sessionScope.userInfo}">
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" >
                            <a href="OrderServlet">�ҵĶ���</a>
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
						<div class="pro-add-success-msg">����ɹ���</div>
					</dd>
				</dl>					
			</div>
		</div>
	</div>
<div class="layout">
<div class="myEval-detail-tips red hide" id="NoSelectTip">��ѡ����Ʒ���ٽ��㣡</div>	
<div class="sc-list">
<c:if test="${empty sessionScope.userInfo}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>����û�е�¼����¼��ɲ鿴֮ǰ�������Ʒ~</p>
            <a href="pages/login/login.htm">��¼</a>
        </div>
</c:if>
<!-- TODO ���ﳵû����Ʒ -->     
<c:if test="${not empty sessionScope.userInfo}">
<c:if test="${empty requestScope.commodityCart}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>���Ĺ��ﳵ��ʲôҲû��Ŷ~</p>
            <a href="IndexServlet">ȥ���</a>
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
        							<img class="p-img" alt="${commodity.commodityDescription}" src="pages/images/${commodity.commodityAddressOfImage}">
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
        											href="${requestScope.url}?commodityId=${commodity.commodityID}&numOfCommodity=${commodity.commodityNumber+1}">+</a>
        											<a class="pro-quantity-minus ${commodity.commodityName} disabled" 
        											href="${requestScope.url}?commodityId=${commodity.commodityID}&numOfCommodity=${commodity.commodityNumber-1}">�6�1</a>
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
        									<a href="${requestScope.url}?commodityId=${commodity.commodityID}" class="button-action-yes">
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
        <div id="locationForEnd"></div>
        	<div id="cart-total-area" class="sc-total-tool layout clearfix ">
        		<div class="sc-total-control">
        			<label><i class="icon-choose-normal icon-choose-all icon-choose" id="checkAll-buttom"></i>ȫѡ</label>
        			<a href="javascript:;" class="p-del-all">��չ��ﳵ</a>
        		</div>
        		<div id="popup-area" class="popup-area popup-define-area hide"  style="position: absolute;width: 20%;top:30%;left: 40%">
						<div class="b"><p>��ȷ��Ҫ��չ��ﳵ�� </p> 
							<div class="popup-button-area">
								<a href="${requestScope.url}?commodityId=all" class="button-action-yes"><span>��</span></a> 
								<a href="javascript:;" class="button-action-no"><span>��</span></a>
							</div>
						</div> 
					</div> 
        		<div class="sc-total-btn">
        			<a href="javascript:;" id="buyCommodity">��������</a>
        		</div>
        		<div class="sc-total-price">
        			<p><label>�ܼƣ�</label>
        				<span>�0�6&nbsp;<label id="sc-cartInfo-totalOriginalPrice">0.00</label></span>
        			</p>
        	</div>
   </div>
   	</c:if>
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