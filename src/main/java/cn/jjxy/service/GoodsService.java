package cn.jjxy.service;

import cn.jjxy.pojo.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> list_goods();
    Goods getGoodsDetailById(Integer id);
    /*  查询所有商品的id。用于标识商品 */
    List<Integer> getGoodsIdById();

    /* 根据订单详情级联商品的操作 */
    /* 一个订单详情对应多个商品 */
    List<Goods> getGoodsByOrderDetailId(Integer id);
}
