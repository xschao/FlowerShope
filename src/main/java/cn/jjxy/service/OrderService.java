package cn.jjxy.service;

import cn.jjxy.pojo.Order;
import cn.jjxy.pojo.OrderDetail;

import java.util.List;

public interface OrderService {
    List<Order> list_order(Integer id);

    //根据订单关联查询订单详情
    List<Order> getOrderDetailByOrderId(Integer id);/* 之前没搞清楚需求，这个方法是错误的，就返回值错了*/

    //根据订单关联查询收货地址
    Order getGetInfoByOrderId(Integer id);

    //插入一条订单信息
    Boolean insertOneOrder(Order order);

    //删除一条订单信息
    Boolean deleteOneOrder(Integer oNum);
}
