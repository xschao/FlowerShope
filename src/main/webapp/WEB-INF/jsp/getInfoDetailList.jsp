<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/18
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎来到小姐姐的花店</title>
</head>

<link rel="stylesheet" type="text/css" href="../../css/goodsCart.css">
<link href="../../css/common.css" rel="stylesheet" type="text/css">
<link href="../../css/home.css" rel="stylesheet" type="text/css">
<link href="../../css/goodsDetail.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../../css/orderDetail.css">
<link rel="stylesheet" type="text/css" href="../../css/getInfoDetailList.css">
<script src="../../jquery/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../../bootstrap-3.3.7/dist/css/bootstrap.min.css"/>
<script src="../../bootstrap-3.3.7/dist/js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
    a:hover{
        text-decoration: none;
    }
</style>
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
            <a href="/login.html"><span class="ico ico-mobile"></span>小姐姐的花店app</a>
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

<!-- 返回用户主页 -->
<div class="back">
    <a href="#">用户主页</a>
    <b>></b> <a href="#" class="active">常用收货人 <b>></b></a>

</div>
<!-- 返回用户主页结束 -->

<!-- 显示常用守护人信息 -->
<div class="getInfoDetail">

    <table class="table table-bordered table-hover">
        <thead class="table_header">
        <tr>
            <th style="width: 50px;text-align: center">编号</th>
            <th style="width: 150px;">姓名</th>
            <th style="width: 200px">手机号</th>
            <th style="width: 600px">详细地址</th>
            <th style="width:100px">邮编</th>
            <th style="width:100px">操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listGetInfo}" var="list"  varStatus="status">
            <tr>
                <td style="display: none">${list.getInfoID}</td><%-- 用于标致收货人信息 --%>
                <td>${status.index+1}</td>
                <td>${list.getInfoName}</td>
                <td>${list.getInfoTel}</td>
                <td>${list.getInfoAddress}</td>
                <td>${list.getInfoPost}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/getInfo/delGetInfoOneData.action?getInfoId=${list.getInfoID}&userName=${sessionScope.userName}">删除</a> |
                    <%-- 修改弹出一个模态框 --%>
                    <a data-toggle="modal" data-target="#myModal">修改</a>
                        <%-- 修改的模态框开始 --%>
                    <!-- 模态框（Modal） -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        收货人地址
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="modifyGetInfoDate">
                                        <form class="form-horizontal" id="modifyGetInfo" role="form" method="post" action="${pageContext.request.contextPath}/getInfo/updateGetInfoOneData.action?userName=${sessionScope.userName}">
                                            <div class="form-group" style="display: none">
                                                <label for="number" class="col-sm-2 control-label">编号</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="number" name="getInfoID"
                                                           value="${list.getInfoID}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-sm-2 control-label">名字</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="name" name="getInfoName"
                                                           value="${list.getInfoName}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="tel" class="col-sm-2 control-label">手机号</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="tel" name="getInfoTel"
                                                           value="${list.getInfoTel}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="address" class="col-sm-2 control-label">详细地址</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="address" name="getInfoAddress"
                                                           value="${list.getInfoAddress} ">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="post" class="col-sm-2 control-label">邮编</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="post" name="getInfoPost"
                                                           value="${list.getInfoPost}">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default"
                                            data-dismiss="modal">关闭
                                    </button>
                                    <button onclick="document.getElementById('modifyGetInfo').submit();" type="button" class="btn btn-primary">
                                        提交更改
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                        <%-- 修改的模态框结束 --%>
                    <!-- 显示常用收货人信息结束 -->
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- 清除浮动 -->
<div style="clear: both"></div>

<!-- 底部 -->
<div class="footer-nav">
    <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=${sessionScope.userName}">首页</a> <b>|</b>
    <a href="" target="_blank">关于我们</a> <b>|</b>
    <a href="" target="_blank">联系方式</a> <b>|</b>
</div>
</body>
</html>
