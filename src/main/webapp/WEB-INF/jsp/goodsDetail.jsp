<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/7
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎来到小姐姐的花店</title>
</head>
<link href="../../css/common.css" rel="stylesheet" type="text/css">
<link href="../../css/home.css" rel="stylesheet" type="text/css">
<link href="../../css/goodsDetail.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://img02.hua.com/pc/css/productDetail.css?1118">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
    a:hover{
        text-decoration: none;
    }
</style>
<body>
<div class="body">
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

    <!-- 购物车部分 -->
    <div class="cart">
        <div class="cart_content">

            <!-- 左部图片部分 -->
            <div class="cart_content_left">
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
                                    <img src="../../images/goods${goodsDetail.goodsImg}.jpg" alt="First slide">
                                </div>
                            </div>
                            <div class="item">
                                <div class="pic">
                                    <img src="../../images/goods${goodsDetail.goodsImg}.jpg" alt="Second slide">
                                </div>
                            </div>
                            <div class="item">
                                <div class="pic">
                                    <img src="../../images/goods${goodsDetail.goodsImg}.jpg" alt="Third slide">
                                </div>
                            </div>
                            <div class="item">
                                <div class="pic">
                                    <img src="../../images/goods${goodsDetail.goodsImg}.jpg" alt="Third slide">
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
            </div>
            <!-- 左部图片部分 结束 -->

            <!-- 右侧购买部分 -->
            <div class="cart_content_right">
                <div class="product-info">
                    <div class="title">
                        <p class="title-name">${goodsDetail.goodsDesc}</p>
                        <div class="title-li">
                            <span class="title-point">[经典爆款，年销售冠军！]</span>
                            <span class="title-desc">精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎</span>
                        </div>
                    </div>
                    <div class="price">
                        <div class="price-item">
                            <span class="price-label" style="vertical-align:bottom;">售价</span>
                            <div class="price-box">
                                <span  id="sellPrice"><b style="color: orangered"> ${goodsDetail.goodsPrice}</b></span>
                                <span class="original-price">市场价<span class="s-price"
                                                                      id="originalPrice">${goodsDetail.goodsPrice+100}</span></span>
                            </div>
                            <div class="sale-count">已售<span>${goodsDetail.goodsSell}</span>万件</div>
                        </div>
                        <div class="price-time">
                            <span class="price-label">配送时间</span>
                            <div class="price-time-group">
                            </div>
                        </div>
                    </div>
                    <!---->
                    <div class="huayu">
                        <div class="huayu-item">
                            <span class="huayu-content1">花语： <b>你的轻柔像阵微风，让我从容不迫，想让你知道，我对你始终一往情深。</b></span>
                        </div>
                        <div class="huayu-item">
                            <span class="huayu-content2">材料：<b>高档礼盒装鲜花:19枝红玫瑰，勿忘我0.1扎</b></span>
                        </div>
                        <div class="huayu-item">
                            <span class="huayu-content3">包装：<b>牛皮纸和深咖啡色条纹纸，银色缎带花结，魔力铁山灰包装盒</b></span>
                        </div>
                        <!-- 配送地址选择 -->
                        <div class="delivery_area">
                            <span>配送至:</span>
                            <div class="delivery_area_select">
                                <label>省:</label>
                                <select id="province" onchange="change();">
                                    <option>请选择省份</option>
                                    <option>江西省</option>
                                    <option>广东省</option>
                                    <option>湖北省</option>
                                    <option>湖南省</option>
                                </select>
                                <label>市:</label>
                                <select id="city">
                                </select>
                            </div>
                        </div>

                    </div>
                    <!-- 选择 -->
                    <div class="delivery_select_goods">
                        <span>选择:</span>
                        <div class="small-carousel-div">
                            <div class="slide-one small-carousel"><img src="../../images/goods${goodsDetail.goodsImg}.jpg"/></div>
                            <div class="slide-two small-carousel"><img src="../../images/goods${goodsDetail.goodsImg}.jpg"/></div>
                            <div class="slide-three small-carousel"><img src="../../images/goods${goodsDetail.goodsImg}.jpg"/></div>
                            <div class="slide-four small-carousel"><img src="../../images/goods${goodsDetail.goodsImg}.jpg"/></div>
                        </div>
                    </div>
                    <!-- 购买按钮 -->
                    <div class="delivery">

                        <a id="btnAddcart" class="btn-group-item btn-addcart"
                           href="/goods/goodsCart.action?goodsId=${goodsDetail.goodsImg}"><span
                                class="icon icon-addcartbtn"></span>加入购物车</a>
                        <a id="btnSoonbuy" class="btn-group-item btn-soonbuy"
                           href="#">立即购买</a>
                        <a href="#"><span class="ico ico-star"></span>收藏</a>

                    </div>
                </div>
            </div>
            <!-- 右侧购买部分结束 -->
        </div>
    </div>
    <!-- 购物车结束 -->

    <!-- 清除浮动 -->
    <div style="clear: both"></div>

    <!-- 底部 -->
    <div class="footer-nav">
        <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=${sessionScope.userName}">首页</a> <b>|</b>
        <a href="" target="_blank">关于我们</a> <b>|</b>
        <a href="" target="_blank">联系方式</a> <b>|</b>
    </div>
</div>

</body>
<script type="text/javascript">
    function change() {
        var pro = document.getElementById("province");
        var city = document.getElementById("city");
        var index = pro.selectedIndex;
        var count = city.options.length;
        //js可以定义可变长度的数组
        var cities = [["请选择市"],
            ["南昌", "九江", "赣州"],
            ["长沙", "株洲", "岳阳"],
            ["武汉", "黄冈", "孝感"]
        ];
        //清空cities中的option选项
        for (var j = 0; j < count; j++) {
            city.removeChild(city.lastChild);
        }
        //在city中添加option选项
        for (var i = 0; i < cities[index].length; i++) {
            var option = document.createElement("option");
            option.innerHTML = cities[index][i];
            city.appendChild(option);
        }
    }
</script>
</html>