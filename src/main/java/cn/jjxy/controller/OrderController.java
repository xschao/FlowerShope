package cn.jjxy.controller;

import cn.jjxy.pojo.*;
import cn.jjxy.service.*;
import cn.jjxy.util.DateUtil;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private UserService userService;
    @Autowired
    private GetInfoService getInfoService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;
    /* 完成支付，订单交付完成。跳转到个人界面 */
    @RequestMapping("orderList")
    public String orderList(){
        return "userOrderPage";
    }

    /*订单界面购物清单信息核对*/
    @RequestMapping("orderDetail")
    public String orderDetail(Model model,@Param("ids")String ids, @Param("goodsNum") String goodsNum){
        /* 避免首字符是逗号产生的影响,因为从前台传过来的字符，如果商品不从第一个选择的时候，会以逗号开始 */
        //根据ids.提取逗号间的数字
        Pattern p = Pattern.compile("\\d*");
        Matcher m = p.matcher(ids);
        String res ="";
        while (m.find()) {
            if (!"".equals(m.group()))
                res += m.group()+",";
        }
        //根据goodsNum,提取逗号间的数字
        Pattern p1 = Pattern.compile("\\d*");
        Matcher m1 = p1.matcher(goodsNum);
        String res1 ="";
        while (m1.find()) {
            if (!"".equals(m1.group()))
                res1 += m1.group()+",";
        }
        String goodsIds[] = res.split(",");
        String buyNum[] = res1.split(",");
        Integer gIds[] = new Integer[goodsIds.length];
        Integer bNum[] = new Integer[goodsIds.length];
        for(int i=0;i<goodsIds.length;i++){
            gIds[i]=Integer.parseInt(goodsIds[i]);
        }
        for(int i=0;i<goodsIds.length;i++){
            bNum[i]=Integer.parseInt(buyNum[i]);
        }

        Map<Integer,Integer> goodsIdAndBuyNumMap = new LinkedHashMap<>();
        for(int i=0;i<goodsIds.length;i++){
            goodsIdAndBuyNumMap.put(gIds[i],bNum[i]);
        }
        /* 用于订单界面商品核对，再次在订单界面显示要要购买的商品 */
        List<Goods> goodsList = new LinkedList<>();//声明一个Goods类型的集合，保存选择的商品
        List<Integer> buyNumList = new LinkedList<>();//声明一个Integer类型的集合，存放购买商品的数量
        for(Map.Entry<Integer,Integer> en : goodsIdAndBuyNumMap.entrySet()){//获取键的集合
            Goods goods = goodsService.getGoodsDetailById(en.getKey());
            buyNumList.add(en.getValue());
            goodsList.add(goods);
            System.out.println("GoodsId="+en.getKey()+"BuyNum="+en.getValue());
        }
        System.out.println("购买的数量是"+buyNumList+"购买的商品有"+goodsList);

        /*计算商品总价*/
        Float goodsTotalPrice = 0f;
        for(Map.Entry<Integer,Integer> en : goodsIdAndBuyNumMap.entrySet()){
                 goodsTotalPrice =goodsTotalPrice+goodsService.getGoodsDetailById(en.getKey()).getGoodsPrice()*en.getValue();
        }
        /* 商品总价 */
        System.out.println("商品的总价位："+goodsTotalPrice);
        /* 商品总数 */
        int goodsTotal = 0;
        for(Integer num:buyNumList){
            goodsTotal = goodsTotal+num;
        }
        System.out.println("商品的总数："+goodsTotal);
        model.addAttribute("goodsTotalPrice",goodsTotalPrice);
        model.addAttribute("goodsTotal",goodsTotal);
        model.addAttribute("goodsList",goodsList);
        model.addAttribute("buyNumList",buyNumList);
        /* 把ids和goodsNum绑定过去，用于生成订单信息*/
        model.addAttribute("goodsIds",ids);
        model.addAttribute("goodsNum",goodsNum);
        return "orderDetail";
    }

    /* 订单界面收货人异步加载 */
    @RequestMapping("getInfoName")
    @ResponseBody
    public String getInfoName(@Param("userName")String userName){
        Integer id = userService.getUserIdByUserName(userName);
        Users user = userService.getGetInfoByUserId(id);//根据用户的id关联查询用户下的收货地址
        List<GetInfo> userGetInfoList = user.getListGetInfo();
        /*for(GetInfo getInfo:userGetInfoList){
            System.out.println("当前用户下的收货地址有："+getInfo);
        }*/
        /*遇到对象转json字符串时,如果对象中的属性字段为null，则不会显示出来。解决方法*/
        Gson gson = new Gson();
        String getInfoJson = gson.toJson(userGetInfoList);
        return getInfoJson;
    }

    @RequestMapping("addOneGetInfo")// 实际对收货人信息的添加，再根据是否添加成功来跳转到订单详情界面（利用的是ajax）
    public void returnOrderDetail(@Param("userName")String userName,@Param("getInfoName")String getInfoName, @Param("getInfoTel")String getInfoTel,@Param("getInfoAddress")String getInfoAddress, @Param("getInfoPost")String getInfoPost,HttpServletResponse response,HttpServletRequest request) throws IOException {
        System.out.println("=========="+userName+getInfoName+getInfoTel+getInfoAddress+getInfoPost);
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        /*根据用户名获取用户的ID，来存储。*/
        Integer userId = userService.getUserIdByUserName(userName);
        GetInfoAdd getInfoAdd = new GetInfoAdd();
        getInfoAdd.setUsersId(userId.toString());//插入用户id，这个作为收货人信息的外键
        getInfoAdd.setGetInfoName(getInfoName);
        getInfoAdd.setGetInfoTel(getInfoTel);
        getInfoAdd.setGetInfoAddress(getInfoAddress);
        getInfoAdd.setGetInfoPost(getInfoPost);
        Boolean flag = getInfoService.addOneGetInfoData(getInfoAdd);
        System.out.println("flag:"+flag);
        if(flag){
            out.print("{\"ok\":\"true\",\"msg\":\"新增收货人成功,请返回\"}");
            out.close();
            System.out.println("新增收货人成功，点击返回订单支付页面！");
        }else{
            out.print("{\"ok\":\"false\",\"msg\":\"新增收货人失败！\"}");
            out.close();
            System.out.println("请按要求填写电话号！");
        }


    }

    @RequestMapping("generateOrder")//支付完成后生成订单信息.如果成功跳转至showOrder  mapping
    public void generateOrder( HttpServletRequest request, HttpServletResponse response,@RequestBody String params) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        System.out.println("获取订单所有的信息！");
        System.out.println("订单信息已送达：");
        out.print(params);//把订单信息转化为json根式传递给前台
        out.close();
        System.out.println("params"+'\n'+params);
    }

    @RequestMapping("showOrder")//支付完成后生成订单信息，并把它返回给前台。与此同时，把订单信息存储到数据库中
    public String showOrder(Model model, HttpServletRequest request, HttpServletResponse response, @Param("getInfoName") Integer getInfoName, @Param("realName") String realName,@Param("getTime") String getTime, @Param("goodList")String goodList, @Param("buyNumList") String buyNumList,@Param("oNum")Integer oNum){
        System.out.println("定位到查看订单界面！");
          /*订单由订单商品详情表、用户、收货人地址、订单详情构成 */
        System.out.println("订单信息已送达：");
        System.out.println("收货人编号:"+getInfoName+'\n'+"用户姓名："+realName+'\n'+"到达时间："+getTime+'\n'+"订单的商品编号："+goodList+'\n'+"购买数量："+buyNumList);
        /* 根据收货人Id获取收货人信息 ：getInfoName*/
        GetInfo getInfo = getInfoService.findGetInfoByGetInfoId(getInfoName);
        System.out.println("收货人信息是："+getInfo);
        /* 根据用户名称查询用户信息 */
        Users user = userService.getUserByName(realName);
        System.out.println("用户信息是："+user);
        /* 获取预计送达日期 */
        String getGoodsTime = getTime;
        /* 根据获取的订单数组和订单数量来等到商品总价和商品总数，可以按购物车的形式解析 */
        //根据ids.提取逗号间的数字
        Pattern p = Pattern.compile("\\d*");
        Matcher m = p.matcher(goodList);
        String res ="";
        while (m.find()) {
            if (!"".equals(m.group()))
                res += m.group()+",";
        }
        //根据goodsNum,提取逗号间的数字
        Pattern p1 = Pattern.compile("\\d*");
        Matcher m1 = p1.matcher(buyNumList);
        String res1 ="";
        while (m1.find()) {
            if (!"".equals(m1.group()))
                res1 += m1.group()+",";
        }
        String goodsIds[] = res.split(",");
        String buyNum[] = res1.split(",");
        Integer gIds[] = new Integer[goodsIds.length];
        Integer bNum[] = new Integer[goodsIds.length];
        for(int i=0;i<goodsIds.length;i++){
            gIds[i]=Integer.parseInt(goodsIds[i]);
        }
        for(int i=0;i<goodsIds.length;i++){
            bNum[i]=Integer.parseInt(buyNum[i]);
        }
        Map<Integer,Integer> goodsIdAndBuyNumMap = new LinkedHashMap<>();
        for(int i=0;i<goodsIds.length;i++){
            goodsIdAndBuyNumMap.put(gIds[i],bNum[i]);
        }
        /* 用于订单界面商品核对，再次在订单界面显示要要购买的商品 */
        List<Goods> goodsList = new LinkedList<>();//声明一个Goods类型的集合，保存选择的商品
        List<Integer> buyNumsList = new LinkedList<>();//声明一个Integer类型的集合，存放购买商品的数量
        for(Map.Entry<Integer,Integer> en : goodsIdAndBuyNumMap.entrySet()){//获取键的集合
            Goods goods = goodsService.getGoodsDetailById(en.getKey());
            buyNumsList.add(en.getValue());
            goodsList.add(goods);
            System.out.println("GoodsIds="+en.getKey()+"BuyNum="+en.getValue());
        }
        System.out.println("购买的数量是"+buyNumsList+"购买的商品有"+goodsList);

        /*计算商品总价*/
        Float goodsTotalPrice = 0f;
        for(Map.Entry<Integer,Integer> en : goodsIdAndBuyNumMap.entrySet()){
            goodsTotalPrice =goodsTotalPrice+goodsService.getGoodsDetailById(en.getKey()).getGoodsPrice()*en.getValue();
        }
        /* 商品总价 */
        System.out.println("商品的总价位："+goodsTotalPrice);
        /* 商品总数 */
        int goodsTotal = 0;
        for(Integer num:buyNumsList){
            goodsTotal = goodsTotal+num;
        }
        System.out.println("商品的总数："+goodsTotal);
        /*订单由订单商品详情表、用户、收货人地址、订单详情构成 */
        model.addAttribute("goodsTotalPrice",goodsTotalPrice);//传递商品的总价
        model.addAttribute("goodsTotal",goodsTotal);//商品的总数
        model.addAttribute("goodsList",goodsList);//商品的ids数组
        model.addAttribute("buyNumsList",buyNumsList);//商品的数量数组
        model.addAttribute("getTime",getTime);//预计到达日期
        model.addAttribute("getInfo",getInfo);//收货人信息
        model.addAttribute("user",user);//用户信息
        model.addAttribute("oNum",oNum);
        return "userOrderPage";
    }

    @RequestMapping("saveOrder")//将用户下的订单储存到数据库，方便管理
    public String saveOneOrder(Model model, HttpServletRequest request, HttpServletResponse response, @Param("getInfoName") Integer getInfoName, @Param("realName") String realName,@Param("getTime") String getTime, @Param("goodList")String goodList, @Param("buyNumList") String buyNumList){
        System.out.println("订单开始存储到数据库中");
        System.out.println("收货人编号:"+getInfoName+'\n'+"用户姓名："+realName+'\n'+"到达时间："+getTime+'\n'+"订单的商品编号："+goodList+'\n'+"购买数量："+buyNumList);
        /**
         * @author  kevin
         * @desc先存储订单信息信息：  订单的编号
                                        用户编号
                                        收货信息编号
                                        购买时间
                                        发货时间
                                        收货时间
         **/
        String userName = (String)request.getSession().getAttribute("userName");
        Integer userId = userService.getUserIdByUserName(userName);
        System.out.println("当前用户的编号为："+userId);
        Order order = new Order();
        //选择当前系统时间为订单号
        int orderNumber = Math.abs((int)new Date().getTime());
        System.out.println("生成订单的编号为："+orderNumber);
        order.setOrderId(orderNumber);
        order.setUserId(userId);
        order.setGetInfoId(getInfoName);//我们获取的是收货人的id
        /* 获取时间，解析时间 */
        java.util.Date date = new java.util.Date();
        java.sql.Date converDate = DateUtil.orderDateConvertor(date);
        order.setBuyTime(converDate);
        order.setSendTime(converDate);
        order.setGetTime(java.sql.Date.valueOf(getTime));
        System.out.println(date);
        System.out.println("order:"+order);
        Boolean flag = orderService.insertOneOrder(order);
        if(flag){
            System.out.println("订单插入成功！");
        } else {
            System.out.println("插入订单成功");
        }
        /**
         * @author  kevin
         * @desc在订单细明存储：存储订单的时候再把订单细明存储到数据库中，然而在这里要分批操作，因为订单细明关联商品（集合）和商品数量（数组）
         **/
         //获取商品的id的集合
        System.out.println("商品编号的集合goodList："+goodList+"购买商品的数组buyNumList："+buyNumList);
        //获取订单编号,用当前系统时间作为订单编号
        //根据ids.提取逗号间的数字
        Pattern p = Pattern.compile("\\d*");
        Matcher m = p.matcher(goodList);
        String res ="";
        while (m.find()) {
            if (!"".equals(m.group()))
                res += m.group()+",";
        }
        //根据goodsNum,提取逗号间的数字
        Pattern p1 = Pattern.compile("\\d*");
        Matcher m1 = p1.matcher(buyNumList);
        String res1 ="";
        while (m1.find()) {
            if (!"".equals(m1.group()))
                res1 += m1.group()+",";
        }
        String goodsIds[] = res.split(",");
        String buyNum[] = res1.split(",");
        Integer gIds[] = new Integer[goodsIds.length];
        Integer bNum[] = new Integer[goodsIds.length];
        for(int i=0;i<goodsIds.length;i++){
            gIds[i]=Integer.parseInt(goodsIds[i]);
        }
        for(int i=0;i<goodsIds.length;i++){
            bNum[i]=Integer.parseInt(buyNum[i]);
        }
        /*  */
        for (int i=0;i<goodsIds.length;i++){
            OrderDetailAdd orderDetail = new OrderDetailAdd();
            orderDetail.setOrderId(orderNumber);
            orderDetail.setGoodsId(gIds[i]);
            orderDetail.setOrderDetailNum(bNum[i]);
            orderDetailService.insertOneOrderDetail(orderDetail);
        }
        return "forward:showOrder.action?getInfoName="+getInfoName+
                "&realName="+realName+"&getTime="+getTime+"&goodList="+goodList+"&buyNumList="+buyNumList+"&oNum="+orderNumber;
    }

    /* 删除订单 */
    @RequestMapping("deleteOneDetail")
    public String deleteOneDetail(Model model,@Param("oNum") Integer oNum){
        /**
         * @author  kevin
         * @desc删除订单的同时还需要删除订单所对应的订单明细，先删除订单明细在删除订单。
         **/
        /* 1、先删除订单明细 */
        orderDetailService.deleteOneOrderDetail(oNum);
        /* 2、删除订单号 */
        orderService.deleteOneOrder(oNum);
        return "userOrderPage";
    }

    /* 查看历史订单 */
    @RequestMapping("showOrderHistory")
    public String showHistoryOrder(Model model,@Param("userName")String userName){
        /*1、先根据用户ID查询用户订单信息订单*/
        Integer userId = userService.getUserIdByUserName(userName);
        System.out.println("用户名为："+userName+"用户id:"+userId);
        Users user = userService.getOrderByUserId(userId);
        List<Order> orderList = user.getOrderList();
        /* 保存订单信息的集合 */
        List<Order> ordersList = new LinkedList<>();
        /* 保存收货人信息集合 */
        List<GetInfo> getInfosList = new LinkedList<>();
        /*订单细明表存储集合*/
        List<List<OrderDetail>> orderDetails = new LinkedList<>();
        for(Order order:orderList){
            ordersList.add(order);//将订单传入订单集合中
            getInfosList.add(getInfoService.findGetInfoByGetInfoId(order.getGetInfoId()));//将收货人传入收货人集合中
            List<OrderDetail> orderDetailList = orderDetailService.getOrderDetailByOrderId(order.getOrderId());//根据订单获取订单细明
            orderDetails.add(orderDetailList);//将订单细明传入订单细明集合中
        }
        /* 拼出用户所有的订单信息,用储存的集合 */
       /* for(Order order:orderList){
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
                    if(orderDetail.getOrderId().equals(order.getOrderId())){//根据订单细明的订单id和订单的id对比，输出当前订单的详情情况
                        System.out.println(orderDetails1);//一条订单细明信息
                        *//* 根据订单号输出商品详情和购买数量和总价 *//*
                        System.out.println("商品对象（绑定对象）：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()) + '\n' +
                                "购买的商品编号为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsId() + '\n' +
                                "购买的商品名称为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsName() + '\n' +
                                "商品的图片为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsImg() + '\n' +
                                "商品的价格为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsPrice() + '\n' +
                                "订单细明购买的数量为：" + orderDetail.getOrderDetailNum() + '\n' +
                                "商品总价为：" + goodsService.getGoodsDetailById(orderDetail.getGoodsId()).getGoodsPrice() * orderDetail.getOrderDetailNum() + '\n' + '\n' + '\n'
                        );
                    }
                }
            }
        }*/

        List<Goods> goodsList = goodsService.list_goods();
        model.addAttribute("ordersList",ordersList);//绑定订单集合信息
        model.addAttribute("getInfosList",getInfosList);//绑定收货人信息
        model.addAttribute("orderDetails",orderDetails);//绑定订单细明
        model.addAttribute("goodsList",goodsList);
        return "userOrderHistoryPage";
    }

    @RequestMapping("deleteOneHistoryOrder")
    public String deleteOneHistoryOrder(Model model,@Param("userName")String userName,@Param("orderId") Integer orderId) throws UnsupportedEncodingException {
        System.out.println("用户是："+userName+'\n'+"               删除的订单编号为："+orderId);
        Boolean flag1 = orderDetailService.deleteOneOrderDetail(orderId);//先删除订单明细
        Boolean flag2 = orderService.deleteOneOrder(orderId);//在删除订单
        if(flag1.equals(true)&flag2.equals(true)){
            System.out.println("删除一条历史订单成功！");
        }
        return "redirect:showOrderHistory.action?userName="+ URLEncoder.encode(userName, "UTF-8");//设置编码
    }
}
