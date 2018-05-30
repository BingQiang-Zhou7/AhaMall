<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>�ֵ��̳�</title>
<link href="ec.css" rel="stylesheet" type="text/css">
<link href="index.css" rel="stylesheet" type="text/css">
<link href="main.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script src="link.js"></script>
<script src="showDialog.js"></script>
</head>
<body class="wide" onLoad="load();">
<div class="header">
    <div class="layout">
        <div class="left">
            <!-- 2017-02-15-logo-start -->
            <div class="logo"><b style="font-size: 28px">AhaMall</b></div>
            <!-- 2017-02-15-logo-end -->
<div class="shortcut">
<div class="layout">
<div class="s-main " style="margin-top: 10px;">
            <ul>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" >
                            <a href="../login/login.htm">���¼</a>
                        </div>
                    </div>
                </li>
             	<li>
                    <div class="s-dropdown">
                        <div class="h h-wide" >
                            <a href="../register/register.htm">ע��</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" >
                            <a href="../toBeDevelop/toBeDevelop.htm">�ҵĶ���</a>
                        </div>
                        </div>
                </li>
                <li>
                    <div class="s-dropdown">
                        <div class="h h-wide" >
                            <a href="../shoppingCart/shoppingCart.htm" class="icon-minicart">
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
</div><!-- 2017-02-15-ͷ��-end -->
<div class="hr-10"></div>
    <div class="shortcut">
    <div class="layout">
            <div class="breadcrumb-area fcn" style="color: #333333; float: left;">
            ��Ʒ&nbsp;&gt;&nbsp;
        <span>����ѡ����</span>
    </div>
     <div class="right">
            <div class="search-bar relative" id="searchBar-area">
                <div class="search-bar-form" id="search-bar-form">
                   <form method="get" onsubmit="return search(this)">
                        <input class="text" placeholder="������Ʒ" maxlength="16" id="search-kw"  type="text">
                        <input class="button" value="����" type="submit">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>	
<div class="hr-10"></div><div class="layout">
	<!-- 20140726-��Ʒ���-start -->
	<div class="pro-cate-area">
		<!-- 20140726-��Ʒ���-����-start -->
		<div class="pro-cate-attr clearfix">
			<div class="p-title">���ࣺ</div>
			<div class="p-default">
				<ul>
                    <li id="category-0" class="selected"><a href="javascript:;" onClick="onClickLink('category-0',1);">ȫ��</a></li>
					<!--<li class="selected"><a href="javascript:;">ȫ��</a></li>-->
				</ul>
			</div>
			
			<!-- ����������� -->
			<div class="p-values">
				<!-- һ�еĸ߶�Ϊ30px,��ʾn�У�p-expand�ĸ߶�Ϊnx30 -->
				<div class="p-expand">
					<ul class="clearfix">					
	                    <li id="category-1"><a href="javascript:;" onClick="onClickLink('category-1',1);">�ֻ�</a></li>
	                    <li id="category-2"><a href="javascript:;" onClick="onClickLink('category-2',1);">�ʼǱ�</a></li>
	                    <li id="category-3"><a href="javascript:;" onClick="onClickLink('category-3',1);">ƽ��</a></li>
	                    <li id="category-4"><a href="javascript:;" onClick="onClickLink('category-4',1);">���ܼҾ�</a></li>
	                    <li id="category-5"><a href="javascript:;" onClick="onClickLink('category-5',1);">���</a></li>
					</ul>
				</div>
			</div>
			
		</div><!-- 20140726-��Ʒ���-����-end -->
		
		<!-- 20140726-��Ʒ���-����-start -->
        <!-- 20140726-��Ʒ���-����-end -->		
		
		<!-- 20140726-��Ʒ���-����-start -->
		<div class="pro-cate-sort clearfix">
			<div class="p-title">����</div>
			<div class="p-default">
				<ul>
					<li id="sort-0" class="selected"><a href="javascript:;" onClick="onClickLink('sort-0',2);">Ĭ��</a></li>
				</ul>
			</div>
			<div class="p-values">
				<div class="p-expand">					
					<ul class="clearfix">
					    <!-- ����ѡ�񣨴ӵ͵��ߣ��� sort-asc selected   ����ѡ�񣨴Ӹߵ��ͣ��� sort-desc selected -->
						<li id="sort-1"><a href="javascript:;" class="sort-price" onClick="onClickLink('sort-1',2);">�۸�</a></li>
						<li id="sort-2"><a href="javascript:;" class="sort-eval" onClick="onClickLink('sort-2',2);">������</a></li>
						<li id="sort-3"><a href="javascript:;" class="sort-added" onClick="onClickLink('sort-3',2);">�ϼ�ʱ��</a></li>
					</ul>
				</div>
			</div>
		</div><!-- 20140726-��Ʒ���-����-end -->
	</div><!-- 20140726-��Ʒ���-end -->
</div>
	<div class="hr-20"></div>			
<div class="layout">
	<!-- 20140726-Ƶ��-�б�-start -->

	<div class="pro-cate-null hide">
		            ��Ǹ��û���ҵ�<span class="red"> ��С�ס� </span>�������Ʒ!
		</div>
		<div id="cart-tips" class="pro-popup-area hide" >
			<div class="b" style="display: block;">
				<div class="pro-add-success">
					<dl>
					<dt><b></b></dt>
						<dd>
							<div class="pro-add-success-msg">�ɹ����빺�ﳵ!</div>
						</dd>
					</dl>					
				</div>
			</div>
		</div>
<!--		<div id="comment-tips" class="pro-popup-area hide" >
			<div class="b" style="display: block;">
					<dl>
						<dd>
							<div class="pro-add-success-msg" align="center" style="color: #e01d20">��ʱ��û�����ۣ�</div>
						</dd>
					</dl>					
			</div>
		</div> -->
    <div class="channel-list">
        <!-- 20140727-��Ʒ�б�-start -->
		<div class="pro-list clearfix">
			<ul>
				<li>
					<div class="pro-panels">
						<p class="p-img"><a  href="../comment/comment.htm" title="��ҫ10&nbsp;AI��Ӱ�ֻ�&nbsp;6GB+64GB&nbsp;��Ӱ��&nbsp;ȫ��ͨ ˫��˫�� �����" ><img alt="��ҫ10&nbsp;AI��Ӱ�ֻ�&nbsp;6GB+64GB&nbsp;��Ӱ��&nbsp;ȫ��ͨ �����" src="1.jpg"></a></p>
						<p class="p-name"><a href="../comment/comment.htm" title="��ҫ10&nbsp;AI��Ӱ�ֻ�&nbsp;6GB+64GB&nbsp;��Ӱ��&nbsp;ȫ��ͨ ˫��˫�� �����" >��ҫ10&nbsp;AI��Ӱ�ֻ�&nbsp;6GB+64GB&nbsp;��Ӱ��&nbsp;ȫ��ͨ �����<span class="red"></span></a></p>
						<p class="p-price"><b>�0�62599</b></p>
						<b class="p-tag"><img alt="��ҫƽ��2 3GB+32GB WiFi�棨���Ľ�" src="sell.png"></b>
						<div class="p-button clearfix">
							<table border="1">
								<tbody>
									<tr>
									<td><a href="javascript:;" onClick="return showCartDialog();" class="p-button-cart"><span>���빺�ﳵ</span></a></td>
										<td><label class="p-button-score"><span id="numOfComment">0</span>������</label></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</li>
			</ul>
		</div>
    </div><!-- 20140726-Ƶ��-�б�-end -->
    
</div>
<div class="slogan-container">
    <div class="slogan">
        <p>Copyright �0�8 2012-2018 Aha. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>