package cn.jjxy.controller;

import cn.jjxy.mapper.GoodsMapper;
import cn.jjxy.pojo.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("goods")
@Controller
public class GoodsController {
    @Autowired
    private GoodsMapper goodsMapper;
    /* 显示主页的内容 */
    @RequestMapping(value = "goodsList")
    public String loginPage(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("userName") String userName) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        System.out.println("重定向到商品展示");
        List<Goods> goodsList = goodsMapper.list_goods();
        model.addAttribute("goodsList",goodsList);
        System.out.println(goodsList.get(0).getGoodsImg());
        return "home";
    }
    @RequestMapping("goodsDetail")
    public String goodsDetail(Model model, HttpServletRequest request, HttpServletResponse response,@RequestParam("goodsId")Integer id){
        System.out.println("运行到此。");
        Goods goodsDetail = goodsMapper.getGoodsDetailById(id);
        model.addAttribute("goodsDetail",goodsDetail);
        return "goodsDetail";
    }
    @RequestMapping("goodsCart")
    public String goodsCart(Model model, HttpServletRequest request, HttpServletResponse response,@RequestParam("goodsId")Integer id){
        if(id==0){//id为0作为购物车界面的显示，不等于零时把它放入购物车
            System.out.println("重定向到购物车界面");
            return "goodsCart";
        }else{
            /* 1、获取要添加到购物车的商品 根据id获取 */
            Goods goods = goodsMapper.getGoodsDetailById(id);
            /* 把商品名称保存至Map集合中*/
            Map<Goods,Integer> goodsListMap =  (Map<Goods,Integer>)request.getSession().getAttribute("cart");
            /* 2、session里面没有存放过任何东西,把它存下来。*/
            if(goodsListMap==null){
                goodsListMap = new LinkedHashMap<Goods,Integer>();
                request.getSession().setAttribute("cart",goodsListMap);
            }
            //3. 判断购物车里面有没有该商品
            if(goodsListMap.containsKey(goods)){
                //在原来的值基础上  + 1
                goodsListMap.put(goods, goodsListMap.get(goods) + 1);//要是当Map集合利用put方法添加相同的键时，从前的键对应的值将会被覆盖
            }else{
                //没有购买过该商品，当前数量为1 。
                goodsListMap.put(goods, 1);
            }
            String sId  = request.getSession().getId();
            Cookie cookie = new Cookie("JSESSIONID", sId);
            cookie.setMaxAge(60*60*24*7);
            response.addCookie(cookie);
            return "goodsCart";
        }
    }
    /* 显示购物车 */
    @RequestMapping("listGoodsCart")
    public String list(){
        return "forward:goodsCart.action?goodsId=0";
    }
    /* 删除购物中的一条数据 */
    @RequestMapping("delOneGoodsCartDate")
    public String delOneDate(Model model, HttpServletRequest request, HttpServletResponse response,@RequestParam("goodsId")Integer id){
        System.out.println("商品id:"+id);
        HttpSession session = request.getSession();
        //调用session.invalidate() 清空购物车
        Map<Goods,Integer> cart = (Map<Goods,Integer>)session.getAttribute("cart");
        Iterator<Map.Entry<Goods,Integer>> it = cart.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry<Goods, Integer> entry= it.next();
            Goods key= entry.getKey();
            if(key.getGoodsId().equals(id)){
                System.out.printf("delete key:%s value:%s\r\n", key, entry.getValue());
                it.remove();
            }
        }

        return "forward:listGoodsCart.action";
    }
    @RequestMapping("delAllGoodsCartDate")
    public String delAllDate(Model model, HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        session.removeAttribute("cart");
        System.out.println("清空购物车完成！");
        return "forward:listGoodsCart.action";
    }
}
