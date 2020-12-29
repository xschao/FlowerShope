var prices = getClasses("price"),
    cart = document.getElementById("cart");
    acc = getClasses("acc"),
    totals = getClasses("total"),
    detracts = getClasses("desymbol"),
    adds = getClasses("adsymbol"),
    NumofGoods = document.getElementById("NumofGoods"),
    addupto = document.getElementById("addupto"),
    allSelect = getClasses("allSelect"),
    select = getClasses("select"),
    dele = getClasses("dele"),
    payBtn = document.getElementById("payBtn"),
    goodsIds = document.getElementsByClassName("goodsId");

count();
countAll();

for(var i=0; i<allSelect.length; i++ ){
    allSelect[i].onclick = function(){
        for(var j=0; j<select.length; j++){
            select[j].checked = this.checked;
        }
        for(j=0; j<allSelect.length; j++){
            allSelect[j].checked = this.checked;
        }
        //每次点击选框就计算一次总价
        countAll();
    }
}

for(i=0; i<select.length; i++){
    select[i].onclick = function(){
        if(ifAllSelected()){
            for(j=0; j<allSelect.length; j++){
                allSelect[j].checked = true;
            }
        }
        if(ifNotAllSelected()){
            for(j=0; j<allSelect.length; j++){
                allSelect[j].checked = false;
            }
        }
        countAll();
    }
}

for(i=0; i<adds.length; i++){

    adds[i].onclick = function(){
        console.log(this.parentNode.childNodes[3].innerHTML);
        var num = parseInt(this.parentNode.childNodes[3].innerHTML);
        num += 1;
        this.parentNode.childNodes[3].innerHTML = num;
        count();
        countAll();
    };
    detracts[i].onclick = function(){
        var num = parseInt(this.parentNode.childNodes[3].innerHTML);
        num -= 1;
        if(num<1){
            num=1;
        }
        this.parentNode.childNodes[3].innerHTML = num;
        count();
        countAll();
    };
    //删除时也应该重新计算总价，或者先判断商品是否被选中，有选中则重新计算
    dele[i].onclick = function(){

        cart.childNodes[1].removeChild(this.parentNode);
        countAll();
    }
}

//避免兼容性问题，自行封装classname
function getClasses(className){
    var arr = [],
        nodes = document.getElementsByTagName("*");
    for(var i=0; i<nodes.length; i++){
        if(nodes[i].className == className){
            arr.push(nodes[i]);
        }
    }
    return arr;
}

//进行单价的计算，保留两位小数
function count(){
    for(var i=0; i<prices.length; i++){
        totals[i].innerHTML = (prices[i].innerHTML*acc[i].innerHTML).toFixed(2);
    }
}
//计算总价的函数
function countAll(){
    var num1=0;
    var num2=0;
    //注意，每次计算总价应该重新取得一次select,acc和totals，因为执行删除操作时，会让这几个值发生变化
    var select = getClasses("select"),
        acc = getClasses("acc"),
        totals = getClasses("total");
    for(var i=0; i<select.length; i++){
        if(select[i].checked == true){
            num1 += parseInt(acc[i].innerHTML);
            num2 += parseFloat(totals[i].innerHTML);
        }
    }
    NumofGoods.innerHTML = num1;
    addupto.innerHTML = num2;
}

//判断是否全部选中或者全部没有选中的函数
function ifAllSelected(){
    var allSelected = true;

    for(var i=0; i<select.length; i++){
        if(select[i].checked == false){
            allSelected = false;
        }
    }
    return allSelected;
}
function ifNotAllSelected(){
    var notAllSelected = false;
    for(var i=0; i<select.length; i++){
        if(select[i].checked == false){
            notAllSelected = true;
        }
    }
    return notAllSelected;
}
/* 判断是否选择了一个商品 */
function isSelectOneGood(){
    var isSelect = false;
    for(var i=0; i<select.length; i++){
        if(select[i].checked == true){
            isSelect = true;
        }
    }
    return isSelect;
}
payBtn.onclick = function () {
    if(isSelectOneGood()==false){
        alert("请选择你要结算的商品！");
    }else {
        var size = select.length;
        var ids = new Array(size);
        var goodsNum = new Array(size);
        for(var i=0;i<select.length;i++){
            if(select[i].checked){
                ids[i] = goodsIds.item(i).innerHTML;
                goodsNum[i] = acc[i].innerHTML;
            }
        }
        window.location.href = "/order/orderDetail.action?ids="+ids+"&goodsNum="+goodsNum;
    }

};