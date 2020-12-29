<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/7
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎来到小姐姐的花店</title>
    <link rel="stylesheet" type="text/css" href="../../css/goodsCart.css">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/home.css" rel="stylesheet" type="text/css">
    <link href="../../css/goodsDetail.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://img02.hua.com/pc/css/productDetail.css?1118">
    <style type="text/css">
        a:hover{
            text-decoration: none !important;
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
                    <a>亲爱的：<b>${sessionScope.userName}</b>你好！</a>
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
            <a href="/login.html"> 小姐姐的花店</a>
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
<div style="clear:both"></div>
<!-- 返回购物车 -->
<div class="back">
    <a href="#">首页</a>
    <b>></b> <a href="#">商品详情</a>
    <b>></b> <a class="active" href="${pageContext.request.contextPath}/goods/listGoodsCart.action" >购物车</a>
</div>
<!-- 返回购物车结束 -->

<!-- 购物车列表 -->
<div id="box">
    <div class="box_cart">
        <table id="cart">
            <tr id="head">
                <td width="100px"><input class="allSelect" type="checkbox">  全选</td>
                <td width="100px" style="display: none">编号</td>
                <td width="500px;">商品</td>
                <td width="100px">单价</td>
                <td width="120px">数量</td>
                <td width="100px">小计</td>
                <td width="130px">操作</td>
            </tr>
            <c:forEach items="${sessionScope.cart}"  var="entry">
                <tr>
                <td><input class="select" type="checkbox"></td>
                <td class="goodsId" width="100px" style="display: none;">${entry.key.goodsId}</td>
                <td class="goods"><img src="../../images/goods${entry.key.goodsImg}.jpg">${entry.key.goodsName}</td>
                <td class="price">${entry.key.goodsPrice}</td>
                <td>
                    <div class="number">
                        <div class="desymbol">-</div>
                        <div class="acc">${entry.value}</div>
                        <div class="adsymbol">+</div>
                    </div>
                </td>
                <td class="total"></td>
                <td class="dele"><a <%--href="${pageContext.request.contextPath}/goods/delOneGoodsCartDate.action?goodsId="${entry.key.goodsId}--%>>删除</a></td>
            </c:forEach>

        </table>

        <div id="settlement">
            <div style="width:550px"><input class="allSelect" type="checkbox">    全选</div>
            <div style="width:120px">全选商品<span id="NumofGoods"></span><span>件</span></div>
            <div style="width:120px">合计：¥<span id="addupto"></span></div>

            <div style="width:120px;text-align: center;"> <button id="delCart" class="btn btn-primary">
                <a  style="color: #ffffff" href="${pageContext.request.contextPath}/goods/delAllGoodsCartDate.action">清空购物车</a></button></div>
            <div style="width:120px;text-align: center;"> <button id="payBtn" class="btn btn-primary">结算</button></div>
        </div>
    </div>
</div>
<div style="clear: both"></div>
<div class="footer-nav">
    <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=${sessionScope.userName}">首页</a><b>|</b>
    <a href="" target="_blank">关于我们</a> <b>|</b>
    <a href="" target="_blank">联系方式</a>
</div>
<!-- 购物车列表结束 -->
<script type="text/javascript" src="../../js/goodsCart.js"></script>
</body>
</html>