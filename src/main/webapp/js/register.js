/*用户注册*/
function register() {
    var name = $("input[name='name']").val();
    var psd = $("input[name='psd']").val();
    var sex = $("input[name='sex']").val();
    var tel = $("input[name='tel']").val();
    var birthday = $("input[name='birthday']").val();
    var params = {name: name, psd: psd, sex: sex, tel: tel, birthday: birthday};
    $.ajax({
        type: "POST",
        url: "/user/register.action",
        data: params,
        dataType: "json",
        success: function (data) {
            if (data.ok == "true") {
                window.location.href = "/user/registerPage.action";//注册成功返回登录界面
            }
            if (data.ok == "false") {
                var check = $("#checkRegister");
                check.css({"color":"red","font-size":"14px"});
                check.text(data.msg);
                check.css('display','block');
                /*提示4秒后消失*/
                setTimeout(function (){
                    check.css('display', 'none');}, 4000);
            }
        }
    });
}

/*后台验证注册验证，验证用户名*/
function checkName() {
    var name = $("#name").val();
    console.log("name：" + name);
    $.ajax({
        type: "POST",
        url: "/user/registerCheckName.action",
        data: {userName: name},
        dataType: "json",
        success: function (data) {
            if (data.ok == "false") {
                var check = $("#checkName");
                check.css({"color":"red","font-size":"14px"});
                check.text(data.msg);
                check.css('display','block');
                /*提示两秒后消失*/
                setTimeout(function (){
                    check.css('display', 'none');},4000);
            }
        }
    });
}

/*后台验证注册验证，验证电话号码*/
function checkTel() {
    var name = $("#tel").val();
    console.log("name：" + name);
    $.ajax({
        type: "POST",
        url: "/user/registerCheckTel.action",
        data: {userTel: name},
        dataType: "json",
        success: function (data) {
            if (data.ok == "false") {
                var check = $("#checkTel");
                check.css({"color":"red","font-size":"14px"});
                check.text(data.msg);
                check.css('display','block');
                /*提示两秒后消失*/
                setTimeout(function (){
                    check.css('display', 'none');}, 3000);
            }
        }
    });
}
