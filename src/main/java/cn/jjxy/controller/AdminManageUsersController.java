package cn.jjxy.controller;

import cn.jjxy.pojo.Users;
import cn.jjxy.service.AdminService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("admin/users")
@Controller
public class AdminManageUsersController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("usersList")
    public String usersAllList(Model model, @Param("userName") String userName, HttpServletRequest request, HttpServletResponse response){
        System.out.println("管理员登录成功！");
        model.addAttribute("userName",userName);
        List<Users> allUsers = adminService.findAllUsers();
        int recordCount = allUsers.size();/*获取记录条数*/
        request.setAttribute("param",recordCount/8+1);/*记录页数为：记录总数/页面显示记数
                                                           *+1将记录条数发送给页面*/
        request.setAttribute("recordCount",recordCount);
        int page = 1;
        if(request.getParameter("page")==null){    //首次访问时不能获取页码
            allUsers = adminService.findAllUsersForPage(8,1); //首次访问将page值置为1 默认显示首页
        }else{
            page  = Integer.parseInt(request.getParameter("page"));//获取接下来的当前页码
            allUsers = adminService.findAllUsersForPage(8,page);
        }
        request.setAttribute("listUser",allUsers);
        request.setAttribute("curPage",page);//首次访问时将页码1传送给前端页面
        System.out.println("curpage:"+page);

        return "admin";
    }

}
