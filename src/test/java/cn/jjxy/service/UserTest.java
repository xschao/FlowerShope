package cn.jjxy.service;

import cn.jjxy.mapper.GetInfoMapper;
import cn.jjxy.mapper.OrderMapper;
import cn.jjxy.mapper.UsersMapper;
import cn.jjxy.pojo.GetInfo;
import cn.jjxy.pojo.Order;
import cn.jjxy.pojo.Users;
import cn.jjxy.util.DateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*.xml")

public class UserTest {
    @Autowired
    private UserService usersMapper;
    @Autowired
    private GetInfoService getInfoMapper;
    @Autowired
    private  OrderService orderMapper;
    @Autowired
    private OrderDetailService orderDetailService;
    @Test
    public void GetUserByIdTest(){
        Users user = usersMapper.find_nameAndPsd("123","123");
        System.out.println("user:"+user);
    }
    @Test
    public void register(){
        Date perBirthday = Date.valueOf("2020-12-01");
        Date laterBirthday = DateUtil.Convertor(perBirthday);
        Users u = new Users("1去    1","11", "女","11",laterBirthday);
        usersMapper.save_register(u);
    }
    /* 多表查询操作： 用户收货地址关联查询 */
    @Test
    public void getUserInfoById(){
  /*      System.out.println( "根据收货地址查询用户信息："+getInfoMapper.list_getInfo(1).get(1).getUsers());
        System.out.println();*/
        Users user = usersMapper.getGetInfoByUserId(1);
        System.out.println("用户下的收货地址有:"+user.getListGetInfo());
    }
    /* 多表查询操作： 用户、订单关联查询 */
    //订单查询还需关联地址表。所以现在查询是存在问题的:这样想法是错误的，我们管理地址设置了它的外键
    @Test
    public void getUserOrderById(){
        Users user = usersMapper.getOrderByUserId(1);
        System.out.println("用户下的订单有:"+user.getOrderList());
        List<Order> orderList = user.getOrderList();
        
        /*=========================先获取订单编号===============================*/
        /* 把订单编号存入集合中 */
        List<Integer> orderIds = new LinkedList<>();
        for(Order order:orderList){
            System.out.println("订单编号有："+order.getOrderId());
            System.out.println();
        }
        /* 根据订单查询订单详情 */
        /* 把订单详情存入订单集合，进而查询商品详情和 */
        for(Integer ids : orderIds){
            orderMapper.getOrderDetailByOrderId(ids);
            System.out.println("根据订单编号查询的订单详情有："+orderMapper.getOrderDetailByOrderId(ids));
            System.out.println();
        }
    }

    @Test
    public void getUserIdByUserName(){
        Boolean checkRegisterByName = usersMapper.find_checkRegisterByName("1213");
        System.out.println(checkRegisterByName);
    }

    /*===============================用户个人中心===============================*/
    //根据用户名修改用户信息\
    @Test
   public void TestUpdateUserByUserId(){
       Users users = new Users();
       users.setUserId(14);
       users.setUserName("123");
       users.setUserSex("男");
       users.setUserTel("17836238462");
       users.setUserPsd("123");
       System.out.println(users);
       usersMapper.updateUserByUserId(users);
   }

}
