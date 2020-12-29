package cn.jjxy.pojo;


import java.util.Date;

/*
    * create table f_order(
    o_id int(8) primary key AUTO_INCREMENT,
    o_userId int(8) not null,
    o_gi_id int(8) not null,
    o_buyTime date,
    o_sendTime date,
    o_getTime date,
    foreign key(o_userId) references f_users(u_id),
    foreign key(o_gi_id) references f_getinfo(gi_id)
);
//用户表的用户编号和收货地址表的收货编号作为订单表的外键
* */
//备用yyyy-MM-dd HH:mm:ss
public class Order {
    private Integer orderId; //订单编号
    private Integer userId;  //用户Id,外键关联用户
    private Integer getInfoId; //；收货地址id，关联收货详情表
    private Date buyTime;  //购买时间
    private Date sendTime; //派送时间
    private Date getTime;  //收货日期

    /*用户和订单一对多的关系，且有订单一定有订单对应的用户*/
    /*在多的一方设置一的对象*/
    private Users users;
    /*订单和收货地址是一对一的，一个订单对应一个收货地址，*/
    /*在一的一方*/
    private GetInfo getInfo;
    /*订单和订单详情是一一对应的关系*/
    /*在一的一方设置另一方一的对象*/
    private OrderDetail orderDetail;

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Order() {
    }

    public Order(Integer orderId, Integer userId, Integer getInfoId, Date buyTime, Date sendTime, Date getTime, Users users, GetInfo getInfo, OrderDetail orderDetail) {
        this.orderId = orderId;
        this.userId = userId;
        this.getInfoId = getInfoId;
        this.buyTime = buyTime;
        this.sendTime = sendTime;
        this.getTime = getTime;
        this.users = users;
        this.getInfo = getInfo;
        this.orderDetail = orderDetail;
    }

    public Order(Integer orderId, Integer userId, Integer getInfoId, Date buyTime, Date sendTime, Date getTime, Users users, GetInfo getInfo) {
        this.orderId = orderId;
        this.userId = userId;
        this.getInfoId = getInfoId;
        this.buyTime = buyTime;
        this.sendTime = sendTime;
        this.getTime = getTime;
        this.users = users;
        this.getInfo = getInfo;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGetInfoId() {
        return getInfoId;
    }

    public void setGetInfoId(Integer getInfoId) {
        this.getInfoId = getInfoId;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Date getGetTime() {
        return getTime;
    }

    public void setGetTime(Date getTime) {
        this.getTime = getTime;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public GetInfo getGetInfo() {
        return getInfo;
    }

    public void setGetInfo(GetInfo getInfo) {
        this.getInfo = getInfo;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", getInfoId=" + getInfoId +
                ", buyTime=" + buyTime +
                ", sendTime=" + sendTime +
                ", getTime=" + getTime +
                '}';
    }
}
