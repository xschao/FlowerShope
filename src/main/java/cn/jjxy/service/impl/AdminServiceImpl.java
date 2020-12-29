package cn.jjxy.service.impl;

import cn.jjxy.mapper.AdminMapper;
import cn.jjxy.pojo.Users;
import cn.jjxy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Boolean find_adminByNamePsd(String name, String pwd) {
        return adminMapper.find_adminByNamePsd(name,pwd);
    }

    @Override
    public List<Users> findAllUsersForPage(Integer pageSize, Integer pageNumber) {
        return adminMapper.findAllUsersForPage((pageNumber-1)*pageSize,pageSize*pageNumber);
    }

    @Override
    public Integer findUsersCount() {
        return null;
    }

    @Override
    public List<Users> findAllUsers() {
        return adminMapper.findAllUsers();
    }

}
