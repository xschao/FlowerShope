package cn.jjxy.pojo;

public class OrderDetailAdd {
    private Integer goodsId; //商品id，关联商品详情表
    private Integer orderId; //订单编号id,关联订单表
    private Integer orderDetailNum;//购买数量

    public OrderDetailAdd() {
    }

    public OrderDetailAdd(Integer goodsId, Integer orderId, Integer orderDetailNum) {
        this.goodsId = goodsId;
        this.orderId = orderId;
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

    public Integer getOrderDetailNum() {
        return orderDetailNum;
    }

    public void setOrderDetailNum(Integer orderDetailNum) {
        this.orderDetailNum = orderDetailNum;
    }

    @Override
    public String toString() {
        return "OrderDetailAdd{" +
                "goodsId=" + goodsId +
                ", orderId=" + orderId +
                ", orderDetailNum=" + orderDetailNum +
                '}';
    }
}
