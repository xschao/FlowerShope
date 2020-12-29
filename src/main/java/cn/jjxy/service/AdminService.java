package cn.jjxy.service;

import cn.jjxy.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {
    Boolean find_adminByNamePsd(String name,String pwd);

    //查询所用用户  查询（参数一个：pageSize、pageNumber）
    List<Users> findAllUsersForPage(Integer pageSize, Integer pageNumber);
    //查询用户的记录条数
    Integer findUsersCount();
    //查询所用用户
    List<Users> findAllUsers();
}
