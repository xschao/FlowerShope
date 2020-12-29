<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/19
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎来到小姐姐的花店</title>
    <meta name="description" content=""/>
    <meta name="keywords" content="会员中心"/>
    <link rel="stylesheet" href="../../bootstrap-3.3.7/dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="../../jquery/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../../css/common.css">
    <link type="text/css" rel="stylesheet" href="../../css/public.css">
    <style type="text/css">
        /*Logo替换 2018-10-31 16:17:57*/
        header .logo {
            background-image: url(../../images/logo.jpg);
            background-position: left;
            background-size: 168px;
        }

        .service.serviceVip {
            display: none;
        }

        .vipwechatchat {
            position: relative;
            display: inline-block;
            margin: 0;
        }

        .vipwechatchat:hover > .vipwechatchat-box {
            display: block;
        }

        .vipwechatchat-box {
            position: absolute;
            z-index: 999;
            top: 100%;
            left: 0;
            background: #FEF3ED;
            display: none;
            width: 220px;
            height: auto;
            padding: 20px;
            text-align: center;
            border-radius: 4px;
        }

        .vipwechatchat-box > h3 {
            color: #fe6600;
            font-size: 20px;
            margin: 0 0 12px;
        }

        .vipwechatchat-box > p {
            font-size: 12px;
            color: #777;
        }


    </style>
    <style>
        li.active a {
            color: #ff6a00 !important;
            background-color: transparent;
        }

        #orderInfo {
            margin-left: 100px;
            color: #ff6a00;
            font-weight: bold;
        }

        a:hover {
            text-decoration: none;
        }

    </style>

</head>
<body class="home">
<!-- 顶部导航 -->

<div class="site-nav">
    <div class="container">

        <ul class="site-nav-l">
            <li class="menu">
                <a href="/" onClick="addfavorite();return false;"><span class="ico ico-star"></span>小姐姐的花店</a>
            </li>
            <li class="menu dropdown">
                <a href="javascript:void(0)" data-hover="dropdown" data-delay="0"><span class="ico ico-weixin"></span>关注微信</a>
                <div class="dropdown-menu dropdown-weixin">
                    <img src="images/weixin.jpg" height="124" width="124">
                    <p>扫码关注<br>回复"礼物" 更多惊喜！</p>
                </div>
            </li>
            <li class="menu dropdown">
                <a href="/login.html" data-hover="dropdown" data-delay="0" target="_blank"><span class="ico ico-mobile"></span>小姐姐的花店app</a>
                <div class="dropdown-menu dropdown-weixin">
                    <img src="images/weixin.jpg" height="124" width="124">
                    <p>新人专享100元APP礼包</p>
                </div>
            </li>
        </ul>
        <ul class="site-nav-r">
            <!--登陆状态信息显示start-->
            <li class="menu login" id="LoginInfo">
                <%-- 判断用户是否登录 --%>
                <c:choose>
                    <c:when test="${sessionScope.userName eq null}">
                        <a href="${pageContext.request.contextPath}/login.html">你好，请登录</a><a
                            href="${pageContext.request.contextPath}/register.html" style="margin-left: 10px">注册</a>
                    </c:when>
                    <c:when test="${sessionScope.userName eq 'visitor'}">
                        <a href="${pageContext.request.contextPath}/login.html">你好，请登录</a><a
                            href="${pageContext.request.contextPath}/register.html" style="margin-left: 10px">注册</a>
                    </c:when>
                    <c:otherwise>
                        <a>亲爱的：<b id="username">${sessionScope.userName}</b>你好！</a>
                    </c:otherwise>
                </c:choose>
            </li>
            <!--登陆状态信息显示end-->
            <li class="site-nav-pipe">|</li>
            <li class="menu">
                <a href="" rel="nofollow" target="_blank">订单查询</a>
            </li>
            <li class="site-nav-pipe">|</li>
            <!--我的花礼信息显示start-->
            <li class="menu dropdown">
                <a href="" rel="nofollow" data-hover="dropdown" data-delay="0" target="_blank">我的花礼</a>
            </li><!--我的花礼信息显示end-->
            <li class="site-nav-pipe">|</li>
            <li class="menu dropdown">
                <a href="" data-hover="dropdown" data-delay="0" target="_blank">客户服务<span
                        class="glyphicon glyphicon-triangle-bottom"></span></a>
                <div class="dropdown-menu dropdown-service">
                    <a href="/">在线付款</a>
                    <a href="/">帮助中心</a>
                    <a href="/" target="_blank">售后服务</a>
                    <a href="/" target="_blank">配送范围</a>
                    <a href="/" target="_blank">留言反馈</a>
                </div>
            </li>
            <li class="site-nav-pipe">|</li>
            <!--购物车信息显示start-->
            <li class="menu dropdown">
                <a href="${pageContext.request.contextPath}/goods/listGoodsCart.action" data-hover="dropdown"
                   data-delay="0" rel="nofollow" target="_blank"><span
                        class="ico ico-cart"></span>购物车<span class="text-primary" id="gwcCount"></span><span
                        class="glyphicon glyphicon-triangle-bottom"></span></a>
                <div class="dropdown-menu dropdown-cart" id="CartInfo"></div>
            </li><!--购物车信息显示end-->
            <li class="site-nav-pipe">|</li>
            <li class="menu slogan">
                小姐姐的花店: 会员中心
            </li>
        </ul>
    </div>
</div>
<!-- 顶部导航 End -->
<!-- 头部 -->
<header>
    <div class="logo">
        <h1><a href="/" class="logo-bd">会员中心</a></h1>
    </div>
    <div class="search">
        <form name="i_search" method="get" action="">
            <div class="input-group">
                <input name="keyword" type="text" class="form-control" placeholder="商品关键词">
                <span class="input-group-btn">
                        <button id="test" class="btn btn-primary" type="button" onClick="this.form.submit()">搜索</button>
                    </span>
            </div>
        </form>
    </div>
    <div class="service serviceDefault">
        <span class="ico ico-phone"></span>0791-8316800
        <a target="_blank" id="header-chat" href="javascript:;"><span class="ico ico-headset"></span>在线客服</a>
    </div>

</header>
<!-- 头部 End -->

<!-- 导航 -->
<nav class="common">
    <div class="container">
        <div class="categorys dropdown">
            <h3 class="categorys-title" data-hover="dropdown" data-delay="0">
                <a href=""><span class="pull-right glyphicon glyphicon-menu-down"></span>全部商品导购</a>
            </h3>
            <div class="dropdown-menu dropdown-cate">
                <h4><a href="">鲜花</a></h4>
                <ul class="cate-list list-inline">

                </ul>
                <h4><a href="">永生花</a></h4>
                <ul class="cate-list list-inline">

                </ul>

                <h4><a href="">蛋糕</a></h4>
                <ul class="cate-list list-inline">

                </ul>
                <h4><a href="">礼品</a></h4>
                <ul class="cate-list list-inline">

                </ul>
                <h4><a href="">绿植</a></h4>
                <ul class="cate-list list-inline">

                </ul>
            </div>
        </div>
        <ul class="nav">
            <li><a href="/">网站首页</a></li>
            <li><a href="">产品中心</a></li>
            <li><a href="">永生花</a></li>
            <li><a href="">绿植盆栽</a></li>
            <li><a href="">花语大全</a></li>
            <li><a href="">设计师臻选</a></li>
            <li><a href="">在线留言</a></li>
        </ul>
    </div>
</nav>
<!-- 导航 End -->
<div class="container">
    <div class="breadcrumbs"><a href="/">首页</a> &gt; <a href="">会员中心</a></div>
    <div class="wrapper about">
        <div class="pull-left w970 l230">
            <div class="box-border member-r">
                <div class="title">我的历史订单</div>
                <div class="order_box" >
                    <c:forEach items="${ordersList}" var="list">
                        <c:set var="priceTotal" value="0"/>
                        <c:set value="${orderDetails}" var="orderDetails"/><%-- 订单明细遍历 --%>
                        <c:set value="${getInfosList}" var="getInfoList"/><%-- 收货人细明遍历 --%>
                        <div class="order_box" style="border: 2px solid #d9d9d9;margin-top: 20px  ">
                                <%-- 当没获取到订单编号时，我们提示无处理的订单。当当获取到订单编号，先出处理的订单 --%>
                            <c:choose>
                                <c:when test="${list.orderId eq null}">
                                    <a id="orderInfo"
                                       href="${pageContext.request.contextPath}/user/loginPage.action?userName=${sessionScope.userName}">请就此点击进入：您当前无处理的订单，快去主页去选取你喜欢的商品吧！</a>
                                </c:when>
                                <c:otherwise>
                                    <div class="order_list">
                                            <%--  商品编号 --%>
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th>订单编号: <span style="margin-left: 20px">${list.orderId}</span></th>
                                            </tr>
                                            </thead>
                                        </table>
                                        <c:forEach items="${orderDetails}" var="orderDetailsItem">
                                            <c:set value="${orderDetailsItem}" var="orderDetailsItems"/>
                                            <c:set value="${goodsList}" var="goodsListItem"/>
                                            <c:forEach items="${orderDetailsItems}" var="orderDetailsItemss">
                                                <c:forEach items="${goodsListItem}" var="goodsListItems">
                                                    <c:choose>
                                                        <c:when test="${orderDetailsItemss.orderId eq list.orderId}"><%-- 如果当前订单详情id与订单的id匹配，输出当前订单细明--%>
                                                            <c:choose>
                                                                <c:when test="${orderDetailsItemss.goodsId eq goodsListItems.goodsId}"><%--  如果当前商品编号，与总的商品id匹配输出商品详情--%>
                                                                    <c:set var="priceTotal"
                                                                           value="${priceTotal+goodsListItems.goodsPrice*orderDetailsItemss.orderDetailNum }"/><%-- 计算商品的总价 --%>
                                                                    <%-- 商品明细  --%>
                                                                    <table class="table table-hover">
                                                                        <tbody>
                                                                        <thead>
                                                                        <tr>
                                                                            <th>购买名称</th>
                                                                            <th>商品图片</th>
                                                                            <th>购买数量</th>
                                                                            <th>商品单价</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tr>
                                                                            <td style="line-height: 50px">${goodsListItems.goodsName}</td>
                                                                            <td><img style="width: 50px"
                                                                                     src="../../images/goods${goodsListItems.goodsImg}.jpg"
                                                                                     alt="">
                                                                            </td>
                                                                            <td style="line-height: 50px">${orderDetailsItemss.orderDetailNum}
                                                                                <b>件</b></td>
                                                                            <td style="line-height: 50px">${goodsListItems.goodsPrice}<b>￥</b>
                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>

                                            <%--  商品总价操作   --%>
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th><span style="margin-left:0px;">总价:<span
                                                        style="margin-left: 850px">${priceTotal} <b>￥</b></span></span>
                                                </th>
                                            </tr>
                                            <tr>    <!--查看订单利用一个模态框展示-->
                                                <th><span style="margin-left:0px">     操作:<!-- 按钮触发模态框 -->
                                         <span style="margin-left: 800px">
                                         <a data-toggle="modal" data-target="#myModal${list.orderId}">订单详情</a>
                                             <!-- 查看订单详情结束 -->|<a
                                                 href="${pageContext.request.contextPath}/order/deleteOneHistoryOrder.action?orderId=${list.orderId}&userName=${sessionScope.userName}">删除订单</a> </span> </span>
                                                </th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>

                                </c:otherwise>
                            </c:choose>
                                <%-- 模态框 --%>
                            <!-- 模态框（Modal） -->
                            <div class="modal fade" id="myModal${list.orderId}" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;
                                            </button>
                                            <h4 class="modal-title text-center"
                                                id="myModalLabel">订单详细信息</h4>
                                        </div>
                                        <div class="modal-body">
                                            <c:set var="id" value="${list.orderId}"/>
                                            <c:forEach items="${ordersList}" var="list">
                                                <c:set var="priceTotal" value="0"/>
                                                <c:set value="${orderDetails}" var="orderDetails"/><%-- 订单明细遍历 --%>
                                                <c:set value="${getInfosList}" var="getInfoList"/><%-- 收货人细明遍历 --%>
                                                <c:choose>
                                                    <c:when test="${list.orderId eq id}">
                                                        <%-- 订单编号 不用循环内容 --%>
                                                        <table class="table table-hover">
                                                            <thead>
                                                            <tr>
                                                                <th>订单编号<span
                                                                        style="margin-left: 20px">${list.orderId}</span>
                                                                </th>
                                                            </tr>
                                                            </thead>
                                                        </table>
                                                        <%-- 循环显示内容 --%>
                                                        <c:forEach items="${orderDetails}" var="orderDetailsItem">
                                                            <c:set value="${orderDetailsItem}" var="orderDetailsItems"/>
                                                            <c:set value="${goodsList}" var="goodsListItem"/>
                                                            <c:forEach items="${orderDetailsItems}"
                                                                       var="orderDetailsItemss">
                                                                <c:forEach items="${goodsListItem}"
                                                                           var="goodsListItems">
                                                                    <c:choose>
                                                                        <c:when test="${orderDetailsItemss.orderId eq list.orderId}"><%-- 如果当前订单详情id与订单的id匹配，输出当前订单细明--%>
                                                                            <c:choose>
                                                                                <c:when test="${orderDetailsItemss.goodsId eq goodsListItems.goodsId}"><%--  如果当前商品编号，与总的商品id匹配输出商品详情--%>
                                                                                    <c:set var="priceTotal"
                                                                                           value="${priceTotal+goodsListItems.goodsPrice*orderDetailsItemss.orderDetailNum }"/><%-- 计算商品的总价 --%>
                                                                                    <table class="table table-hover">
                                                                                        <thead>
                                                                                        <tr>
                                                                                            <th>商品名称</th>
                                                                                            <th>商品图片</th>
                                                                                            <th>购买数量</th>
                                                                                            <th>商品单价</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                        <tr>
                                                                                            <td style="line-height: 50px">${goodsListItems.goodsName}</td>
                                                                                            <td><img style="width: 50px"
                                                                                                     src="../../images/goods${goodsListItems.goodsImg}.jpg"
                                                                                                     alt="">
                                                                                            </td>
                                                                                            <td style="line-height: 50px">${orderDetailsItemss.orderDetailNum}
                                                                                                <b>件</b></td>
                                                                                            <td style="line-height: 50px">${goodsListItems.goodsPrice}<b>￥</b>
                                                                                            </td>
                                                                                        </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </c:forEach>
                                                        <%--  不用循环显示内容 --%>
                                                        <table class="table table-hover">
                                                            <thead>
                                                            <tr>
                                                                <th>总价</th>
                                                                <th>${priceTotal} <b>￥</b></th>
                                                            </tr>
                                                            <tr>
                                                                <th>下单时间</th>
                                                                <th>${list.buyTime}</th>
                                                            </tr>
                                                            <tr>
                                                                <th>到货时间</th>
                                                                <th>${list.sendTime}</th>
                                                            </tr>
                                                            <c:forEach items="${getInfoList}"
                                                                       var="getInfoListItems"><%--w判断是当前收货人--%>
                                                                <c:choose>
                                                                    <c:when test="${getInfoListItems.getInfoID eq list.getInfoId}">
                                                                        <tr>
                                                                            <th>收货人</th>
                                                                            <th>${getInfoListItems.getInfoName}</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>收货人电话</th>
                                                                            <th>${getInfoListItems.getInfoTel}</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>配送地址</th>
                                                                            <th>${getInfoListItems.getInfoAddress}</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>收货人邮编</th>
                                                                            <th>${getInfoListItems.getInfoPost}</th>
                                                                        </tr>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:forEach>

                                                            <tr>
                                                                <th>订单状态</th>
                                                                <th>已完成</th>
                                                            </tr>
                                                            </thead>
                                                        </table>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">
                                                关闭
                                            </button>
                                            <button type="button" class="btn btn-primary">提交更改</button>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal -->
                            </div>
                                <%-- 模态框 --%>
                            <!-- 模态框（Modal） -->
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="pull-left w210 r970" id="containerBody">
            <div class="box-border">
                <div class="hd"><b></b>会员中心</div>
                <ul class="bd">
                    <li id="memberCenterItem"><a href="" style="font-size:12px;"><span class="ico ico-member1"></span>会员首页</a>
                    </li>
                    <li>
                        <span class="ico ico-member2"></span>订单信息
                        <ul>
                            <li id="myOrderItem"><a href="">我的订单</a></li>
                            <li id="cancelOrderItem"><a href="">历史订单</a></li>
                            <li id="myEvaluationItem"><a href="">我的评价</a></li>
                            <li id="myAttentionItem"><a href="Collect.html">我的收藏</a></li>

                        </ul>
                    </li>
                    <li>
                        <span class="ico ico-member3"></span>积分管理
                        <ul>
                            <li id="myScoresItem"><a href="">我的积分</a></li>
                            <li id="scoresExchangeItem"><a href="">积分兑换</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="ico ico-member4"></span>账户设置
                        <ul>
                            <li id="personInfoItem"><a href="">个人信息</a></li>
                            <li id="addressListItem"><a
                                    href="${pageContext.request.contextPath}/getInfo/getInfoDetailList.action?userName=${sessionScope.userName}">常用收货人</a>
                            </li>
                            <li id="addAddressListItem"><a
                                    href="${pageContext.request.contextPath}/getInfo/addOneGetInfoPage.action">新增收货人</a>
                            </li>
                            <li id="changeEmailItem"><a href="">修改登录名</a></li>

                            <li id="remindItem"><a href="">生日/纪念日提醒</a></li>
                            <li id="guanlian"><a href="">关联QQ/微信账号</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="ico ico-member5"></span>付款设置
                        <ul>
                            <li id="myVirtualAccountItem"><a href="">我的虚拟账户</a></li>
                            <li id="myCouponItem"><a href="">我的优惠券</a></li>
                            <li id="myEquitiesItem"><a href="">我的权益卡</a></li>
                            <li id="balanceFillItem"><a href="">在线补款</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="ico ico-member6"></span>客户服务
                        <ul>
                            <li id="guestMessageItem"><a href="">客服留言</a></li>
                            <li id="tsGuestMessageItem"><a href="">投诉留言</a></li>
                            <li id="chatItem"><a href="javascript:void(0);" onclick="openChatWindow()">在线客服</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--底部-->
<!-- 尾部导航 -->
<div class="footer-nav">
    <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=${sessionScope.userName}">首页</a> <b>|</b>
    <a href="" target="_blank">关于我们</a> <b>|</b>
    <a href="" target="_blank">联系方式</a> <b>|</b>

</div>
<!-- 尾部导航 End -->
<!-- 通用尾部 -->


</body>
</html>
