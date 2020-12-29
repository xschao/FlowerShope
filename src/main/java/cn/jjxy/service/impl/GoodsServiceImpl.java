package cn.jjxy.service.impl;

import cn.jjxy.mapper.GoodsMapper;
import cn.jjxy.pojo.Goods;
import cn.jjxy.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;
    @Override
    public List<Goods> list_goods() {
        return goodsMapper.list_goods();
    }

    @Override
    public Goods getGoodsDetailById(Integer id) {
        return goodsMapper.getGoodsDetailById(id);
    }

    @Override
    public List<Integer> getGoodsIdById() {
        return goodsMapper.getGoodsIdById();
    }

    @Override
    public List<Goods> getGoodsByOrderDetailId(Integer id) {
        return goodsMapper.getGoodsByOrderDetailId(id);
    }
}
