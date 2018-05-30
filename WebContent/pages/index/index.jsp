<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>兄弟商城</title>
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
                            <a href="../login/login.htm">请登录</a>
                        </div>
                    </div>
                </li>
             	<li>
                    <div class="s-dropdown">
                        <div class="h h-wide" >
                            <a href="../register/register.htm">注册</a>
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
                            <a href="../shoppingCart/shoppingCart.htm" class="icon-minicart">
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
</div><!-- 2017-02-15-头部-end -->
<div class="hr-10"></div>
    <div class="shortcut">
    <div class="layout">
            <div class="breadcrumb-area fcn" style="color: #333333; float: left;">
            商品&nbsp;&gt;&nbsp;
        <span>尽情选购吧</span>
    </div>
     <div class="right">
            <div class="search-bar relative" id="searchBar-area">
                <div class="search-bar-form" id="search-bar-form">
                   <form method="get" onsubmit="return search(this)">
                        <input class="text" placeholder="搜索商品" maxlength="16" id="search-kw"  type="text">
                        <input class="button" value="搜索" type="submit">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>	
<div class="hr-10"></div><div class="layout">
	<!-- 20140726-商品类别-start -->
	<div class="pro-cate-area">
		<!-- 20140726-商品类别-属性-start -->
		<div class="pro-cate-attr clearfix">
			<div class="p-title">分类：</div>
			<div class="p-default">
				<ul>
                    <li id="category-0" class="selected"><a href="javascript:;" onClick="onClickLink('category-0',1);">全部</a></li>
					<!--<li class="selected"><a href="javascript:;">全部</a></li>-->
				</ul>
			</div>
			
			<!-- 二级虚拟分类 -->
			<div class="p-values">
				<!-- 一行的高度为30px,显示n行，p-expand的高度为nx30 -->
				<div class="p-expand">
					<ul class="clearfix">					
	                    <li id="category-1"><a href="javascript:;" onClick="onClickLink('category-1',1);">手机</a></li>
	                    <li id="category-2"><a href="javascript:;" onClick="onClickLink('category-2',1);">笔记本</a></li>
	                    <li id="category-3"><a href="javascript:;" onClick="onClickLink('category-3',1);">平板</a></li>
	                    <li id="category-4"><a href="javascript:;" onClick="onClickLink('category-4',1);">智能家居</a></li>
	                    <li id="category-5"><a href="javascript:;" onClick="onClickLink('category-5',1);">配件</a></li>
					</ul>
				</div>
			</div>
			
		</div><!-- 20140726-商品类别-属性-end -->
		
		<!-- 20140726-商品类别-属性-start -->
        <!-- 20140726-商品类别-属性-end -->		
		
		<!-- 20140726-商品类别-排序-start -->
		<div class="pro-cate-sort clearfix">
			<div class="p-title">排序：</div>
			<div class="p-default">
				<ul>
					<li id="sort-0" class="selected"><a href="javascript:;" onClick="onClickLink('sort-0',2);">默认</a></li>
				</ul>
			</div>
			<div class="p-values">
				<div class="p-expand">					
					<ul class="clearfix">
					    <!-- 升序选择（从低到高）： sort-asc selected   降序选择（从高到低）： sort-desc selected -->
						<li id="sort-1"><a href="javascript:;" class="sort-price" onClick="onClickLink('sort-1',2);">价格</a></li>
						<li id="sort-2"><a href="javascript:;" class="sort-eval" onClick="onClickLink('sort-2',2);">评价数</a></li>
						<li id="sort-3"><a href="javascript:;" class="sort-added" onClick="onClickLink('sort-3',2);">上架时间</a></li>
					</ul>
				</div>
			</div>
		</div><!-- 20140726-商品类别-排序-end -->
	</div><!-- 20140726-商品类别-end -->
</div>
	<div class="hr-20"></div>			
<div class="layout">
	<!-- 20140726-频道-列表-start -->

	<div class="pro-cate-null hide">
		            抱歉，没有找到<span class="red"> “小米” </span>的相关商品!
		</div>
		<div id="cart-tips" class="pro-popup-area hide" >
			<div class="b" style="display: block;">
				<div class="pro-add-success">
					<dl>
					<dt><b></b></dt>
						<dd>
							<div class="pro-add-success-msg">成功加入购物车!</div>
						</dd>
					</dl>					
				</div>
			</div>
		</div>
<!--		<div id="comment-tips" class="pro-popup-area hide" >
			<div class="b" style="display: block;">
					<dl>
						<dd>
							<div class="pro-add-success-msg" align="center" style="color: #e01d20">暂时还没有评论！</div>
						</dd>
					</dl>					
			</div>
		</div> -->
    <div class="channel-list">
        <!-- 20140727-商品列表-start -->
		<div class="pro-list clearfix">
			<ul>
				<li>
					<div class="pro-panels">
						<p class="p-img"><a  href="../comment/comment.htm" title="荣耀10&nbsp;AI摄影手机&nbsp;6GB+64GB&nbsp;幻影蓝&nbsp;全网通 双卡双待 高配版" ><img alt="荣耀10&nbsp;AI摄影手机&nbsp;6GB+64GB&nbsp;幻影蓝&nbsp;全网通 高配版" src="1.jpg"></a></p>
						<p class="p-name"><a href="../comment/comment.htm" title="荣耀10&nbsp;AI摄影手机&nbsp;6GB+64GB&nbsp;幻影蓝&nbsp;全网通 双卡双待 高配版" >荣耀10&nbsp;AI摄影手机&nbsp;6GB+64GB&nbsp;幻影蓝&nbsp;全网通 高配版<span class="red"></span></a></p>
						<p class="p-price"><b>¥2599</b></p>
						<b class="p-tag"><img alt="荣耀平板2 3GB+32GB WiFi版（香槟金）" src="sell.png"></b>
						<div class="p-button clearfix">
							<table border="1">
								<tbody>
									<tr>
									<td><a href="javascript:;" onClick="return showCartDialog();" class="p-button-cart"><span>加入购物车</span></a></td>
										<td><label class="p-button-score"><span id="numOfComment">0</span>人评价</label></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</li>
			</ul>
		</div>
    </div><!-- 20140726-频道-列表-end -->
    
</div>
<div class="slogan-container">
    <div class="slogan">
        <p>Copyright © 2012-2018 Aha. All Rights Reserved.</p>
    </div>
</div>
</body>
</html>