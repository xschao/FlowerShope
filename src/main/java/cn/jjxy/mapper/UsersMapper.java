package cn.jjxy.mapper;

import cn.jjxy.pojo.Order;
import cn.jjxy.pojo.Users;
import org.apache.ibatis.annotations.Param;

public interface UsersMapper {
    /*根据用户名和密码登录*/
    Users find_nameAndPsd(@Param("name") String name,@Param("password") String password);
    /*根据电话号码和密码登录*/
    Users find_loginByTel(@Param("tel") String tel,@Param("password") String password);

    /*用户注册*/
    Boolean save_register(Users user);
    /*注册验证：1、根据用户名*/
    Boolean find_checkRegisterByName(String userName);
    /*注册验证：2、根据电话号*/
    Boolean find_checkRegisterByTel(String tel);
    /* 用于个人页面显示 */
    Users getUserByName(String name);

    //用于表关联地址信息表的查询
    Users getGetInfoByUserId(Integer id);

    //用于管理订单信息表的查询
    Users getOrderByUserId(Integer id);

    //根据用户名查询用户的id.用户来标志用户实现关联查询
    Integer getUserIdByUserName(@Param("userName") String name);


    /*===============================用户个人中心===============================*/
    //根据用户名修改用户信息
    Boolean updateUserByUserId(Users user);
}
