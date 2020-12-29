package cn.jjxy.service;

import cn.jjxy.pojo.OrderDetail;
import cn.jjxy.pojo.OrderDetailAdd;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*.xml")

public class OrderDetailToGoods {
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private OrderService orderService;
    @Test
    /*查询所有的商品，用于主页展示*/
    public void listGoods(){
        System.out.println( orderDetailService.list_orderDetail(1));

    }


    /* 插入一条订单明细  ：由于订单细明对应多个商品和购买数量，因此一次性插入多条数据 */
    @Test
    public void insertOneOrderDetailTest(){
        OrderDetailAdd orderDetail = new OrderDetailAdd();
        orderDetail.setGoodsId(1);
        orderDetail.setOrderId(2053267141);
        orderDetail.setOrderDetailNum(1);
        orderDetailService.insertOneOrderDetail(orderDetail);
    }
}
