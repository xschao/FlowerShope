<%@ page import="java.util.Map" %>
<%@ page import="cn.jjxy.pojo.Goods" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/11/26
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<c:set var="flag" value="true" />
<c:forEach items="${goodsList}" var="list">
    <c:if test="${flag}" >
        <div class="fl-products-item">
            <a href="/product/9010966.html?huaPid=homepage-f101" target="_blank">
                <div class="img-box" href="/product/9010966.html">
                    <img src="../../images/goods${list.goodsImg}.jpg" height="240" width="220">
                </div>
                <div class="product-content">
                    <p class="product-title">${list.goodsDesc}</p>
                    <p class="product-price">
                        <span class="price-sign">${ list.goodsPrice}&yen;</span>
                        <span class="price-num" data-pp="9010966"></span>
                    </p>
                    <p class="product-sell">已售  ${ list.goodsSell} 件</p>
                </div>
            </a>
        </div>
        <c:if test="${list.goodsImg eq '08'}">
            <c:set var="flag" value="false"/>
        </c:if>
    </c:if>
</c:forEach>--%>
<%--<% Map<Goods , Integer> map =(Map<Goods, Integer>)session.getAttribute("cart"); //2. 遍历map
    if(map != null){
        for(Goods key : map.keySet()){
            int value = map.get(key);
            //key :商品名称 ， vlaue : 商品个数
            //<h3>名称：iphone7   数量:6</h3>
            %>
            <h3>名称：<%=key %>   数量:<%=value %></h3><br>
            <%
        }
    }
%>--%>
<%--<c:forEach items="sessionScope.cart"  var="entry">
    <tr>
        <td><input class="select" type="checkbox"></td>
        <td class="goods"><img src="${entry.key}">Microsoft/微软 Surface Pro i5 8G 256G 笔记本平板电脑二合一</td>
        <td class="price">4999.00</td>
        <td>
            <div class="number">
                <div class="desymbol">-</div>
                <div class="acc">1</div>
                <div class="adsymbol">+</div>
            </div>
        </td>
        <td class="total"></td>
        <td class="dele">删除</td>
    </tr>
</c:forEach>--%>
<c:forEach items="${sessionScope.cart}"  var="entry">
    <tr>
        <td>${entry.value}</td>
        <td>${entry.key.goodsImg} </td>
        <td>${entry.key.goodsName} </td>
        <td>${entry.key.goodsDesc} </td>
        <td>${entry.key.goodsPrice} </td>
        <td>${entry.key.goodsImg} </td>
    </tr>
</c:forEach>

</body>
</html>
