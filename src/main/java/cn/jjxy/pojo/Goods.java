package cn.jjxy.pojo;
/**
 * @author  kevin
 * @desc   商品详情表
 *         作用：当前主要用于前台页面的展示，做遍历操作
 *
 **/
/*
* CREATE TABLE `f_goods` (
  `g_id` int(8) NOT NULL AUTO_INCREMENT,
  `g_img` varchar(20) DEFAULT NULL,
  `g_name` varchar(25) DEFAULT NULL,
  `g_desc` varchar(50) DEFAULT NULL,
  `g_price` float DEFAULT NULL,
  `g_sell` int(6) DEFAULT NULL,
  `g_surplus` int(6) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

* */
public class Goods {
    private Integer goodsId;
    private String goodsImg;
    private String goodsName;
    private String goodsDesc;
    private Float goodsPrice;
    private Integer goodsSell;//商品销量
    private Integer goodsSurplus;//商品库存

    /* 订单详情和商品表是一对多的关系 */
    /*在对的一方设置一一方的对象*/
    private OrderDetail orderDetail;

    public Goods(Integer goodsId, String goodsImg, String goodsName, String goodsDesc, Float goodsPrice, Integer goodsSell, Integer goodsSurplus, OrderDetail orderDetail) {
        this.goodsId = goodsId;
        this.goodsImg = goodsImg;
        this.goodsName = goodsName;
        this.goodsDesc = goodsDesc;
        this.goodsPrice = goodsPrice;
        this.goodsSell = goodsSell;
        this.goodsSurplus = goodsSurplus;
        this.orderDetail = orderDetail;
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Goods() {
    }

    public Goods(Integer goodsId, String goodsImg, String goodsName, String goodsDesc, Float goodsPrice, Integer goodsSell, Integer goodsSurplus) {
        this.goodsId = goodsId;
        this.goodsImg = goodsImg;
        this.goodsName = goodsName;
        this.goodsDesc = goodsDesc;
        this.goodsPrice = goodsPrice;
        this.goodsSell = goodsSell;
        this.goodsSurplus = goodsSurplus;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public void setGoodsPrice(Float goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public void setGoodsSell(Integer goodsSell) {
        this.goodsSell = goodsSell;
    }

    public void setGoodsSurplus(Integer goodsSurplus) {
        this.goodsSurplus = goodsSurplus;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public Float getGoodsPrice() {
        return goodsPrice;
    }

    public Integer getGoodsSell() {
        return goodsSell;
    }

    public Integer getGoodsSurplus() {
        return goodsSurplus;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId=" + goodsId +
                ", goodsImg='" + goodsImg + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsDesc='" + goodsDesc + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", goodsSell=" + goodsSell +
                ", goodsSurplus=" + goodsSurplus +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Goods)) return false;

        Goods goods = (Goods) o;

        if (goodsId != null ? !goodsId.equals(goods.goodsId) : goods.goodsId != null) return false;
        if (goodsImg != null ? !goodsImg.equals(goods.goodsImg) : goods.goodsImg != null) return false;
        if (goodsName != null ? !goodsName.equals(goods.goodsName) : goods.goodsName != null) return false;
        if (goodsDesc != null ? !goodsDesc.equals(goods.goodsDesc) : goods.goodsDesc != null) return false;
        if (goodsPrice != null ? !goodsPrice.equals(goods.goodsPrice) : goods.goodsPrice != null) return false;
        if (goodsSell != null ? !goodsSell.equals(goods.goodsSell) : goods.goodsSell != null) return false;
        return goodsSurplus != null ? goodsSurplus.equals(goods.goodsSurplus) : goods.goodsSurplus == null;
    }

    @Override
    public int hashCode() {
        int result = goodsId != null ? goodsId.hashCode() : 0;
        result = 31 * result + (goodsImg != null ? goodsImg.hashCode() : 0);
        result = 31 * result + (goodsName != null ? goodsName.hashCode() : 0);
        result = 31 * result + (goodsDesc != null ? goodsDesc.hashCode() : 0);
        result = 31 * result + (goodsPrice != null ? goodsPrice.hashCode() : 0);
        result = 31 * result + (goodsSell != null ? goodsSell.hashCode() : 0);
        result = 31 * result + (goodsSurplus != null ? goodsSurplus.hashCode() : 0);
        return result;
    }
}
