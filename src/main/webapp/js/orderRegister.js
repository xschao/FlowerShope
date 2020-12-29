/* 新增收货人 */
function getInfoRegister() {
    var userName = $("#username").text();
    var getInfoName = $("input[name='ToName']").val();
    var getInfoTel = $("input[name='ToMobile']").val();
    var getInfoAddress = $("input[name='ToAddress']").val();
    var getInfoPost = $("input[name='ToPost']").val();
    var params= {userName:userName,getInfoName:getInfoName,getInfoTel:getInfoTel,getInfoAddress:getInfoAddress,getInfoPost:getInfoPost};
    $.ajax({
        type:"POST",
        url:"/order/addOneGetInfo.action",
        data:params,
        dataType: "json",
        success:function(data) {
            if(data.ok=="true"){
                console.log(data.msg);
                $("#orderRegisterSuccess").text(data.msg);
            }
            if(data.ok=="false"){
                console.log(data.msg)
            }
        }
    });
}