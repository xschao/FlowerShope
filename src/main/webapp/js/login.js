/*$(function () {
    $("#login").click(function () {
        var userName = $("input[name='userName']").val();
        var passWord = $("input[name='passWord']").val();
        var role = $("input[name='role']:checked").val();
        var params= {userName:userName,passWord:passWord,role:role};
        $.ajax({
            type:"POST",
            url: "login.action",
            data:params,
            dataType: "json",
            success: function (result) {
                      alert("123");
                }
        });
    });
});*/

/* 用户登录 */
function login() {
    var userName = $("input[name='userName']").val();
    var passWord = $("input[name='passWord']").val();
    var role = $("input[name='role']:checked").val();
    var params= {userName:userName,passWord:passWord,role:role};
    $.ajax({
        type:"POST",
        url:"/user/login.action",
        data:params,
        dataType: "json",
        success:function(data) {
           if(data.ok=="true"){
                window.location.href = "/user/loginPage.action?userName="+userName;
           }if(data.ok=="false"){
                var check = $("#checkLogin");
                check.css({"color":"red","font-size":"14px","margin-left":"20px"});
                check.text(data.msg);
                check.css('display','block');
                /*提示两秒后消失*/
                setTimeout(function (){
                    check.css('display', 'none');}, 4000);
           }if(data.ok=="admin"){
                window.location.href = "/admin/users/usersList.action?userName="+userName;
            }
        }
    });
}
