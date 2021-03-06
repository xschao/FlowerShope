<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/7
  Time: 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小姐姐的花店登录界面</title>
</head>
<link type="text/css" rel="stylesheet" href="../../css/common.css">
<link type="text/css" rel="stylesheet" href="../../css/login.css">
<script type="text/javascript" src="../../jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../../js/login.js"></script>
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
                    <a href="${pageContext.request.contextPath}/login.html">你好，请登录</a><a href="${pageContext.request.contextPath}/register.htmlq" style="margin-left: 10px">注册</a>
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
<!-- 头部 登录部分-->
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
<!-- 登录部分 -->
<div class="login">
    <div class="container">
        <div class="login-box">
            <!-- 登录/注册tab -->
            <ul class="login-tabs">
                <li class="active"><a href="">登录</a></li>
                <li><a href="register.html">注册</a></li>
            </ul>
            <hr/>
            <!-- 登录/注册tab End -->
            <a href="#" class="logMethod">使用手机验证码登录</a>
            <div style="clear:both;"></div>
            <!-- ====================================================用ajax方式登录，登录错误弹出提示框============================================== -->
            <div name="myForm" id="myForm"  >
                <div class="tab-content">
                    <!--登录信息提示区 end-->
                    <div class="form-group">
                        <label class="sr-only">用户名</label>
                        <div class="input-group">
                            <div class="input-group-addon"><span class="ico ico-user"></span></div>
                            <div class="input-group-input"><input id="userName"
                                                                  style="width: 250px ;height: 40px;  border: 1px solid  #dddddd;" name="userName"
                                                                  placeholder="E-mail地址/手机号" type="text"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="sr-only">密码</label>
                        <div class="input-group">
                            <div class="input-group-addon"><span class="ico ico-lock"></span></div>
                            <div class="input-group-input"><input id="passWord"
                                                                  style="width: 250px ;height: 40px; border: 1px solid  #dddddd; " name="passWord"
                                                                  placeholder="用户密码" type="password"/></div>
                        </div>
                    </div>
                    <div class="checkbox">
                        <label><input class="pull-left" type="radio" name="role" value="user">用户</label>
                        <label><input class="pull-left" type="radio" name="role" value="admin">管理员</label>
                    </div>
                    <div class="checkbox">
                        <a class="pull-right" href="#">忘记密码？</a>
                    </div>
                    <sapn id="checkLogin"></sapn>
                    <button onclick="login()" class="btn btn-primary" >登　录</button>
                </div>
                <!-- 普通登录 End -->
            </div>

            <div class="other-login-ways">
                <ul>
                    <li><a href="#" class="wx_login">微信</a><span class="line">|</span></li>
                    <li><a href="#">QQ</a><span class="line">|</span></li>
                    <li><a href="#">支付宝</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 底部 -->
<div class="footer-nav" >
    <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=visitor">首页</a>
    <a href="" target="_blank">关于我们</a> <b>|</b>
    <a href="" target="_blank">联系方式</a> <b>|</b>
</div>
</body>
</html>