package cn.jjxy.service;

import cn.jjxy.pojo.OrderDetail;
import cn.jjxy.pojo.OrderDetailAdd;

import java.util.List;

public interface OrderDetailService {
    OrderDetail list_orderDetail(Integer id);

    /* 根据订单详情级联商品的操作 */
    /* 一个订单详情对应多个商品 */
    OrderDetail getGoodsByOrderDetailId(Integer id);

    /* 插入一条订单明细  ：由于订单细明对应多个商品和购买数量，因此一次性插入多条数据 */
    Boolean insertOneOrderDetail(OrderDetailAdd orderDetailAdd);

    /* 删除一条订单级联删除一条订单细明 */
    Boolean deleteOneOrderDetail(Integer oNum);

    /* 根据订单编号插叙多条订单细明 */
    List<OrderDetail> getOrderDetailByOrderId(Integer orderId);
}
