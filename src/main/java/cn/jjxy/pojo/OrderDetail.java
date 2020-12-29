package cn.jjxy.pojo;

import java.util.List;

/*
    * create table f_orderDetail(
    fod_id int(8) primary key auto_increment,
    fod_goodsId int(8) not null,
    fod_f_orderId int(8) not null,
    fod_num int(4),
    foreign key(fod_goodsId) references f_goods(g_id),
    foreign key(fod_f_orderId) references f_order(o_id)
);
//商品表的商品编号和订单表的订单编号作为订单明细表的外键

* */
public class OrderDetail {
    private Integer orderDetailId;  //订单详情id
    private Integer goodsId; //商品id，关联商品详情表
    private Integer orderId; //订单编号id,关联订单表
    private Integer orderDetailNum;//购买数量

    /*订单详情和商品表，一对多的关系。一个订单详情里面有多个商品*/
    /*在一的一方设置多的一方的集合*/
    private List<Goods> goodsList;

    /*订单详情表和订单是一一对应的。一个订单有一个订单详情*/
    /*在一的一方设置另一方的对象*/
    private Order order;

    public OrderDetail() {
    }

    public OrderDetail(Integer orderDetailId, Integer orderDetailNum, Integer goodsId, Integer orderId, List<Goods> goodsList, Order order) {
        this.orderDetailId = orderDetailId;
        this.orderDetailNum = orderDetailNum;
        this.goodsId = goodsId;
        this.orderId = orderId;
        this.goodsList = goodsList;
        this.order = order;
    }

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Integer getOrderDetailNum() {
        return orderDetailNum;
    }

    public void setOrderDetailNum(Integer orderDetailNum) {
        this.orderDetailNum = orderDetailNum;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    public Order getOrder() {
        return order;
    }


    public void setOrder(Order order) {
        this.order = order;
    }
    @Override
    public String toString() {
        return "OrderDetail{" +
                "orderDetailId=" + orderDetailId +
                ", goodsId=" + goodsId +
                ", orderId=" + orderId +
                ", orderDetailNum=" + orderDetailNum +
                '}';
    }

}
