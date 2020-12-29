package cn.jjxy.mapper;

import cn.jjxy.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    Boolean find_adminByNamePsd(@Param("name") String name,@Param("pwd") String pwd);

    /*=========================1、 用户管理模块 ===============================*/
    //查询所用用户  查询（参数一个：pageSize、pageNumber）
    List<Users> findAllUsersForPage(@Param("pageSize") Integer pageSize, @Param("pageNumber") Integer pageNumber);
    //查询用户的记录条数
    Integer findUsersCount();
    //查询所用用户
    List<Users> findAllUsers();

}
