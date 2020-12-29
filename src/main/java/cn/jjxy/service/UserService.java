package cn.jjxy.service;


import cn.jjxy.pojo.Users;

public interface UserService {
    Users find_loginByTel(String tel,String password);
    Users find_nameAndPsd(String name, String password);

    Boolean save_register(Users users);

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
    Integer getUserIdByUserName(String name);

    /*===============================用户个人中心===============================*/
    //根据用户名修改用户信息
    Boolean updateUserByUserId(Users user);
}
