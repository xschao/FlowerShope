package cn.jjxy.service;

import cn.jjxy.mapper.GoodsMapper;
import cn.jjxy.pojo.Goods;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*.xml")

public class GoodsTest {
    @Autowired
    private GoodsService goodsMapper;
    @Test
    public void listGoods(){
       List<Goods> list =  goodsMapper.list_goods();
       for(Goods goods : list){
           System.out.println(goods);
       }
    }
}
