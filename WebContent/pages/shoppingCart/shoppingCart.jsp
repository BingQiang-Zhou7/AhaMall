<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="zhou.dao.*"  %>
<%
	String logout = request.getParameter("logout");
	User user = (User)session.getAttribute("userInfo");
	if(user != null)
	{
		if(logout != null && logout.equals("1"))
		{
			session.removeAttribute("userInfo");
		}
	}
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AhaMall Shopping Cart</title>
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body class="wide sc">
<div class="header">
    <div class="layout">
        <div class="left">
            <div class="logo"><b style="font-size: 28px">AhaMall</b></div>
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
<!-- 
	<c:if test="${empty sessionScope.userInfo}">
        <div id="login-prompt-cart" class="login-prompt" style="">����û�е�¼����¼��ɲ鿴֮ǰ�������Ʒ
   			<a id="top-index-loginUrl" href="../login/login.htm">��¼</a>
   		</div>                   
	</c:if>
	<div class="hr-20"></div>
 -->	
<div class="sc-list">
<c:if test="${empty sessionScope.userInfo}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>����û�е�¼����¼��ɲ鿴֮ǰ�������Ʒ~</p>
            <a href="../login/login.jsp">��¼</a>
        </div>
</c:if>
<!-- TODO ���ﳵû����Ʒ -->
<c:if test="${not empty sessionScope.userInfo}">
	<div id="cart-empty-msg" class="sc-empty">
        	<span class="icon-minicart"></span>
            <p>���Ĺ��ﳵ��ʲôҲû��Ŷ~</p>
            <a href="../index/index.jsp">��¼</a>
        </div>
</c:if>        
<c:if test="${empty sessionScope.userInfo}">
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
        <form id="cart-form" autocomplete="off" method="get">
        	<div id="cart-list"><!--product-list start-->
        		<div class="sc-pro"><!--��Ʒstart-->
        			<div class="sc-pro-list clearfix" id="order-pro-10086431508342">
        				<i class="icon-choose-normal " id="icon-choose-10086431508342" onclick="ec.shoppingCart.check(this);" >
        				</i>
        				<div class="sc-pro-area " id="sc-pro-area-10086431508342">
        					<div class="sc-pro-main clearfix"><!--����ʱ���class="disabled"-->
        							<img class="p-img" alt="��ҫ10&nbsp;AI��Ӱ�ֻ�&nbsp;6GB+64GB&nbsp;��Ӱ��&nbsp;ȫ��ͨ&nbsp;˫��˫��&nbsp;�����" src="1.jpg">
        							<span></span>
        						<ul>            
        							<li>            
        								<p class="p-name">��ҫ10&nbsp;AI��Ӱ�ֻ�&nbsp;6GB+64GB&nbsp;��Ӱ��&nbsp;ȫ��ͨ&nbsp;˫��˫��&nbsp;�����</p>                
        								<p class="p-sku" style="display: none;">
        									<em>�汾��ȫ��ͨ&nbsp;6GB+64GB</em>
        									<em>��ɫ����Ӱ��</em>
        								</p>                        
        							</li>            
        							<li>                
        								<div class="p-price">            
        									<span>�0�6&nbsp;2599.00</span>                
        								</div>
        									<div id="popup-area" class="popup-area popup-define-area" style="position: absolute; top: -12px; left: 70%">
        									<div class="b"><p>��ȷ��Ҫɾ������Ʒ�� </p> <div class="popup-button-area">
        									<a href="javascript:;" class="button-action-yes"><span>��</span></a> 
        									<a href="javascript:;" class="button-action-no"><span>��</span></a></div></div> 
	        									<div class="f">
	        									<b class="icon-arrow-down">
	        									</b>
	        									</div>
        									</div>            
        							</li>            
        							<li>                
        								<div class="p-stock">
        									<div class="p-stock-area">                    
        										<input id="quantity-10086431508342" class="p-stock-text" value="1" data-skuid="10086431508342" data-type="1"  style="ime-mode: disabled;" type="text">
        										<p class="p-stock-btn" id="p-stock-btn-area">
        											<a id="pro-quantity-plus" href="javascript:;">+</a>
        											<a id="pro-quantity-minus" href="javascript:;" class="disabled">�6�1</a>
        										</p>
        									</div>          
        								</div>
        								</li>            
        								<li class="p-price-total" id="p-price-total-10086431508342">�0�6&nbsp;2599.00
        								</li>            
        								<li>
        									<a href="javascript:;" class="p-del" onclick="ec.shoppingCart.del(this , 10086431508342,1)">ɾ��
        									</a>
        								</li>
        							</ul>
        						</div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</form>
        <div id="locationForEnd"></div>
        <div id="center_balance" class="">
        	<div id="cart-total-area" class="sc-total-tool layout clearfix ">
        		<div class="sc-total-control">
        			<label><i class="icon-choose-normal icon-choose-all" id="checkAll-buttom"></i>ȫѡ</label>
        		</div>
        		<div class="sc-total-btn ">
        			<a href="../toBeDevelop/toBeDevelop.htm" >��������</a>
        		</div>
        		<div class="sc-total-price">
        			<p><label>�ܼƣ�</label>
        				<span id="sc-cartInfo-totalOriginalPrice">�0�6&nbsp;0.00</span>
        			</p>
        	</div>
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