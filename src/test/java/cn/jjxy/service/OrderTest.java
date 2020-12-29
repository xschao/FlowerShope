package cn.jjxy.service;


import cn.jjxy.mapper.GoodsMapper;
import cn.jjxy.mapper.OrderDetailMapper;
import cn.jjxy.mapper.OrderMapper;
import cn.jjxy.pojo.*;
import cn.jjxy.util.DateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*.xml")

public class OrderTest {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private GetInfoService getInfoService;
    @Test
    public void listGoods(){
      System.out.print(orderService.list_order(1));
    }
    /* 根据订单编号查询订单详情 */
    @Test
    public void ListOrderDetail(){
    ;
        System.out.println(    orderDetailMapper.list_orderDetail(1987191571));
    }
    /* 多表查询操作： 订单和收货人细明 关联查询 */
    /* 插入一条订单信息 */
    @Test
    public void saveOneOrder(){
        String getTime = "2020-12-21";
        Order order = new Order();
        order.setUserId(1);
        order.setGetInfoId(1);
        java.util.Date date = new java.util.Date();
        java.sql.Date converDate = DateUtil.Convertor(date);
        order.setBuyTime(converDate);
        order.setSendTime(converDate);
        order.setGetTime(java.sql.Date.valueOf(getTime));
        System.out.println(date);
        System.out.println("order:"+order);
        orderService.insertOneOrder(order);
    }
    /* 查看订单的历史记录 */
    @Test
    public void showHistoryOrder(){

        Integer userId = userService.getUserIdByUserName("小王123");
        System.out.println("用户id:"+userId);
        Users user = userService.getOrderByUserId(userId);
        List<Order> orderList = user.getOrderList();

        /* 保存订单信息的集合 */
        List<Order> ordersList = new LinkedList<>();
        /* 保存收货人信息集合 */
        List<GetInfo> getInfosList = new LinkedList<>();
        /*订单细明表存储集合，由于每次查询一条订单包含多个订单细明，*/
        List<List<OrderDetail>> orderDetails = new LinkedList<>();
        for(Order order:orderList){
          /* System.out.println("订单对象（绑定的对象）为："+order+'\n'
                   +"订单编号为："+order.getOrderId()+'\n'
                   +"购买时间"+order.getBuyTime()+'\n'
                   +"发货时间"+order.getSendTime()+'\n'
                   +"到货时间"+order.getGetTime()+'\n');*/
           ordersList.add(order);
          /* System.out.println("收货人对象（绑定的对象）为："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId())+'\n'
                                                +"收货人信息："+"收货人姓名："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoName()+"\n"
                                                +"收货人电话："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoTel()+"\n"
                                                +"收货人地址："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoAddress()+"\n"
                                                +"收货人邮编："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoPost()+'\n');*/
            getInfosList.add(getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()));
            /*System.out.println("订单细明对象(绑定的对象)为："+orderDetailMapper.getOrderDetailByOrderId(order.getOrderId())+'\n');*/

            List<OrderDetail> orderDetailList = orderDetailMapper.getOrderDetailByOrderId(order.getOrderId());
            orderDetails.add(orderDetailList);
            for (OrderDetail orderDetail:orderDetailList) {
               /* System.out.println("商品对象（绑定对象）：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()) + '\n' +
                        "购买的商品编号为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsId() + '\n' +
                        "购买的商品名称为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsName() + '\n' +
                        "商品的图片为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsImg() + '\n' +
                        "商品的价格为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsPrice() + '\n' +
                        "订单细明购买的数量为：" + orderDetail.getOrderDetailNum() + '\n' +
                        "商品总价为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsPrice() * orderDetail.getOrderDetailNum() + '\n' + '\n' + '\n'
                );*/
            }

        }

        /* 拼订一条条订单信息,用储存的集合 */
        for(Order order:orderList){
            int total=0;
            System.out.println("订单对象（绑定的对象）为："+order+'\n'
                    +"订单编号为："+order.getOrderId()+'\n'
                    +"购买时间"+order.getBuyTime()+'\n'
                    +"发货时间"+order.getSendTime()+'\n'
                    +"到货时间"+order.getGetTime()+'\n');
            System.out.println("收货人对象（绑定的对象）为："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId())+'\n'
                    +"收货人信息："+"收货人姓名："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoName()+"\n"
                    +"收货人电话："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoTel()+"\n"
                    +"收货人地址："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoAddress()+"\n"
                    +"收货人邮编："+getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()).getGetInfoPost()+'\n');
            for (List<OrderDetail> orderDetails1:orderDetails){//总的订单明细
                for (OrderDetail orderDetail : orderDetails1) {

                    if(orderDetail.getOrderId().equals(order.getOrderId())){
                        System.out.println(orderDetails1);
                        System.out.println("商品对象（绑定对象）：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()) + '\n' +
                                "购买的商品编号为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsId() + '\n' +
                                "购买的商品名称为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsName() + '\n' +
                                "商品的图片为： " + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsImg() + '\n' +
                                "商品的价格为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsPrice() + '\n' +
                                "订单细明购买的数量为：" + orderDetail.getOrderDetailNum() + '\n');
                        total+= goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsPrice()*orderDetail.getOrderDetailNum();
                    }

                }
            }
            System.out.println("商品总价为：" + total+ '\n' + '\n' + '\n');
        }
    }
}
