package cn.jjxy.service.impl;

import cn.jjxy.mapper.OrderMapper;
import cn.jjxy.pojo.Order;
import cn.jjxy.pojo.OrderDetail;
import cn.jjxy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public List<Order> list_order(Integer id) {
        return orderMapper.list_order(id);
    }

    @Override
    public List<Order> getOrderDetailByOrderId(Integer id) {
        return orderMapper.getOrderDetailByOrderId(id);
    }

    @Override
    public Order getGetInfoByOrderId(Integer id) {
        return orderMapper.getGetInfoByOrderId(id);
    }

    @Override
    public Boolean insertOneOrder(Order order) {
        return orderMapper.insertOneOrder(order);
    }

    @Override
    public Boolean deleteOneOrder(Integer oNum) {
        return orderMapper.deleteOneOrder(oNum);
    }

}
