<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/1
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎来到小姐姐的花店</title>
</head>
<link type="text/css" rel="stylesheet" href="../../css/homeListGoods/home01.css">
<link type="text/css" rel="stylesheet" href="../../css/homeListGoods/home02.css">
<link type="text/css" rel="stylesheet" href="../../css/homeListGoods/home03.css">
<link type="text/css" rel="stylesheet" href="../../css/homeListGoods/home04.css">
<link type="text/css" rel="stylesheet" href="../../css/homeListGoods/home05.css">
<link type="text/css" rel="stylesheet" href="../../css/homeListGoods/home06.css">
<link type="text/css" rel="stylesheet" href="../../css/common.css">
<link type="text/css" href="../../css/cebianlan.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../../css/home.css"/>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
    a:hover{
        text-decoration: none;
    }
</style>
<body>
<!-- 顶部导航 -->
<div class="topNavbar">
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
                <a href="#"> 小姐姐的花店</a>
            </li>
        </ul>
    </div>
</div>
<!-- 头部 登录部分-->

<!-- 顶部导航开始 -->
<header>
    <div class="logo">
        <h1><a href="#">小姐姐的花店</a></h1>
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
        <a target="_blank" id="header-chat"><span class="ico ico-headset"></span>在线客服</a>
    </div>

</header>
<!-- 顶部导航结束 -->

<!-- 中间轮播图部分 -->
<div class="login">
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="pic">
                    <img src="../../images/home01.png" alt="First slide">
                </div>
            </div>
            <div class="item">
                <div class="pic">
                    <img src="../../images/home02.jpg" alt="Second slide">
                </div>
            </div>
            <div class="item">
                <div class="pic">
                    <img src="../../images/home03.jpg" alt="Third slide">
                </div>
            </div>
            <div class="item">
                <div class="pic">
                    <img src="../../images/home04.jpg" alt="Third slide">
                </div>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- 控制按钮 -->
    <div class="small-carousel-div">
        <div class="slide-one small-carousel"><img src="../../images/home01.png"/></div>
        <div class="slide-two small-carousel"><img src="../../images/home02.jpg"/></div>
        <div class="slide-three small-carousel"><img src="../../images/home03.jpg"/></div>
        <div class="slide-four small-carousel"><img src="../../images/home04.jpg"/></div>
        <!--<input type="button" class="btn slide-one" value="Slide 1">
        <input type="button" class="btn slide-two" value="Slide 2">
        <input type="button" class="btn slide-three" value="Slide 3">
        <input type="button" class="btn slide-four" value="Slide 3">-->
    </div>
    <div style="clear: both"></div>
    <script>
        $(function () {
            // 循环轮播到某个特定的帧
            $(".slide-one").click(function () {
                $("#myCarousel").carousel(0);
            });
            $(".slide-two").click(function () {
                $("#myCarousel").carousel(1);
            });
            $(".slide-three").click(function () {
                $("#myCarousel").carousel(2);
            });
            $(".slide-four").click(function () {
                $("#myCarousel").carousel(3);
            });
        });
    </script>
</div>
<!-- 中间轮播图部分 结束 -->

<!--  侧边导航 -->
<div class="side_navbr">
    <div id="navi" class="clearfix">
        <div class="navi-container">
            <div class="navi-categorys">
                <h3 class="categorys-title">
                    <span class="icon icon-category"></span>
                    <a href="#" target="_blank">所有分类</a>
                </h3>
                <div class="dropdown-cate">
                    <div class="dropdown-cate-item">
                        <h4><a href="#" target="_blank">鲜花用途</a></h4>
                        <ul class="cate-list cate-list-inline">
                            <li><a href="#" target="_blank">爱情鲜花</a></li>
                            <li><a href="#" target="_blank">生日鲜花</a></li>
                            <li><a href="#" target="_blank">友情鲜花</a></li>
                            <li><a href="#" target="_blank">问候长辈</a></li>
                            <li><a href="#" target="_blank">探病慰问</a></li>
                            <li><a href="#" target="_blank">道歉鲜花</a></li>
                            <li><a href="#" target="_blank">祝贺鲜花</a></li>
                            <li><a href="#" target="_blank">婚庆鲜花</a></li>
                            <li><a href="#" target="_blank">商务鲜花</a></li>
                        </ul>
                    </div>
                    <div class="dropdown-cate-item">
                        <h4><a href="#" target="_blank">鲜花花材</a></h4>
                        <ul class="cate-list cate-list-inline">
                            <li><a href="#" target="_blank">玫瑰</a></li>
                            <li><a href="#" target="_blank">康乃馨</a></li>
                            <li><a href="#" target="_blank">百合</a></li>
                            <li><a href="#" target="_blank">向日葵</a></li>
                            <li><a href="#" target="_blank">扶郎</a></li>
                            <li><a href="#" target="_blank">郁金香</a></li>
                            <li><a href="#" target="_blank">马蹄莲</a></li>
                        </ul>
                    </div>
                    <div class="dropdown-cate-item cate-pop">
                        <a href="#" target="_blank"><h4>永生花<span class="icon icon-arrow-right"></span></h4>
                        </a>
                        <ul class="cate-list cate-list-inline">
                            <li><a href="#" target="_blank">永生瓶花</a></li>
                            <li><a href="#" target="_blank">经典花盒</a></li>
                            <li><a href="#" target="_blank">特色永生花</a></li>
                        </ul>
                    </div>
                    <div class="dropdown-cate-item cate-pop">
                        <a href="#" target="_blank"><h4>蛋糕<span class="icon icon-arrow-right"></span></h4></a>
                        <ul class="cate-list cate-list-inline">
                            <li><a href="#" target="_blank">元祖</a></li>
                            <li><a href="#" target="_blank">幸福西饼</a></li>
                            <li><a href="#" target="_blank">21cake</a></li>
                            <li><a href="#" target="_blank">诺心蛋糕</a></li>
                            <li><a href="#" target="_blank">窝夫小子</a></li>
                            <li><a href="#" target="_blank">BONCAKE</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <nav class="navbar">
                <div class="container">
                    <ul class="nav nav_ul" id="no">
                        <li role="presentation" class="home_li"><a class="active" href="#">网站首页</a></li>
                        <li class="dropdown" id="ho"><a href="../../goodsCenter.html" class="dropdown-toggle">产品中心</a></li>
                        <li role="presentation"><a href="#">永生花</a></li>
                        <li role="presentation"><a href="#">绿值盆栽</a></li>
                        <li role="presentation"><a href="#">花语大全</a></li>
                        <li role="presentation"><a href="../../designer.html">设计师臻选</a></li>
                        <li role="presentation"><a href="../../liuyan.html">在线留言</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<!--  侧边导航结束 -->

<!-- 右侧边导航栏 ---用户 -->
<script>
    jQuery(function () {
        //网站侧边栏
        (function ($) {
            var $box = $('#sidebar'), $qr_code = $box.find('.qr_code'), $coping = $box.find('.coping'),
                $consult = $box.find('.consult'), $phone = $box.find('.phone'),
                $consult_div = $box.find('.consult_div'), $phone_div = $box.find('.phone_div'), oBtn = true,
                oPtn = true;
            $box.css('marginTop', -$box.outerHeight(true) / 2);
            $box.mouseover(function () {
                $(this).stop().animate({right: 3}, 300);
                $qr_code.stop().animate({height: 200}, 300);
            }).mouseout(function () {
                $(this).stop().animate({right: -126}, 300);
                $qr_code.stop().animate({height: 54}, 300);
            });
            $coping.click(function () {
                document.documentElement.scrollTop = document.body.scrollTop = 0;
            });
            $consult.click(function () {
                if (oBtn) {
                    $consult_div.show();
                    if ($phone_div.is(":visible")) {
                        $phone_div.hide();
                        oPtn = !oPtn;
                    }
                } else {
                    $consult_div.hide();
                }
                oBtn = !oBtn;
            });
            $phone.click(function () {
                if (oPtn) {
                    $phone_div.show();
                    if ($consult_div.is(":visible")) {
                        $consult_div.hide();
                        oBtn = !oBtn;
                    }
                } else {
                    $phone_div.hide();
                }
                oPtn = !oPtn;
            });
        })(jQuery);
        //推广弹窗
        $("#fx_applypc").click(function () {
            $.layer({
                type: 2,
                title: '',
                area: ['560px', '320px'],
                offset: ['180px', ''],
                iframe: {src: "/account/fenxiao.php?type=fx_apply"}
            });
        });
        $("#fx_tgpc").click(function () {
            $.layer({
                type: 2,
                title: '',
                area: ['565px', '640px'],
                offset: ['10px', ''],
                iframe: {src: "/account/fenxiao.php?type=fx_tuiguang"}
            });
        });
        $("#fx_fxpc").click(function () {
            $.layer({
                type: 2,
                title: '',
                area: ['565px', '640px'],
                offset: ['10px', ''],
                iframe: {src: "/account/fenxiao.php?type=fx_fenxiang"}
            });
        });
    });
</script>
<div id="sidebar">
    <ul class="sidebar_ul">
        <li class="consult">
            <a href="#">在线客服</a>
            <div class="consult_div">
                <h3><span>&times;</span>客服</h3>
            </div>
        </li>
        <li class="user_center"><a href="${pageContext.request.contextPath }/person/userHome.action?userName=${sessionScope.userName}">用户中心</a></li>
        <li class="feedback"><a target="_blank" href="#">意见反馈</a></li>
        <li class="coping">返回顶部</li>
    </ul>
</div>

<!-- 产品展示 -->
<div class="GoodsDisplay">
    <div class="fl-wrapper clearfix">

        <!-- 楼层 爱情鲜花 -->
        <div class="fl f-lover">
            <div class="fl-container">
                <div class="hd">
                    <a class="more" href="#" target="_blank">更多爱情鲜花<span class="icon icon-arrow-right"></span></a>
                    <h3><a href="/aiqingxianhua/" target="_blank">爱情鲜花</a><span>送 · 让你怦然心动的人</span></h3>
                </div>
                <div class="bd">
                    <div class="bd-l">
                        <div class="banner-box">
                            <a href="/aiqingxianhua/" target="_blank"><img src="../../images/goods49.png" width="288"
                                                                           height="656"></a>
                            <div class="link-cover">
                                <a href="/aiqingxianhua/" target="_blank">爱情鲜花专区<span class="icon icon-dotarrow"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="fl-products">
                        <%--  从数据库遍历商品，包含商品图片、销量、描述、库存 --%>
                        <c:forEach items="${goodsList}" var="list" begin="0" end="7">
                            <div class="fl-products-item">
                                <a href="${pageContext.request.contextPath }/goods/goodsDetail.action?goodsId=${list.goodsId}"
                                   target="_blank">
                                    <div class="img-box" href="/product/9010966.html">
                                        <img src="../../images/goods${list.goodsImg}.jpg" height="240" width="220">
                                    </div>
                                    <div class="product-content">
                                        <p class="product-title">${list.goodsName}</p>
                                        <p class="product-price">
                                            <span class="price-sign">${ list.goodsPrice}&yen;</span>
                                            <span class="price-num" data-pp="9010966"></span>
                                        </p>
                                        <p class="product-sell">已售 ${ list.goodsSell} 件</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- 楼层 爱情鲜花 End -->
        <!-- 楼层 长辈鲜花 -->
        <div class="fl f-elder">
            <div class="fl-container">
                <div class="hd">
                    <a class="more"
                       href="${pageContext.request.contextPath }/goods/goodsDetail.action?goodsId=${list.goodsId}"
                       target="_blank">更多送长辈鲜花<span
                            class="icon icon-arrow-right"></span></a>
                    <h3><a href="/songzhangbeixianhua/" target="_blank">送长辈鲜花</a><span>赠 · 父母/恩师/长辈</span></h3>
                </div>
                <div class="bd">
                    <div class="bd-l">
                        <div class="banner-box">
                            <a href="/songzhangbeixianhua/" target="_blank"><img src="../../images/goods50.png"
                                                                                 width="288" height="656"></a>
                            <div class="link-cover">
                                <a href="/songzhangbeixianhua/" target="_blank">送长辈鲜花专区<span
                                        class="icon icon-dotarrow"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="fl-products">

                        <%--  从数据库遍历商品，包含商品图片、销量、描述、库存 --%>
                        <c:forEach items="${goodsList}" var="list" begin="08" end="15">
                            <div class="fl-products-item">
                                <a href="${pageContext.request.contextPath }/goods/goodsDetail.action?goodsId=${list.goodsId}"
                                   target="_blank">
                                    <div class="img-box" href="/product/9010966.html">
                                        <img src="../../images/goods${list.goodsImg}.jpg" height="240" width="220">
                                    </div>
                                    <div class="product-content">
                                        <p class="product-title">${list.goodsName}</p>
                                        <p class="product-price">
                                            <span class="price-sign">${ list.goodsPrice}&yen;</span>
                                            <span class="price-num" data-pp="9010966"></span>
                                        </p>
                                        <p class="product-sell">已售 ${ list.goodsSell} 件</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <!-- 楼层 长辈鲜花 End -->
        <!-- 楼层 永生花 -->
        <div class="fl f-song">
            <div class="fl-container">
                <div class="hd">
                    <a class="more" href="/yongshenghua/" target="_blank">更多永生花<span
                            class="icon icon-arrow-right"></span></a>
                    <h3><a href="/yongshenghua/" target="_blank">永生花</a><span>许 · 她一生承诺</span></h3>
                </div>
                <div class="bd">
                    <div class="bd-l">
                        <div class="banner-box">
                            <a href="/yongshenghua/" target="_blank"><img src="../../images/goods51.jpg" width="288"
                                                                          height="656"></a>
                            <div class="link-cover">
                                <a href="/yongshenghua/" target="_blank">永生花专区<span
                                        class="icon icon-dotarrow"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="fl-products">

                        <%--  从数据库遍历商品，包含商品图片、销量、描述、库存 --%>
                        <c:forEach items="${goodsList}" var="list" begin="16" end="23">
                            <div class="fl-products-item">
                                <a href="${pageContext.request.contextPath }/goods/goodsDetail.action?goodsId=${list.goodsId}"
                                   target="_blank">
                                    <div class="img-box" href="/product/9010966.html">
                                        <img src="../../images/goods${list.goodsImg}.jpg" height="240" width="220">
                                    </div>
                                    <div class="product-content">
                                        <p class="product-title">${list.goodsName}</p>
                                        <p class="product-price">
                                            <span class="price-sign">${ list.goodsPrice}&yen;</span>
                                            <span class="price-num" data-pp="9010966"></span>
                                        </p>
                                        <p class="product-sell">已售 ${ list.goodsSell} 件</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </div>
        <!-- 楼层 永生花 End -->
        <!-- 楼层 礼品 -->
        <div class="fl f-gifts">
            <div class="fl-container">
                <div class="hd">
                    <a class="more" href="/gifts/" target="_blank">更多礼品<span class="icon icon-arrow-right"></span></a>
                    <h3><a href="/gifts/" target="_blank">礼品</a><span>给她·最美好的礼物</span></h3>
                </div>
                <div class="bd">
                    <div class="f-gifts-banner">
                        <div class="f-gifts-banner-categorys">
                            <a href="/gifts/crystallaser/" target="_blank">水晶内雕/3D激光内雕水晶</a>
                            <a href="/livingflower/" target="_blank">进口/泰国保鲜花</a>
                            <a href="/gifts/goldenflower/" target="_blank">金箔玫瑰/金箔画</a>
                            <a href="/gifts/musicbox/" target="_blank">精品音乐盒/八音盒</a>
                            <a href="/gifts/a_birthday/" target="_blank">生日礼品</a>
                            <a href="/gifts/a_dating/" target="_blank">约会/求爱礼品</a>
                            <a href="/gifts/a_wedding/" target="_blank">结婚礼品</a>
                            <a href="/gifts/a_thankyou/" target="_blank">感谢/祝福礼品</a>
                            <a href="/gifts/a_visit/" target="_blank">拜访/探望礼品</a>
                            <a href="/gifts/a_anniversary/" target="_blank">结婚纪念日礼品</a>
                        </div>
                        <div class="f-gifts-banner-brands">
                            <a href="/gifts/swarovski/" target="_blank">
                                <img src="//img02.hua.com/m/category/Classification/m_category_gift_brand_SWAROVSKI.png">
                                <p>施华洛世奇</p>
                            </a>
                            <a href="/gifts/glamever/" target="_blank">
                                <img src="//img02.hua.com/m/category/Classification/m_category_gift_brand_GlamEver.png">
                                <p>Glam Ever潮牌饰品</p>
                            </a>
                            <a href="/gifts/dior/" target="_blank">
                                <img src="//img02.hua.com/m/category/Classification/m_category_gift_brand_Dior.png">
                                <p>迪奥Dior</p>
                            </a>
                            <a href="/gifts/maowang/" target="_blank">
                                <img src="//img02.hua.com/m/category/Classification/m_category_gift_brand_MW.png">
                                <p>猫王收音机</p>
                            </a>
                            <a href="/gifts/HelloKittySpecial/" target="_blank">
                                <img src="//img02.hua.com/m/category/Classification/m_category_gift_brand_HelloKitty.png">
                                <p>Hello Kitty</p>
                            </a>
                        </div>
                    </div>
                    <div class="fl-products fl-products-row">

                        <%--  从数据库遍历商品，包含商品图片、销量、描述、库存 --%>
                        <c:forEach items="${goodsList}" var="list" begin="24" end="33">
                            <div class="fl-products-item">
                                <a href="${pageContext.request.contextPath }/goods/goodsDetail.action?goodsId=${list.goodsId}"
                                   target="_blank">
                                    <div class="img-box" href="/product/9010966.html">
                                        <img src="../../images/goods${list.goodsImg}.jpg" height="240" width="220">
                                    </div>
                                    <div class="product-content">
                                        <p class="product-title">${list.goodsName}</p>
                                        <p class="product-price">
                                            <span class="price-sign">${ list.goodsPrice}&yen;</span>
                                            <span class="price-num" data-pp="9010966"></span>
                                        </p>
                                        <p class="product-sell">已售 ${ list.goodsSell} 件</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <!-- 楼层 礼品 End -->
        <!-- 楼层 晒单&资讯 -->
        <div class="fl f-comments">
            <div class="fl-container">
                <div class="hd">
                    <a class="more" href="/productpj/" target="_blank">查看所有评价<span class="icon icon-arrow-right"></span></a>
                    <h3><a href="/productpj/" target="_blank">晒单评价</a><span>用户实拍晒单</span></h3>
                </div>
                <div class="bd">
                    <div class="f-comments-list clearfix">
                        <div class="f-comments-item">
                            <a href="/product/9010766.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://img02.hua.com/pchttps://img02.hua.com/pc/assets/img/avatar_default_07.jpg"/>
                                        <span>XM*SF</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">谢谢鲜花非常漂亮！接受者非常满意！</p>
                                        <div class="f-comments-item-time">
                                            <p>湖南长沙市岳麓区</p>
                                            <p>2020-11-26</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/m/2020/11/26/0eb45dd30f414140ab680eb22899fa33.jpeg"
                                         alt="">
                                </div>
                            </a>
                        </div>
                        <div class="f-comments-item">
                            <a href="/product/9012452.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://img02.hua.com/pc/assets/img/avatar_default_04.jpg"/>
                                        <span>雨*多</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">满意，挺好看的</p>
                                        <div class="f-comments-item-time">
                                            <p>湖北武汉市武昌区</p>
                                            <p>2020-11-26</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/app/2020/11/26/ca1ef5f1ca3e4320a1d1fb95e94f4e76.jpeg"
                                         alt="">
                                </div>
                            </a>
                        </div>
                        <div class="f-comments-item">
                            <a href="/product/9012469.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eofKsDRUEunMicSyDya5EvRMxzuLKiaiax0p4QP8PDNBOfFpKvxqV3eHNPicKtTBWxDPcYORaKCXIQ5ew/132"/>
                                        <span>张*富</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">第一次尝试购买，送货速度快，太太收到了鲜花，花非常新鲜，非常满意。</p>
                                        <div class="f-comments-item-time">
                                            <p>上海长宁区</p>
                                            <p>2020-11-26</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/app/2020/11/26/3d3c16344ddf42fbbb416ae4886b5be2.jpeg"
                                         alt="">
                                </div>
                            </a>
                        </div>
                        <div class="f-comments-item">
                            <a href="/product/9012200.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://img02.hua.com/pc/assets/img/avatar_default_04.jpg"/>
                                        <span>于*方</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">很满意 妈妈很喜欢</p>
                                        <div class="f-comments-item-time">
                                            <p>天津滨海新区</p>
                                            <p>2020-11-26</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/m/2020/11/26/c3a0f86821034e73bcb64a7cfbad3543.jpeg"
                                         alt="">
                                </div>
                            </a>
                        </div>
                        <div class="f-comments-item">
                            <a href="/product/9012452.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erGzGP1k2fOaud6NiaHJPm23p84V2F4cCFAFzStUBshgpvK0V97nqBKx2FTAAkhtmbTrFicVDAaMcqQ/132"/>
                                        <span>Lily *u 许悦</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">非常准时，漂亮，满意的鲜花</p>
                                        <div class="f-comments-item-time">
                                            <p>北京西城区</p>
                                            <p>2020-11-24</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/app/2020/11/24/39ea7ab4dd724eeba06e1075c014b53f.jpeg"
                                         alt="">
                                </div>
                            </a>
                        </div>
                        <div class="f-comments-item">
                            <a href="/product/9012031.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://img02.hua.com/pc/assets/img/avatar_default_07.jpg"/>
                                        <span>武*</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">花很漂亮，也很新鲜，家里小仙女很是喜欢</p>
                                        <div class="f-comments-item-time">
                                            <p>浙江杭州市西湖区</p>
                                            <p>2020-11-24</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/app/2020/11/24/2149343a510a4e7ca079489128218727.png"
                                         alt="">
                                </div>
                            </a>
                        </div>
                        <div class="f-comments-item">
                            <a href="/product/9012467.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIvVsfztpqYmYpe20ymCJALQrnj0hLHVP0jQibAMxXDhs1ZKjbU3KaVxiadMOVkyrosFAytWXfg1p9Q/132"/>
                                        <span>咏*</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">
                                            实物和介绍完全一致，朋友非常喜欢，我也相当满意，面！售后服务态度好！快递也给力！后续还会再光顾</p>
                                        <div class="f-comments-item-time">
                                            <p>上海静安区</p>
                                            <p>2020-11-24</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/m/2020/11/24/9f005b4639bf43e7aba60ba13f47ea37.jpeg"
                                         alt="">
                                </div>
                            </a>
                        </div>
                        <div class="f-comments-item">
                            <a href="/product/9012462.html?huaPid=homepage-pj" target="_blank">
                                <div class="f-comments-item-l">
                                    <div class="f-comments-item-user">
                                        <img src="https://img02.hua.com/pc/assets/img/avatar_default_06.jpg"/>
                                        <span>贾*兰</span>
                                    </div>
                                    <div class="f-comments-item-info">
                                        <p class="f-comments-item-content">
                                            服务很好，准时送达。送之前还电话联系确定时间和地点，送之后再次电联告知。省去了自己提货时间。下次有需要再来买，如果在便宜点就更好了</p>
                                        <div class="f-comments-item-time">
                                            <p>北京丰台区</p>
                                            <p>2020-12-01</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="f-comments-item-r">
                                    <img src="//img.hua.com/reviewpic/m/2020/12/01/0dd88857e4e94837be2eba8415d80b87.jpg"
                                         alt="">
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 楼层 晒单&资讯 End -->
        <!-- 楼层 尾部服务 -->
        <div class="fl f-server">
            <div class="f-server-bd">
                <div class="articles">
                    <div class="articles-hd">
                        <a href="/huayu/" target="_blank">更多 &gt;</a>
                        <h4>热门资讯</h4>
                    </div>
                    <div class="articles-bd">
                        <ul class="articles-list">

                            <li class="articles-item"><a href="/theme/chunvzuo/" target="_blank">处女座鲜花礼物</a></li>
                            <li class="articles-item"><a href="/huayu/20051115103610.htm"
                                                         target="_blank">鲜花枝数与其对应的含意</a></li>
                            <li class="articles-item"><a href="/huayu/20051115103923.htm" target="_blank">鲜花寓意 浪漫花语</a>
                            </li>
                            <li class="articles-item"><a href="/huayu/20051116174222.htm" target="_blank">通用送花祝福语-经典送花祝福语</a>
                            </li>
                            <li class="articles-item"><a href="/huayu/20051115105306.htm" target="_blank">送花的常识与技巧</a>
                            </li>
                            <li class="articles-item"><a href="/huayu/20050405004253.htm"
                                                         target="_blank">女孩都喜欢别人送鲜花吗？</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23088.html" target="_blank"
                                                         title="表白应该送几朵玫瑰？告白玫瑰送几朵？">表白应该送几朵玫瑰？告白玫瑰送几</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23066.html" target="_blank"
                                                         title="最近要买礼物的男生速点！一大波新品已就位~">最近要买礼物的男生速点！一大波新</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/22994.html" target="_blank"
                                                         title="给爷爷送花有哪些选择？给老人送花推荐！">给爷爷送花有哪些选择？给老人送花</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/22993.html" target="_blank"
                                                         title="送花要注意什么？如何给老人，爱人，朋友送花？">送花要注意什么？如何给老人，爱人</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/14821.html" target="_blank"
                                                         title="12星座异地恋如何维持？送你一份送花攻略！">12星座异地恋如何维持？送你一份</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/10786.html" target="_blank"
                                                         title="送花的含义，生活中怎么送花？">送花的含义，生活中怎么送花？</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/11031.html" target="_blank"
                                                         title="送女朋友鲜花，送花卡片写什么？">送女朋友鲜花，送花卡片写什么？</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/13297.html" target="_blank"
                                                         title="异地恋有大招，教你不分手！">异地恋有大招，教你不分手！</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23682.html" target="_blank"
                                                         title="看望住院的朋友，哪些花适合送给病人？">看望住院的朋友，哪些花适合送给病</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23681.html" target="_blank"
                                                         title="百合的花语有哪些？百合有哪些颜色？">百合的花语有哪些？百合有哪些颜色</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23680.html" target="_blank"
                                                         title="圣诞节送花给暗恋的女生，送哪些花更浪漫">圣诞节送花给暗恋的女生，送哪些花</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23679.html" target="_blank"
                                                         title="君子兰开花代表哪些好兆头？">君子兰开花代表哪些好兆头？</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23678.html" target="_blank"
                                                         title="圣诞节给女朋友准备鲜花，让圣诞更甜蜜">圣诞节给女朋友准备鲜花，让圣诞更</a></li>
                            <li class="articles-item"><a href="//www.hua.com/huayu/23677.html" target="_blank"
                                                         title="冬天养花千万不能做哪些事？冬季养花攻略请拿好！">冬天养花千万不能做哪些事？冬季养</a></li>
                        </ul>
                    </div>
                </div>
                <ul class="f-server-list clearfix">
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server1"></span>15年品牌</a>
                    </li>
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server2"></span>3小时配送</a>
                    </li>
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server3"></span>订单实拍</a>
                    </li>
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server4"></span>200%退赔承诺</a>
                    </li>
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server5"></span>销量领先</a>
                    </li>
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server6"></span>百万客户信赖</a>
                    </li>
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server7"></span>低价保障</a>
                    </li>
                    <li class="f-server-item">
                        <a href="/profile/why_choose_us.htm" target="_blank"><span class="icon icon-server8"></span>时尚原创花艺</a>
                    </li>
                </ul>
                <div class="help-container clearfix">
                    <div class="help-server">
                        <h4>客户服务</h4>
                        <ul class="help-server-list clearfix">
                            <li><a href="/help/default.htm" target="_blank" rel="nofollow">服务声明</a></li>
                            <li><a href="/help/faq.htm" target="_blank" rel="nofollow">常见问题</a></li>
                            <li><a href="/help/afterservice.htm" target="_blank" rel="nofollow">售后服务</a></li>
                            <li><a href="/help/send_shuoming.htm" target="_blank" rel="nofollow">配送说明</a></li>
                            <li><a href="/help/sendRange.htm" target="_blank" rel="nofollow">配送范围</a></li>
                            <li><a href="/help/ordercx/" target="_blank" rel="nofollow">订单查询</a></li>
                            <li><a href="/help/order_cancel.htm" target="_blank" rel="nofollow">取消订单</a></li>
                            <li><a href="/help/re_payment.htm" target="_blank" rel="nofollow">补交货款</a></li>
                            <li><a href="/help/private.htm" target="_blank" rel="nofollow">隐私条款</a></li>
                            <li><a href="/help/safe.htm" target="_blank" rel="nofollow">安全条款</a></li>
                        </ul>
                    </div>
                    <div class="help-infos">
                        <h4>热门资讯</h4>
                        <ul class="help-infos-list clearfix">
                            <li><a href="/help/shop_step.htm" target="_blank" class="thiscolor_h">中国鲜花礼品网购物流程</a></li>
                            <li><a href="/help/demo.htm" target="_blank">中国鲜花礼品网订购演示</a></li>
                            <li><a href="/help/sendRange.htm" target="_blank">鲜花网能配送哪些城市？</a></li>
                            <li><a href="/help/afterservice.htm" target="_blank">鲜花售后服务是怎么样的？</a></li>
                            <li><a href="/help/Orde_in_advance.htm" target="_blank">我应该提前多久预订鲜花？</a></li>
                        </ul>
                    </div>
                    <div class="help-city">
                        <h4>同城鲜花专区</h4>
                        <ul class="help-city-list clearfix">
                            <li><a href="https://sz.hua.com/" target="_blank" title="深圳鲜花">深圳鲜花</a></li>
                            <li><a href="https://gz.hua.com/" target="_blank" title="广州鲜花">广州鲜花</a></li>
                            <li><a href="https://sh.hua.com/" target="_blank" title="上海鲜花">上海鲜花</a></li>
                            <li><a href="https://bj.hua.com/" target="_blank" title="北京鲜花">北京鲜花</a></li>
                            <li><a href="https://tj.hua.com/" target="_blank" title="天津鲜花">天津鲜花</a></li>
                            <li><a href="https://cq.hua.com/" target="_blank" title="重庆鲜花">重庆鲜花</a></li>
                            <li><a href="https://cd.hua.com/" target="_blank" title="成都鲜花">成都鲜花</a></li>
                            <li><a href="https://xa.hua.com/" target="_blank" title="西安鲜花">西安鲜花</a></li>
                            <li><a href="https://wh.hua.com/" target="_blank" title="武汉鲜花">武汉鲜花</a></li>
                            <li><a href="https://nj.hua.com/" target="_blank" title="南京鲜花">南京鲜花</a></li>
                            <li><a href="https://xm.hua.com/" target="_blank" title="厦门鲜花">厦门鲜花</a></li>
                            <li><a href="/help/sendRange.htm" target="_blank" title="更多城市">更多城市</a></li>
                        </ul>
                    </div>
                    <div class="help-contact">
                        <h4>联系我们</h4>
                        <div class="help-contact-content">
                            <p>全国订购热线：400-889-8188(免长途费)</p>
                            <p>E-mail: kefu@hua.com</p>
                            <p>7x24小时在线订购</p>
                            <p>客服工作时间：8:30-21:00</p>
                            <div class="help-contact-kf"><a href="javascript:void(0);" onclick="openChatWindow()"><span
                                    class="icon icon-contact"></span>在线客服</a></div>
                        </div>
                    </div>
                    <div class="help-qrcode">
                        <div class="help-qrcode-item">
                            <img src="//img02.hua.com/pc/pimg/home/app_download_qrcode.png" alt="">
                            <p>扫码下载手机版</p>
                        </div>
                        <div class="help-qrcode-item">
                            <img src="//img02.hua.com/pc/pimg/home/wxguanjia_qrcode.png" alt="">
                            <p>关注公众号有惊喜</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 楼层 尾部服务 End -->
    </div>


    <!--firefox 6.0提示-->
    <div class="invalid-ie" style="display:none;" id="firefoxTips">
        <div class="invalid-ie-cover"></div>
        <div class="invalid-ie-content">
            <img class="invalid-ie-img" src="https://img02.hua.com/pc/pimg/invalid-ie-tip.png?q">
            <a class="invalid-url-ie" href="https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads"
               target="_blank"></a>
            <a class="invalid-url-google" href="https://www.google.cn/chrome/index.html" target="_blank"></a>
        </div>
    </div>
    <!--pc个人号导流4.0-->


    <!--[if lt IE 8]>
    <div class="invalid-ie">
        <div class="invalid-ie-cover"></div>
        <div class="invalid-ie-content">
            <img class="invalid-ie-img" src="https://img02.hua.com/pc/pimg/invalid-ie-tip.png?q">
            <a class="invalid-url-ie" href="https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads"
               target="_blank"></a>
            <a class="invalid-url-google" href="https://www.google.cn/chrome/index.html" target="_blank"></a>
        </div>
    </div>
    <![endif]-->

    <div id="footer" class="ft">
        <div class="ft-container">
            <!-- 尾部导航 -->
            <div class="ft-nav">
                <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=visitor">首页</a>
                <a href="/profile/about.htm" target="_blank">关于我们</a>
                <a href="/profile/media.html" target="_blank">媒体报道</a>
                <a href="/profile/contact.htm" target="_blank">联系方式</a>
                <a href="/qiyetuangou/" target="_blank">企业团购</a>
                <a href="/liansuo/" target="_blank">花店入驻</a>
                <a href="/profile/links.htm" target="_blank">友情链接</a>
                <a href="/member/payment/balancefill" target="_blank">在线补款</a>
                <a href="/profile/why_choose_us.htm" target="_blank">为什么选择中国鲜花礼品网</a>
            </div>
            <!-- 尾部导航 End -->
            <!-- 尾部证书 -->
            <div class="ft-site">
                <p>
                    <a href="/profile/ChinaFlowerAssociation.htm" rel="nofollow" target="_blank" title="中国花卉协会会员">中国花卉协会会员</a>
                    <a href="/profile/chinaECA.htm" rel="nofollow" target="_blank">中国电子商务协会会员</a> ICP经营许可证：<a>粤B2-20050744</a>
                    <a href="http://beian.miit.gov.cn" rel="nofollow" target="_blank">粤ICP备09171662号</a> <span
                        class="icon icon-beian"></span>粤公网安备44030502000373号 Copyright © 2005-2020
                </p>
                <p>花礼网 （中国鲜花礼品网） <a href="/">www.hua.com</a><span> 深圳市百易信息技术有限公司</span> 中国鲜花网领先品牌，鲜花速递专家！</p>
                <div class="ft-auth">

                    <span class="icon icon-slogan"></span>
                    <a href="/profile/about.htm" target="_blank"><span class="icon icon-top100"></span></a>
                    <a href="/profile/ICP.htm" rel="nofollow" target="_blank"><span class="icon icon-icp"></span></a>
                    <div class="ft-auth-border">
                        <script id="ebsgovicon"
                                src="https://szcert.ebs.org.cn/govicons.js?id=fab6de6a-ff80-4e63-89e4-cd531170c256&width=75&height=105&type=1"
                                type="text/javascript" charset="utf-8"></script>
                    </div>
                </div>

            </div>
            <!-- 尾部证书 End -->
            <!-- 友情链接 -->
            <div class="ft-link">
                <span>友链</span>
                <a href="http://www.chinaname.cn/" target="_blank">中华取名网</a>
                <a href="http://sz.fang.com/" target="_blank">深圳房产网</a>
                <a href="http://www.juanpi.com" target="_blank">卷皮网</a>
                <a href="http://www.wbiao.cn" target="_blank">腕表</a>

                <a href="http://www.yuanlin365.com/" target="_blank">苗木</a>
                <a href="http://www.zocai.com/" target="_blank">佐卡伊珠宝网</a>
                <a href="http://www.blove.com/" target="_blank">钻石婚戒定制</a>

                <a href="http://www.iyijiao.com/" target="_blank">中国青少年艺术教育网</a>

                <a href="http://www.dog126.com/" target="_blank">淘狗网</a>
                <a href="http://www.liwuyou.com/" target="_blank">礼无忧网</a>
                <a href="http://www.goupuzi.com/" target="_blank">宠物狗</a>
                <a href="http://www.jiyouwang.com/" target="_blank">机友网</a>
                <a href="http://www.cocodiy.com/" target="_blank">礼物网</a>

                <a href="http://www.ipo3.com/" target="_blank">新三板</a>
                <a href="http://www.huoming.com/" target="_blank">商标注册</a>
                <a href="http://www.loho88.com" target="_blank">眼镜店</a>
            </div>
            <!-- 友情链接 End -->
        </div>
    </div>
</div>

</body>
</html>