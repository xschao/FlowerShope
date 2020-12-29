package cn.jjxy.mapper;

import cn.jjxy.pojo.Goods;

import java.util.List;

public interface GoodsMapper {
    /*查询订单下的所有商品信息  用户主页的显示  */
    List<Goods> list_goods();//ListAllGoods

    /* 根据商品编号查询商品详情，用于购买界面 */
    Goods getGoodsDetailById(Integer id);

    /*  查询所有商品的id。用于标识商品 */
    List<Integer> getGoodsIdById();

    /* 根据订单详情级联商品的操作 */
    /* 一个订单详情对应多个商品 */
    List<Goods> getGoodsByOrderDetailId(Integer id);
}
