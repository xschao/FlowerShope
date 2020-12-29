package cn.jjxy.mapper;

import cn.jjxy.pojo.Order;
import cn.jjxy.pojo.OrderDetail;

import java.util.List;

public interface OrderMapper {
    List<Order> list_order(Integer id);

    //根据订单关联查询订单详情
     List<Order> getOrderDetailByOrderId(Integer id);/* 订单详情里面包括多个商品，所以返回值为集合 */

    //根据订单关联查询收货地址
    Order getGetInfoByOrderId(Integer id);

    //插入一条订单信息
    Boolean insertOneOrder(Order order);

    //删除一条订单信息
    Boolean deleteOneOrder(Integer oNum);

}
