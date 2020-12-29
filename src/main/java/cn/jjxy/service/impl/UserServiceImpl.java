package cn.jjxy.service.impl;


import cn.jjxy.mapper.UsersMapper;
import cn.jjxy.pojo.Users;
import cn.jjxy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UsersMapper usersMapper;

    @Override
    public Users find_loginByTel(String tel, String password) {
        return usersMapper.find_loginByTel(tel,password);
    }

    @Override
    public Users find_nameAndPsd(String name, String password) {
        return usersMapper.find_nameAndPsd(name,password);
    }

    public Boolean save_register(Users users){
        return usersMapper.save_register(users);
    }

    @Override
    public Boolean find_checkRegisterByName(String userName) {
        return usersMapper.find_checkRegisterByName(userName);
    }

    @Override
    public Boolean find_checkRegisterByTel(String tel) {
        return usersMapper.find_checkRegisterByTel(tel);
    }

    @Override
    public Users getUserByName(String name) {
        return usersMapper.getUserByName(name);
    }

    @Override
    public Users getGetInfoByUserId(Integer id) {
        return usersMapper.getGetInfoByUserId(id);
    }

    @Override
    public Users getOrderByUserId(Integer id) {
        return usersMapper.getOrderByUserId(id);
    }

    @Override
    public Integer getUserIdByUserName(String name) {
        return usersMapper.getUserIdByUserName(name);
    }


    @Override
    public Boolean updateUserByUserId(Users user) {
        return usersMapper.updateUserByUserId(user);
    }

}
