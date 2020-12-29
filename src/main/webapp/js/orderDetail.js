var provinceArr = ['上海市', '江苏省', '河北省'];
var cityArr = [
    ['上海市'],
    ['苏州市', '南京市', '扬州市'],
    ['石家庄', '秦皇岛', '张家口']
];
var countyArr = [
    [
        ['黄浦区', '静安区', '长宁区', '浦东区']
    ],
    [
        ['虎丘区', '吴中区', '相城区', '姑苏区', '吴江区'],
        ['玄武区', '秦淮区', '建邺区', '鼓楼区', '浦口区'],
        ['邗江区', '广陵区', '江都区']
    ],
    [
        ['长安区', '桥西区', '新华区', '井陉矿区'],
        ['海港区', '山海关区', '北戴河区', '抚宁区'],
        ['桥东区', '桥西区', '宣化区', '下花园区']
    ]
];
//创建填充页面下拉列表的函数
//obj:接受下拉菜单对象参数,
//data:接收 一维数组
function createOption(obj, data) {
    for (var i in data) {//遍历data数组
        //data[i]:下拉选项值
        //i:下拉选项位置
        /*option的方法：
         增加一个<option>标签-----obj.options.add(new("文本","值"));<增>
         删除一个<option>标签-----obj.options.remove(obj.selectedIndex)<删>
         获得一个<option>标签的文本-----obj.options[obj.selectedIndex].text<查>
         修改一个<option>标签的值-----obj.options[obj.selectedIndex]=new Option("新文本","新值")<改>
         删除所有<option>标签-----obj.options.length = 0
         获得一个<option>标签的值-----obj.options[obj.selectedIndex].value*/
        var op = new Option(data[i], i);//创建下拉选项，并把data中对应的数据填充进去
        obj.options.add(op);//添加下拉选项到菜单中
    }
}

//第二部：分别配置省、市、区的下拉菜单选项
//分别获取页面中的省市区三个select标签对象
var province = document.getElementById('province');
var city = document.getElementById('city');
var county = document.getElementById('county');
//建立省级菜单项
createOption(province, provinceArr);
province.onchange = function () {
    city.options.length = 0;//将以创建的下拉项选项清空
    createOption(city, cityArr[province.value]);//创建新的市级下拉选项
    city.onchange();
};
city.onchange = function () {
    county.options.length = 0;//将以创建的下拉项选项清空
    createOption(county, countyArr[province.value][city.value]);//创建新的区级下拉选项
};

<!--贺卡留言信息-->
var cardObj = {
    formData: {
        cardMsg: "",
    },
    bindEvent: function () {
        //监听贺卡输入
        $('#words').bind('input propertychange', function () {
            var len = $(this).val().length;
            $('#word').html(len);
        })
        // 贺卡导航栏切换
        $("#card_tab").on('click', 'li', function () {
            $(this).addClass('active').siblings().removeClass('active');
            var domId = $(this).attr('data-id');
            $('.order-item-right-pane').removeClass('active');
            $(domId).addClass('active');
        })
        //选择留言
        $('.order-item-right-content').on('click', 'li', function () {
            var sendinfo = $(this).attr('data-content');
            $('#words').val(sendinfo);
            $("#words").trigger("propertychange");
        })
    },
};
cardObj.bindEvent();

/* 异步获取收货人 */
window.onload = SearchVehicleTag(); //页面开始时执行该方法，所以只会执行一次
function SearchVehicleTag() {
     var userName = $("#username").text();
     var params = {userName: userName};
     $.ajax({
         type: "POST",
         url: "/order/getInfoName.action",
         data: params,
         dataType: "json",
         success: function (data) {
             for (var j=0; j < data.length; j++) {
                 var jsonObj = data[j];
                 $("#getInfo").append("<option id='sel'  value='"+jsonObj.getInfoID+"'>"+jsonObj.getInfoName+"</option>")
             }
         },error:function (msg) {
                console.log("获取数据出错");
         }
     });
 }
/*异步获取电话号*/
function getTel() {
    var id = $("#getInfo option:selected").val();
    var userName =  $("#username").text();
    var params = {userName: userName};
    $.ajax({
        type: "POST",
        url: "/order/getInfoName.action",
        data: params,
        dataType: "json",
        success: function (data) {
            for(var i=0;i<data.length;i++){
                if(data[i].getInfoID==id){
                    $("#ToMobile").val(data[i].getInfoTel);
                    $("#realname").val(data[i].users.userName);
                    $("#realphone").val(data[i].users.UserTel);
                    var getTime = new Date();//预计1天后送达
                    $("#send_riqi").val(getTime.getFullYear()+"-"+(getTime.getMonth()+1)+"-"+(getTime.getDate()+1)/*+"    "+getTime.getHours()+":"+getTime.getMinutes()*/);
                }
            }

        }
    });
}
/* 异步获取详细地址 */
function getAddress() {
    var id = $("#getInfo option:selected").val();
    var userName =  $("#username").text();
    var params = {userName: userName};
    $.ajax({
        type: "POST",
        url: "/order/getInfoName.action",
        data: params,
        dataType: "json",
        success: function (data) {
            for(var i=0;i<data.length;i++){
                if(data[i].getInfoID==id){
                    $("#ToMobile").val(data[i].getInfoTel);
                    /* 拼接收货地址 */
                    var province = $("#province  option:selected").text();
                    var city = $("#city option:selected").text();
                    var  county =$("#county option:selected").text();
                    var address = province + city +county;
                    $("#ToAddress").val(address+ data[i].getInfoAddress);
                }
            }

        }
    });
}
/* 提交订单 。跳转到用户的订单界面 */
function paySubmit() {
    /* 一下的信息可以根据某条信息查询到 */
    var getInfoName = $("#getInfo option:selected").val();//获取收货人编号
    var ToAddress = $("#ToAddress").text();//收货人详细地址
    var realname = $("input[name='realname']").val();//获取订货人姓名
    var getTime = $("#send_riqi").val();//获取预计到货时间

    /* 一下的信息是订单产生的，必须传递过去生成订单信息 */
    var goodsTotalPrice = $("#goodsTotalPrice").text();//获取商品总价
    var goodsTotal = $("#goodsTotal").text();//获取商品总数
    var goodsList = $("#goodsIds").text();//获取订单中的商品编号，一个数组
    var buyNumList = $("#goodsNum").text();//获取商品的购买数量，一个数组
    /* 以上的信息形成一个订单信息，拼成一个param传递给后台 */
    var params = {getInfoName:getInfoName,realName:realname,getTime:getTime,goodList:goodsList,buyNumList:buyNumList};
    $.ajax({
        type: "POST",
        contentType: 'application/json',
        data:JSON.stringify(params),/* 解决乱码问题 */
        url: "/order/generateOrder.action;charset=UTF-8",/* 传递后台设置数据根式和字符编码 */
        dataType: "json",
        success: function (data) {
            console.log("订单开始存储");
            /* 在显示订单界面前，我们先将订单储存到数据库中 */
            window.location.href="/order/saveOrder.action?getInfoName="+data.getInfoName+"&realName="
                +data.realName+"&getTime="+data.getTime+"&goodList="+data.goodList+"&buyNumList="+data.buyNumList;
        }
    });
}

