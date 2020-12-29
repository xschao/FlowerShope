package cn.jjxy.service.impl;

import cn.jjxy.mapper.OrderDetailMapper;
import cn.jjxy.pojo.OrderDetail;
import cn.jjxy.pojo.OrderDetailAdd;
import cn.jjxy.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Override
    public OrderDetail list_orderDetail(Integer id) {
        return orderDetailMapper.list_orderDetail(id);
    }

    @Override
    public OrderDetail getGoodsByOrderDetailId(Integer id) {
        return orderDetailMapper.getGoodsByOrderDetailId(id);
    }

    @Override
    public Boolean insertOneOrderDetail(OrderDetailAdd orderDetailAdd) {
        return orderDetailMapper.insertOneOrderDetail(orderDetailAdd);
    }

    @Override
    public Boolean deleteOneOrderDetail(Integer oNum) {
        return orderDetailMapper.deleteOneOrderDetail(oNum);
    }

    @Override
    public List<OrderDetail> getOrderDetailByOrderId(Integer orderId) {
        return orderDetailMapper.getOrderDetailByOrderId(orderId);
    }


}
