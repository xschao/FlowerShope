<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mi
  Date: 2020/12/8
  Time: 21:18
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
    <link rel="stylesheet" href="../../bootstrap-3.3.7/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <b>></b> <a class="active" href="#" >订单支付</a>
</div>
<!-- 返回购物车结束 -->

<!-- 订单填写表 -->
<section class="order-main" style="border-top:1px solid #E9ECF0;">
    <div class="order-container" id="form1">
        <div class="login-box">
            <span class="iconfont iconfont-tips"></span>
            <span class="login-tips">如果想要新增收货人</span>
            <a class="login-a" href="${pageContext.request.contextPath}/getInfo/addOneGetInfoPage.action" onclick="DoWinLogin()">请点击></a>
            <span class="iconfont iconfont-emptytext" onclick="$('.login-box').hide()"></span>
        </div>
        <!-- 收货人信息 -->
        <div class="order-item" style="position:relative;margin-top:24px;">
            <h3 class="order-item-hd">收货人信息</h3>
            <!-- 没有地址记录 -->
            <div class="order-item-content" id="receiverAddress">
                <div class="order-item-li">
                    <label class="order-item-title">收货人</label>
                    <!-- <input class="order-item-input" placeholder="请输入收货人姓名" type="text" id="ToName" name="ToName"
                            maxlength="15" autocomplete="off">-->
                    <select class="order-item-select" id="getInfo"  onchange="getTel()" name="ToName" style="width: 325px" >
                        <option value="-1" >请选择你的收货人</option>
                    </select>
                </div>
                <div class="order-item-li">
                    <label class="order-item-title">手机号码</label>
                    <input class="order-item-input" placeholder="请输入收货人手机号码" type="text" id="ToMobile" name="ToMobile" maxlength="11" autocomplete="off">
                </div>
                <div class="order-item-li">
                    <label class="order-item-title">所在地区</label>
                    <select class="order-item-select" id="province" name="ToState" ><option value="-1">请选择</option></select>
                    <select class="order-item-select" id="city" name="ToCity" ></select>
                    <select class="order-item-select"  onchange="getAddress()" style="width:116px;" id="county" name="ToArea"></select>
                    <span class="order-item-wrong" style="display:none;" id="outrangeTips">您订单中存在的商品，在所选择城市暂时无法购买</span>
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
            </div>
        </div>
        <!-- 订购人信息 -->
        <div class="order-item">

            <h3 class="order-item-hd">订购人信息</h3>
            <div class="order-item-content " id="purchase_ipt">
                <div class="order-item-li">
                    <label class="order-item-title">订购人姓名</label>
                    <input class="order-item-input" placeholder="请输入订购人姓名" id="realname" name="realname" type="text" maxlength="15" autocomplete="off">
                    <span class="order-item-wrong" id="verify_name" style="display: none;">
        </span>
                </div>
                <div class="order-item-content-hastel" id="has_tel" style="display:block">
                    <div class="order-item-li">
                        <label class="order-item-title">订购人手机</label>
                        <input class="order-item-input" placeholder="请输入订购人手机号码" id="realphone" name="realphone" type="text" maxlength="11" autocomplete="off" >
                        <!-- 手机号已注册提示 -->
                        <span class="order-item-wrong" id="verify_tel" style="display: none;">
            </span>
                    </div>
                    <div class="order-item-notel">
                        <span onclick="purchaserObj.setHasEmail()">无中国大陆手机号 >></span>
                    </div>
                </div>
                <div class="order-item-content-notel" id="no_tel" style="display:none">
                    <div class="order-item-li">
                        <label class="order-item-title">订购人邮箱</label>
                        <input class="order-item-input" placeholder="请输入订购人邮箱" id="email" name="email" type="text"
                               maxlength="25" autocomplete="off" onblur="purchaserObj.onBlurEmail('email')" onfocus="purchaserObj.onFocusEmail()">
                        <!-- 手机号已注册提示 -->
                        <span class="order-item-wrong" id="verify_email" style="display: none;">
            </span>
                    </div>
                    <div class="order-item-li">
                        <label class="order-item-title unRequired">订购人电话</label>
                        <input class="order-item-input" placeholder="请输入订购人电话号码" id="outPhone" name="outPhone"
                               type="text" maxlength="25" autocomplete="off" onblur="purchaserObj.onBlurEmail('tel')">
                    </div>
                    <div class="order-item-notel">
                        <span onclick="purchaserObj.setHasMobile()">填写中国大陆手机号 >></span>
                    </div>
                </div>
            </div>
        </div>
        <!-- 送达日期 -->
        <div class="order-item">
            <h3 class="order-item-hd">送达日期</h3>
            <div style="margin-top:14px;">
                <label class="order-item-title" style="width:107px;">送达日期</label>
                <div class="order-item-date" id="select_date" onclick="deliObj.selecDate()">
                    <input placeholder="请选择送达日期" class="send-date" id="send_riqi" name="send_riqi" type="text" value='' readonly>
                    <span class="send-timing" id="selectTf"></span>
                    <span class="send-week" id="xingqi"></span>
                    <i class="iconfont iconfont-rili"></i>
                </div>
                <div id='divShow' style="position:absolute; z-index:9999; width:880px; height:auto; display:none; background:#FFFFFF;border:1px solid #979797;"><iframe src="" id="dialogIframe" name="dialogIframe" marginwidth="0" marginheight="0" scrolling="no" style="border: 0px none; width: 100%; height: 450px;" frameborder="0"></iframe></div>
            </div>
            <div class="order-item-inner time"></div>
            <p class="error-info" id="SendDate_ErrorInfo" style="display:none;">温馨提醒：<span class="error-info-text" id="dateErrMsg"></span></p>
            <input type="hidden" name="send_timezone" id="send_timezone" value="随时都可" />
            <input type="hidden" name="select_hours" id="select_hours" value="" />
            <input type="hidden" name="select_minutes" id="select_minutes" value="" />
            <input type="hidden" name="comfirmTime_num" id="comfirmTime_num" value="" />
        </div>
        <!-- 贺卡留言+署名 -->
        <div class="order-item">

            <h3 class="order-item-hd">贺卡留言</h3>
            <div class="order-item-box">
                <div class="order-item-left">
            <textarea class="order-item-left-textarea" name="words" id="words"
                      placeholder="写下您的祝福语，可附上署名（200字以内）" rows="5" maxlength="200"></textarea>
                    <span class="order-item-left-tips"><span class='text-bold' id="word">0</span>/200</span>
                </div>
                <div class="order-item-right">
                    <ul class="order-item-right-tab" id="card_tab">
                        <li class="active" data-id="#cardPane00">生日祝福</li>
                        <li class="" data-id="#cardPane01">送恋人</li>
                        <li class="" data-id="#cardPane02">送朋友</li>
                        <li class="" data-id="#cardPane03">送长辈</li>
                    </ul>
                    <div class="order-item-right-content ">
                        <ul class="order-item-right-pane active" id="cardPane00">
                            <li data-popover="true" data-content="亲爱的，生日快乐，我只想唯一霸道的拥有着一个你。给我开开心心的一辈子。生日快乐！my love">
                                1.亲爱的，生日快乐，我只想唯一霸道的拥有着一个你。给我开开心心的一辈子。生日快乐！my love
                            </li>
                            <li data-popover="true" data-content="今天是你的生日，你最大！在这个属于你最灿烂的日子里，我诚挚的送上一句最古老但又是最新鲜出炉的生日祝福：生日快乐！健康平安！">
                                2.今天是你的生日，你最大！在这个属于你最灿烂的日子里，我诚挚的送上一句最古老但又是最新鲜出炉的生日祝福：生日快乐！健康平安！
                            </li>
                            <li data-popover="true" data-content="亲爱的~~生日快乐生日快乐生日快乐~爱你么么哒——给全世界最温柔最可爱的小姐姐~">
                                3.亲爱的~~生日快乐生日快乐生日快乐~爱你么么哒——给全世界最温柔最可爱的小姐姐~
                            </li>
                            <li data-popover="true" data-content="感谢上苍在今天给了我一个特别的礼物，就是你。长长的人生旅程，有你相伴是我一生的幸福。祝你生日快乐!">
                                4.感谢上苍在今天给了我一个特别的礼物，就是你。长长的人生旅程，有你相伴是我一生的幸福。祝你生日快乐!
                            </li>
                            <li data-popover="true" data-content="在这个特别的日子里，我没有别的话，只想你知道，每年今天，你都会收到我的祝福，感受到我的爱，永远的爱!">
                                5.在这个特别的日子里，我没有别的话，只想你知道，每年今天，你都会收到我的祝福，感受到我的爱，永远的爱!
                            </li>
                            <li data-popover="true" data-content="有些事我每天都挂念，但只能一年说一次。迟到了，对不起。生日快乐！">
                                6.有些事我每天都挂念，但只能一年说一次。迟到了，对不起。生日快乐！
                            </li>
                            <li data-popover="true" data-content="特别的日子，特别的祝福，送给生日的你：希望长大一岁的你更成熟，更顺利，更漂亮！年年18！">
                                7.特别的日子，特别的祝福，送给生日的你：希望长大一岁的你更成熟，更顺利，更漂亮！年年18！
                            </li>
                            <li data-popover="true" data-content="你虽不在我身旁可我从未将你遗忘…做你想做的事，去你想去的地方，爱你想爱的人，追求你想追求的梦想，亲爱的朋友，祝你生日快乐！">
                                8.你虽不在我身旁可我从未将你遗忘…做你想做的事，去你想去的地方，爱你想爱的人，追求你想追求的梦想，亲爱的朋友，祝你生日快乐！
                            </li>
                            <li data-popover="true" data-content="简单的一句话语，一个祝福，寄给一个远在他乡的你。虽然不常联系，但是不曾忘记。祝你生日快乐，更愿你天天都有个好心情!">
                                9.简单的一句话语，一个祝福，寄给一个远在他乡的你。虽然不常联系，但是不曾忘记。祝你生日快乐，更愿你天天都有个好心情!
                            </li>
                            <li data-popover="true" data-content="您的生日让我想起您对我的体贴，还有您为我所做的一切。我只希望您所给予我的幸福，我将同样回报给您。祝福您事事顺心，幸福无边!">
                                10.您的生日让我想起您对我的体贴，还有您为我所做的一切。我只希望您所给予我的幸福，我将同样回报给您。祝福您事事顺心，幸福无边!
                            </li>
                            <li data-popover="true" data-content="妈妈，生日快乐！真希望能有语言能表达我们的谢意，感谢您每日操持家务及给予我们的帮助。愿您在今后的岁月中永远快乐、健康！">
                                11.妈妈，生日快乐！真希望能有语言能表达我们的谢意，感谢您每日操持家务及给予我们的帮助。愿您在今后的岁月中永远快乐、健康！
                            </li>
                        </ul>
                        <ul class="order-item-right-pane" id="cardPane01">
                            <li data-popover="true" data-content="遇到你我感到很幸福，但是我不能成为世界上最幸福的人，因为我们在一起，我要让你成为世界上最幸福的人。">
                                1.遇到你我感到很幸福，但是我不能成为世界上最幸福的人，因为我们在一起，我要让你成为世界上最幸福的人。
                            </li>
                            <li data-popover="true" data-content="有些情感，无需多么华美，只是简单的遇见，简单的想念，哪怕它只是简单到：拉着你的手，迎着风走！">
                                2.有些情感，无需多么华美，只是简单的遇见，简单的想念，哪怕它只是简单到：拉着你的手，迎着风走！
                            </li>
                            <li data-popover="true" data-content="我多么希望，有一个门口，早晨，阳光照在草上，我们站着，扶着自己的门扇，门很低，但太阳是明亮的。草在结它的种子，风在摇它的叶子，我们站着，不说话，就十分美好。">
                                3.我多么希望，有一个门口，早晨，阳光照在草上，我们站着，扶着自己的门扇，门很低，但太阳是明亮的。草在结它的种子，风在摇它的叶子，我们站着，不说话，就十分美好。
                            </li>
                            <li data-popover="true" data-content="如果世界上曾经有那个人出现过，其他人都会变成将就，而我，不愿意将就。没遇到爱时，它是一个遥不可及的幻梦，遇到爱之后，它是一份可以被触碰的美好，不善言辞的我，爱上了你后，突然有很多话想说给你听..">
                                4.如果世界上曾经有那个人出现过，其他人都会变成将就，而我，不愿意将就。没遇到爱时，它是一个遥不可及的幻梦，遇到爱之后，它是一份可以被触碰的美好，不善言辞的我，爱上了你后，突然有很多话想说给你听..
                            </li>
                            <li data-popover="true" data-content="我还是喜欢你，就像风追随云，我好想追到你，又怕吹散了你，春风十里，不如你。">
                                5.我还是喜欢你，就像风追随云，我好想追到你，又怕吹散了你，春风十里，不如你。
                            </li>
                            <li data-popover="true" data-content="亲爱的：在这特别的日子，我只能用心去默默地想你、爱你。只想告诉你：永远深爱着你，希望你每年的今天都能过一个快乐的生日。">
                                6.亲爱的：在这特别的日子，我只能用心去默默地想你、爱你。只想告诉你：永远深爱着你，希望你每年的今天都能过一个快乐的生日。
                            </li>
                            <li data-popover="true" data-content="为你的幸福而高兴，并且我愿付出一切让你更幸福。任何时候为爱你付出的一切都不是白白浪费。">
                                7.为你的幸福而高兴，并且我愿付出一切让你更幸福。任何时候为爱你付出的一切都不是白白浪费。
                            </li>
                            <li data-popover="true" data-content="爱你是我一生无悔的决定，漫天星星都是我注视你的眼睛。无论结局如何，我都知道：此生最爱是你！">
                                8.爱你是我一生无悔的决定，漫天星星都是我注视你的眼睛。无论结局如何，我都知道：此生最爱是你！
                            </li>
                            <li data-popover="true" data-content="时间会慢慢地让你了解，一个外表很冷漠又很怕羞的人，他的心却充满了对你的爱。">
                                9.时间会慢慢地让你了解，一个外表很冷漠又很怕羞的人，他的心却充满了对你的爱。
                            </li>
                            <li data-popover="true" data-content="我的错误，划破了你的心。如今，我用我真挚的爱弥补你的伤口，请接受我的诚意。">
                                10.我的错误，划破了你的心。如今，我用我真挚的爱弥补你的伤口，请接受我的诚意。
                            </li>
                        </ul>
                        <ul class="order-item-right-pane" id="cardPane02">
                            <li data-popover="true" data-content="一切的不顺心都是纸老虎！希望你开心！">
                                1.一切的不顺心都是纸老虎！希望你开心！
                            </li>
                            <li data-popover="true" data-content="不管世界尽头多寂寞，你的身边一定有我">
                                2.不管世界尽头多寂寞，你的身边一定有我
                            </li>
                            <li data-popover="true" data-content="不求同年同月同日生，但求同年同月同日疯">
                                3.不求同年同月同日生，但求同年同月同日疯
                            </li>
                            <li data-popover="true" data-content="最深的爱，总是风雨兼程；最浓的情，总是冷暖与共；最懂的人，才是最暖的伴。朋友，感恩有你。">
                                4.最深的爱，总是风雨兼程；最浓的情，总是冷暖与共；最懂的人，才是最暖的伴。朋友，感恩有你。
                            </li>
                            <li data-popover="true" data-content="不是所有人都能掏心掏肺，不是所有的路过都是风景，不是所有的擦肩都是过客。但无论是对朋友还是爱人，只要是在乎我的，我都会加倍珍惜！">
                                5.不是所有人都能掏心掏肺，不是所有的路过都是风景，不是所有的擦肩都是过客。但无论是对朋友还是爱人，只要是在乎我的，我都会加倍珍惜！
                            </li>
                            <li data-popover="true" data-content="吾在茫茫人海遇见了你，能成为知己，得知，我的幸运！">
                                6.吾在茫茫人海遇见了你，能成为知己，得知，我的幸运！
                            </li>
                            <li data-popover="true" data-content="朋友就是那种不需要时刻想起，永远也不会忘记的人，当我需要的时候，还没有讲，你已来到我的身边。不过有你的做伴使我不再感到渺小和孤独。">
                                7.朋友就是那种不需要时刻想起，永远也不会忘记的人，当我需要的时候，还没有讲，你已来到我的身边。不过有你的做伴使我不再感到渺小和孤独。
                            </li>
                            <li data-popover="true" data-content="无私无邪无猜无疑的友情无价，你是我买不到的奢华">
                                8.无私无邪无猜无疑的友情无价，你是我买不到的奢华
                            </li>
                            <li data-popover="true" data-content="人逢知己千杯少，难得在漫漫人生路上能认识你，在一起走过的日子，非常的感谢你给我的帮助，我始终不能忘记我们友谊，不能忘记我们在一起的点点滴滴，很想说有你真好，祝福你，我的朋友。">
                                9.人逢知己千杯少，难得在漫漫人生路上能认识你，在一起走过的日子，非常的感谢你给我的帮助，我始终不能忘记我们友谊，不能忘记我们在一起的点点滴滴，很想说有你真好，祝福你，我的朋友。
                            </li>
                            <li data-popover="true" data-content="这些日子你过得还好吗？也许忙碌改变了我们的生活，但我永远珍惜我们的情谊。">
                                10.这些日子你过得还好吗？也许忙碌改变了我们的生活，但我永远珍惜我们的情谊。
                            </li>
                        </ul>
                        <ul class="order-item-right-pane" id="cardPane03">
                            <li data-popover="true" data-content="引一缕清风，为妈妈带去轻松；采一缕阳光，为妈妈送去芬芳；掬一捧清水，为妈妈消去疲惫；送一束鲜花，为妈妈奉上祝福。祝妈妈生日快乐！">
                                1.引一缕清风，为妈妈带去轻松；采一缕阳光，为妈妈送去芬芳；掬一捧清水，为妈妈消去疲惫；送一束鲜花，为妈妈奉上祝福。祝妈妈生日快乐！
                            </li>
                            <li data-popover="true" data-content="美丽动人可爱迷人的妈妈：生日快乐！青春永驻！虽然不能陪伴在你身边，我的心一直陪伴着你，我爱你，妈妈。">
                                2.美丽动人可爱迷人的妈妈：生日快乐！青春永驻！虽然不能陪伴在你身边，我的心一直陪伴着你，我爱你，妈妈。
                            </li>
                            <li data-popover="true" data-content="“洗衣做饭忙不完，每日忙碌不着闲，历经风霜添白发，勤劳持家不知烦”。作为儿子女儿的我们，深知您每天的辛苦忙碌，但作为儿子女儿的我们，同样要给您幸福，祝您生日快乐，幸福万年长。">
                                3.“洗衣做饭忙不完，每日忙碌不着闲，历经风霜添白发，勤劳持家不知烦”。作为儿子女儿的我们，深知您每天的辛苦忙碌，但作为儿子女儿的我们，同样要给您幸福，祝您生日快乐，幸福万年长。
                            </li>
                            <li data-popover="true" data-content="从一个城市到另一个城市，只有靠自己努力。学会长大，学会承受，学会哭过之后，还可以微笑地拥抱爸爸妈妈。因为你们一直是我的守护神！让我走到哪里都不会怕！">
                                4.从一个城市到另一个城市，只有靠自己努力。学会长大，学会承受，学会哭过之后，还可以微笑地拥抱爸爸妈妈。因为你们一直是我的守护神！让我走到哪里都不会怕！
                            </li>
                            <li data-popover="true" data-content="谢谢您做的一切，双手撑起我们的家，总是竭尽所有把最好的给我们。不要再为我们而担心啦，你牵挂的孩子长大了。">
                                5.谢谢您做的一切，双手撑起我们的家，总是竭尽所有把最好的给我们。不要再为我们而担心啦，你牵挂的孩子长大了。
                            </li>
                            <li data-popover="true" data-content="岁月总是越来越短，生日总是越来越快。留不住的时光使您走向人生的至善，留得住的贺卡捎去的是我深深的怀念。真心希望晚辈的祝福带给您欢乐！">
                                6.岁月总是越来越短，生日总是越来越快。留不住的时光使您走向人生的至善，留得住的贺卡捎去的是我深深的怀念。真心希望晚辈的祝福带给您欢乐！
                            </li>
                            <li data-popover="true" data-content="听说神无法无处不在，所以创造了妈妈。即使到了妈妈的年龄，妈妈的妈妈仍然是妈妈的守护神。妈妈这个词，只是叫一叫，也觉得喉间哽咽。妈妈，最有力量的名字；妈妈，祝你永远年轻。">
                                7.听说神无法无处不在，所以创造了妈妈。即使到了妈妈的年龄，妈妈的妈妈仍然是妈妈的守护神。妈妈这个词，只是叫一叫，也觉得喉间哽咽。妈妈，最有力量的名字；妈妈，祝你永远年轻。
                            </li>
                            <li data-popover="true" data-content="父爱如山，父爱无言，您总是微笑着担起了整个家庭。在我心中，您是全天下最好的爸爸。">
                                8.父爱如山，父爱无言，您总是微笑着担起了整个家庭。在我心中，您是全天下最好的爸爸。
                            </li>
                            <li data-popover="true" data-content="您用优美的年轮，编成一册散发油墨清香的日历；年年，我都会在日历的这一天上，用深情的想念，祝福您的生日。">
                                9.您用优美的年轮，编成一册散发油墨清香的日历；年年，我都会在日历的这一天上，用深情的想念，祝福您的生日。
                            </li>
                            <li data-popover="true" data-content="亲爱的妈妈：您曾用您坚实的臂弯为我撑起一片蓝天；而今，我也要用我日益丰满的羽翼为您遮挡风雨。妈妈，我永远爱您！生日快乐！祝我的美女妈妈越来越青春，身体健康，瘦成闪电，未来的我可以每个假期带你出去纵横~">
                                10.亲爱的妈妈：您曾用您坚实的臂弯为我撑起一片蓝天；而今，我也要用我日益丰满的羽翼为您遮挡风雨。妈妈，我永远爱您！生日快乐！祝我的美女妈妈越来越青春，身体健康，瘦成闪电，未来的我可以每个假期带你出去纵横~
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <!-- 备注 -->
        <div class="order-item order-item-border-bottom" style="height:32px;line-height:32px;">
            <label class="order-item-checkbox" for="remarks">
                <i class="iconfont iconfont-unchecked"></i>
                <span class="order-item-checkbox-title">备注</span>
                <input type="checkbox" id="remarks"  name="remarks" onchange="questObj.openQuest('remarks')" hidden>
            </label>
            <div class="remarks-input" id="remarks_box" style="display:none;">
                <input type="text" id="quest" name="quest" placeholder="选填 (120字以内)" maxlength="120">
            </div>
        </div>
        <!-- 发票 -->
        <!-- 核对购物清单 -->
        <div class="order-item order-item-border-bottom order-item-line">
            <h3 class="order-item-hd">核对购物清单</h3>
            <div class="order-item-product-list" id="itemListbox">
                <p id="goodsIds" style="display: none">${goodsIds}</p><%-- 把订单所有的商品id传过去,一个商品的数组 --%>
                <p id="goodsNum" style="display: none">${goodsNum}</p><%-- 把订单所有的数量传过去，一个购买商品数量的数组--%>
                <c:forEach items="${goodsList}" var="list" varStatus="loop">
                    <div class="order-item-product-li">
                        <a href="/product/9012489.html" target="_blank" style="display: inline-block; width: 100%; height: 100%;">
                            <div class="order-item-product-pic">
                                <img src="../../images/goods${list.goodsImg}.jpg" alt="${list.goodsDesc}">
                            </div>
                            <div class="order-item-product-info">
                                <p class="order-item-product-name">${list.goodsDesc}</p>
                                <div>
                                    <span class="order-item-product-price" data-itemCode="9012489">${list.goodsPrice}</span>
                                    <span class="order-item-product-count">x${buyNumList[loop.count-1].toString()}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div class="order-item-footer">
                <div class="order-item-footer-left">
                    <div class="order-item-footer-send">
                        <span class="send-title">配送至：</span>
                        <span id="receiver_addr"> </span>
                    </div>
                    <div class="order-item-footer-receiver">
                        <span id="receiver_name" class="receiver-name"></span>
                        <span id="receiver_tel"></span>
                    </div>
                </div>
                <div class="order-item-footer-right">
                    <div class="order-item-footer-price">
                        共<span id="pro_count" class="pro-count"></span><span id="goodsTotal">${goodsTotal}</span>件商品，总商品金额：<span id="goodsTotalPrice">${goodsTotalPrice}</span>
                        <span id="pro_price" class="pro-price"></span>
                    </div>
                    <div class="order-item-footer-ps" id="dingshiFeeHtml" style="display:none;">
                        定时服务费： +¥ <span class="ps-price" id="dignshiFee"></span>
                    </div>
                    <div class="order-item-footer-ps" id="jifenFeeHtml" style="display:none;">
                        积分抵扣： -¥ <span class="ps-price" id="jifenFee"></span>
                    </div>
                    <div class="order-item-footer-ps" id="yeFeeHtml" style="display:none;">
                        余额抵扣： -¥ <span class="ps-price" id="yeFee"></span>
                    </div>
                    <div class="order-item-footer-ps" id="yhqFeeHtml" style="display:none;">
                        <span id="yhqMode"></span>抵扣： -¥ <span class="ps-price" id="yhqFee"></span>
                    </div>
                    <div class="order-item-footer-pay">
                        应付：${goodsTotalPrice}<span class="pay-price " id="payMoney"></span>
                        <button href="#modal-container-179421" role="button"data-toggle="modal" class="pay-btn" id="pay_btn">点击支付</button>
                        <!-- 弹出支付的界面扫码界面 -->
                        <div class="container">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <div class="modal fade" id="modal-container-179421" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content text-center">
                                                <div class="modal-header ">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h4 class="modal-title" id="myModalLabel">
                                                        请扫码支付
                                                    </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <img style="width: 50%" src="../../images/pay.jpg">
                                                </div>
                                                <div class="modal-footer">
                                                    <a type="button" class="btn btn-default"  onclick="paySubmit()">完成订单</a>
                                                    <a type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 弹出支付的界面扫码界面结束 -->
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- 订单填写表结束 -->
<div class="footer-nav" >
    <a href="${pageContext.request.contextPath}/user/loginPage.action?userName=${sessionScope.userName}">首页</a>
    <a href="" target="_blank">关于我们</a> <b>|</b>
    <a href="" target="_blank">联系方式</a> <b>|</b>
</div>
</body>
<script src="../../js/orderDetail.js" type="text/javascript"></script>
</html>