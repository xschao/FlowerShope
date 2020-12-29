<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/10
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎来到小姐姐的花店</title>
    <link rel="stylesheet" type="text/css" href="../../css/orderDetail.css">
    <link rel="stylesheet" type="text/css" href="../../css/goodsCart.css">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/home.css" rel="stylesheet" type="text/css">
    <link href="../../css/goodsDetail.css" rel="stylesheet" type="text/css">
    <script src="../../jquery/jquery-3.1.1.min.js"></script>
    <script src="../../js/orderRegister.js" type="text/javascript"></script>
    <style type="text/css">
        a:hover{
            text-decoration: none;
        }
    </style>
</head>

<body>
<!-- 顶部导航 -->
<div class="nav">
    <!--导航栏左端-->
    <ul class="site-nav-l">
        <li class="menu">
            <a href="#"><span class="ico ico-star"></span>收藏小姐姐的花店</a>
        </li>
        <li class="menu dropdown">
            <a href="#"><span class="ico ico-weixin"></span>关注微信</a>
        </li>
        <li class="menu dropdown">
            <a href="#"><span class="ico ico-mobile"></span>小姐姐的花店app</a>
        </li>
    </ul>
    <!--导航栏右端-->
    <ul class="site-nav-r">
        <li class="menu">
            <%-- 判断用户是否登录 --%>
            <c:choose>
                <c:when test="${sessionScope.userName eq null}">
                    <a href="${pageContext.request.contextPath}/login.html">你好，请登录</a><a href="${pageContext.request.contextPath}/register.html" style="margin-left: 10px">注册</a>
                </c:when>
                <c:when test="${sessionScope.userName eq 'visitor'}">
                    <a href="${pageContext.request.contextPath}/login.html">你好，请登录</a><a href="${pageContext.request.contextPath}/register.html" style="margin-left: 10px">注册</a>
                </c:when>
                <c:otherwise>
                    <a>亲爱的：<b id="username">${sessionScope.userName}</b>你好！</a>
                </c:otherwise>
            </c:choose>
        </li>
        <li class="site-nav-pipe">|</li>
        <li class="menu">
            <a href="#">订单查询</a>
        </li>
        <li class="site-nav-pipe">|</li>
        <li class="menu dropdown">
            <a href="#">我的花礼</a>
        </li>
        <li class="site-nav-pipe">|</li>
        <li class="menu dropdown">
            <a href="#">客户服务<span class="glyphicon glyphicon-triangle-bottom"></span></a>
        </li>
        <li class="site-nav-pipe">|</li>
        <li class="menu dropdown">
            <a href="${pageContext.request.contextPath}/goods/listGoodsCart.action"><span class="ico ico-cart"></span>购物车<span
                    class="glyphicon glyphicon-triangle-bottom"></span></a>
            <div class="dropdown-menu dropdown-cart" id="CartInfo"></div>
        </li>
        <li class="site-nav-pipe">|</li>
        <li class="menu slogan">
            <a href="#"> 小姐姐的花店</a>
        </li>
    </ul>
</div>
<!-- header头部部分-->
<header>
    <div class="logo">
        <h1><a href="#">小姐姐的花店</a></h1>
    </div>
    <div class="search">
        <form action="" method="get" name="i_search">
            <div class="input-group">
                <input class="form-control" name="keyword" placeholder="商品关键词" type="text">
                <span class="input-group-btn">
                            <button class="btn btn-primary" id="test" onClick="this.form.submit()"
                                    type="button">搜索</button>
                    </span>
            </div>
        </form>
    </div>
    <div class="service serviceDefault">
        <span class="ico ico-phone"></span>0791-8316800
        <a id="header-chat" target="_blank"><span class="ico ico-headset"></span>在线客服</a>
    </div>
</header>
<!-- header结束 -->

<!-- 中间导航部分  -->
<nav class="navbar navbar-default">
    <div class="container">
        <ul class="nav nav_ul" id="no">
            <li role="presentation" class="home_li"><a class="active" href="#">网站首页</a></li>
            <li class="dropdown" id="ho"><a href="#" class="dropdown-toggle">产品中心</a></li>
            <li role="presentation"><a href="#">永生花</a></li>
            <li role="presentation"><a href="#">绿值盆栽</a></li>
            <li role="presentation"><a href="#">花语大全</a></li>
            <li role="presentation"><a href="#">设计师臻选</a></li>
            <li role="presentation"><a href="#">在线留言</a></li>
        </ul>
    </div>
</nav>
<!-- 中间导航部分结束 -->

<!-- 返回购物车 -->
<div class="back">
    <a href="#">首页</a>
    <b>></b> <a href="#">商品详情</a>
    <b>></b> <a href="#" >购物车</a>
    <b>></b> <a href="#" >订单支付</a>
    <b>></b> <a class="active" href="#" >新增收货人</a>
</div>
<!-- 返回购物车结束 -->

<!-- 订单填写表 -->
<section class="order-main" style="border-top:1px solid #E9ECF0; height: 380px">
    <div class="order-container" id="form1">
        <div class="login-box">
            <span class="iconfont iconfont-tips"></span>
            <span class="login-tips">如果未登录，已有花礼网账户.如果没有请 <a  href="${pageContext.request.contextPath}/register.html">注册></a></span>
            <a href="${pageContext.request.contextPath}/register.html" class="login-a" href="javascript:void(0)">请登录></a>
            <span class="iconfont iconfont-emptytext" onclick="$('.login-box').hide()"></span>
        </div>
        <!-- 新增收货人信息 -->
        <div class="order-item" style="position:relative;margin-top:24px;">
            <h3 class="order-item-hd">收货人信息<span  style="color: #ff0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="orderRegisterSuccess"></span></span></h3>
            <!-- 没有地址记录 -->
            <div class="order-item-content" id="receiverAddress">
                <div class="order-item-li">
                    <label class="order-item-title">收货人</label>
                    <input class="order-item-input" placeholder="请输入收货人姓名" type="text" id="ToName" name="ToName"
                           maxlength="15" autocomplete="off">
                </div>
                <div class="order-item-li">
                    <label class="order-item-title">手机号码</label>
                    <input class="order-item-input" placeholder="请输入收货人手机号码" type="text" id="ToMobile" name="ToMobile" maxlength="11" autocomplete="off">
                </div>


                <div class="order-item-li">
                    <label class="order-item-title">详细地址</label>
                    <div class="order-item-input-box">
                        <span class="order-item-addr-header" id="areaSelectShowId" data-areaCode=""></span>
                        <input placeholder="请输入收货人详细地址" type="text" id="ToAddress" name="ToAddress"
                               maxlength="50" autocomplete="120" onblur="receiverObj.setSelectConsignee()">
                        <input type="hidden" name="AddressID" value="0" id="AddressID" />
                    </div>
                </div>

                <div class="order-item-li">
                    <label class="order-item-title">邮编</label>
                    <input class="order-item-input" placeholder="请输入收货人邮编" type="text" id="ToPost" name="ToPost"
                           maxlength="6" autocomplete="off" >
                </div>
                <div class="order-item-li">
                    <button  class="btn btn-primary " type="button" id="submit" onclick="getInfoRegister()" style="margin-left: 200px"> 提交 </button>
                </div>
            </div>
        </div>
        <!-- 收货人信信息结束 -->
    </div>
</section>
<!-- 订单填写表结束 -->
<div class="footer-nav" >
    <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=${sessionScope.userName}">首页</a>
    <a href="" target="_blank">关于我们</a> <b>|</b>
    <a href="" target="_blank">联系方式</a> <b>|</b>
</div>
</body>
</html>