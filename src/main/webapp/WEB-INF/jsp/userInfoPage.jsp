<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/7
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎来到小姐姐的花店</title>
    <script type="text/javascript" src="../../jquery/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="../../bootstrap-3.3.7/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../../css/userInfoPage.css">
    <link type="text/css" rel="stylesheet" href="../../css/common.css">
    <style type="text/css">
        /*Logo替换 2018-10-31 16:17:57*/
        header .logo {
            background-image: url(../../images/logo.jpg);
            background-position: left;
            background-size:168px;

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
    <style type="text/css">
        table{
            position: absolute;
            top: 171px;
            left: 20px;
            margin:0 auto;
            width:50%;
            border:2px solid #aaa;
            border-collapse:collapse;
        }
        h1{
            text-align:center;
        }
        tr{

        }
        th{
            background-color:#eee;
            border:2px solid  #aaa;
        }
        td{
            border:2px solid #aaa;
            text-align:center;
        }

    </style>
    <style>
        li.active a {
            color: #ff6a00 !important;
            background-color: transparent;
        }
        a:hover{
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
                        <a href="${pageContext.request.contextPath}/login.html">你好，请登录</a><a href="${pageContext.request.contextPath}/register.html" style="margin-left: 10px">注册</a>
                    </c:when>
                    <c:when test="${sessionScope.userName eq 'visitor'}">
                        <a href="${pageContext.request.contextPath}/login.html">你好，请登录</a><a href="${pageContext.request.contextPath}/register.html" style="margin-left: 10px">注册</a>
                    </c:when>
                    <c:otherwise>
                        <a>亲爱的：<b>${user.userName}</b>你好！</a>
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
                <a href="" data-hover="dropdown" data-delay="0" target="_blank">客户服务<span class="glyphicon glyphicon-triangle-bottom"></span></a>
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
                <a href="${pageContext.request.contextPath}/goods/listGoodsCart.action" data-hover="dropdown" data-delay="0" rel="nofollow" target="_blank"><span class="ico ico-cart"></span>购物车<span class="text-primary" id="gwcCount"></span><span class="glyphicon glyphicon-triangle-bottom"></span></a>
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
                <div class="title">您好，欢迎进入会员中心</div>

                <div class="member-info">
                    <div class="user">
                        <div class="avatar">
                            <a href="">
                                <img src="//img02.hua.com/pc/assets/img/avatar_default_09.jpg" />
                            </a>
                        </div>
                        <p>
                            ${user.userName}<br>
                            <span class="ico ico-pthy"></span>
                            普通会员                </p>
                    </div>
                    <div class="my-counts">
                        <a href="">
                            <b><span class="ico ico-m-pay"></span></b>待付款  <span class="">0</span>
                        </a>

                        <a href="">
                            <b><span class="ico ico-m-receive"></span></b>今日配送 <span class="">0</span>
                        </a>

                        <a href="">
                            <b><span class="ico ico-m-comment"></span></b>待评价 <span class="">0</span>
                        </a>
                    </div>
                    <ul class="my-stuffs list-unstyled">
                        <li><a href="">余额: 0</a></li>
                        <li><a href="">积分: 0</a></li>
                        <li><a href="">优惠券: 0</a></li>
                    </ul>

                    <div class="verify-mobile">
                        <form action="${pageContext.request.contextPath}/person/modifyUserData.action?userId=${user.userId}" method="post">
                            <c:choose>
                                <c:when test="${user.userName eq 'visitor'}">
                                    <p>姓名: <input type="text" name="name" /></p>
                                </c:when>
                                <c:otherwise>
                                    <p>姓名: <input type="text" name="name" value="${user.userName}" /></p>
                                </c:otherwise>
                            </c:choose>
                            <p>密码: <input type="password" name="psd" value="${user.userPsd}" /></p>
                            <p>性别: <input type="text" name="sex" value="${user.userSex}" maxlength="1" autocomplete="off" /></p>
                            <p>电话号码: <input type="text" name="tel" value="${user.userTel}"maxlength="11" autocomplete="off" /></p>
                            <button class="btn btn-primary btn-sm" type="submit" > 修改 <span class="glyphicon glyphicon-chevron-right"></span></button>
                        </form>
                    </div>
                </div>
                <div class="how-vip">
                    <h3>蓝色妖姬花语</h3>
                    <p>蓝色妖姬寓意是清纯的爱和敦厚善良的爱。<br>相知是一种宿命，心灵的交汇让我们有诉不尽的浪漫情怀；相守是一种承诺，人世轮回中，永远铭记我们这段美丽的爱情故事！</p>
                </div>


                <div class="pull-left w970 l230">
                    <div class="box-border member01-r">

                        <div class="attention-wrap">
                            <div class="title">
                                <h3>我的收藏</h3>
                            </div>
                        </div>

                        <div class="attention-all">
                            <div class="all-l">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="selectall" onchange="checkselect();"> 全选
                                    </label>

                                </div>
                                <!--<a id="addShoppingCar" class="btn btn-default btn-sm btn-m"><span class="ico ico-cart-m"></span>加入购物车</a>-->
                                <a id="cancledAttention" style="cursor:pointer">取消收藏</a>
                                <input type="hidden" name="method" id="method" value="cancled">
                            </div>
                        </div>
                        <div class="attention-list">

                            <p align="center"></p><center><font color="red"><b></b></font></center><p></p>

                            <table>

                                <thead>
                                <tr>
                                    <th >编号</th>
                                    <th >商品颜色</th>
                                    <th >商品价格</th>
                                    <th >库存</th>
                                    <th >操作</th>

                                </tr>
                                </thead>
                                <tbody>

                                <tr id="tr1">
                                    <td id="prname"></td>
                                    <td id="color"></td>
                                    <td id="value"></td>
                                    <td id="inventory"></td>
                                    <td id="operation"><button onclick="dian1(this)">加入购物车</button></td>
                                </tr>
                                <tr id="tr2">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                    <td><button onclick="dian1(this)">加入购物车</button></td>
                                </tr>
                                <tr id="tr3">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                    <td><button onclick="dian1(this)">加入购物车</button></td>
                                </tr>
                                <tr  id="tr4">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                    <td><button onclick="dian1(this)">加入购物车</button></td>
                                </tr>
                                <tr id="tr5">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                    <td><button onclick="dian1(this)">加入购物车</button></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="pull-left w210 r970" id="containerBody">
            <div class="box-border">
                <div class="hd"><b></b>会员中心</div>
                <ul class="bd">
                    <li id="memberCenterItem"><a href="" style="font-size:12px;"><span class="ico ico-member1"></span>会员首页</a></li>
                    <li>
                        <span class="ico ico-member2"></span>订单信息
                        <ul>
                            <li id="myOrderItem"><a href="#">我的订单</a></li>
                            <li id="cancelOrderItem"><a href="${pageContext.request.contextPath}/order/showOrderHistory.action?userName=${sessionScope.userName}">我的历史订单</a></li>
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
                            <li id="addressListItem"><a href="${pageContext.request.contextPath}/getInfo/getInfoDetailList.action?userName=${sessionScope.userName}">常用收货人</a></li>
                            <li id="addAddressListItem"><a href="${pageContext.request.contextPath}/getInfo/addOneGetInfoPage.action">新增收货人</a></li>
                            <li id="changePwdItem"><a href="">修改密码</a></li>
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
    <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=${user.userName}">首页</a> <b>|</b>
    <a href="" target="_blank">关于我们</a> <b>|</b>
    <a href="" target="_blank">联系方式</a> <b>|</b>

</div>
<!-- 尾部导航 End -->
<!-- 通用尾部 -->


</body>
</html>