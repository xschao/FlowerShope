package cn.jjxy.controller;

import cn.jjxy.service.AdminService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("admin")
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("login")
    public String login(Model model,@Param("userName") String userName){
        System.out.println("管理员登录成功！");
        model.addAttribute("userName",userName);
        return "admin";
    }
}
