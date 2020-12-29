<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/9
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap-3.3.7/dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="../../jquery/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%-- 查询订单记录 --%>
<c:forEach items="${ordersList}" var="list">
    <c:set var="priceTotal" value="0"/>
    <c:set value="${orderDetails}" var="orderDetails"/><%-- 订单明细遍历 --%>
    <c:set value="${getInfosList}" var="getInfoList"/><%-- 收货人细明遍历 --%>
    <p>订单编号：${list.orderId}</p>
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
                                <p>商品编号：${goodsListItems.goodsId}</p>
                                <p>商品名称：${goodsListItems.goodsName}</p>
                                <p>商品描述：${goodsListItems.goodsDesc}</p>
                                <p>商品图片：<img src="../../images/goods${goodsListItems.goodsImg}.jpg" alt=""></p>
                                <p>商品价格：${goodsListItems.goodsPrice}</p>
                                <p>购买数量：${orderDetailsItemss.orderDetailNum}</p>
                            </c:when>
                        </c:choose>
                    </c:when>
                </c:choose>
            </c:forEach>
        </c:forEach>
    </c:forEach>
    <p>商品总价：${priceTotal}</p>
    <c:forEach items="${getInfoList}" var="getInfoListItems"><%--w判断是当前收货人--%>
        <c:choose>
            <c:when test="${getInfoListItems.getInfoID eq list.getInfoId}">
                <p>收货人姓名：${getInfoListItems.getInfoName}</p>
                <p>收货人电话：${getInfoListItems.getInfoTel}</p>
                <p>收货人地址：${getInfoListItems.getInfoAddress}</p>
                <p>收货人邮编：${getInfoListItems.getInfoPost}</p>
            </c:when>
        </c:choose>
    </c:forEach>
    <p>购买时间：${list.buyTime}</p>
    <p>发货时间：${list.sendTime}</p>
    <p>到货时间：${list.getTime}</p>
    <p><br><br><br><br></p>
</c:forEach>

===============================================================
<c:forEach items="${ordersList}" var="list">
    <c:set var="priceTotal" value="0"/>
    <c:set value="${orderDetails}" var="orderDetails"/><%-- 订单明细遍历 --%>
    <c:set value="${getInfosList}" var="getInfoList"/><%-- 收货人细明遍历 --%>
    <div class="order_box">
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
                                                 href="${pageContext.request.contextPath}/order/deleteOneDetail.action">删除订单</a> </span> </span>
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
                                                style="margin-left: 20px">${list.orderId}</span></th>
                                    </tr>
                                    </thead>
                                </table>
                                <%-- 循环显示内容 --%>
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
                                        <th>商品总价：${priceTotal} <b>￥</b></th>
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
                                        <th>待处理</th>
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

</body>
</html>
