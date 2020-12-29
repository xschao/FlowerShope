package cn.jjxy.controller;

import cn.jjxy.pojo.Users;
import cn.jjxy.service.AdminService;
import cn.jjxy.service.OrderDetailService;
import cn.jjxy.service.OrderService;
import cn.jjxy.service.UserService;
import cn.jjxy.util.DateUtil;
import cn.jjxy.util.PhoneFormatCheckUtils;
import cn.jjxy.util.UserNameAndPsdFormatCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@RequestMapping("user")
@Controller
public class UsersController {
    /*注入service层*/
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;

    /*用户登录*/
    @RequestMapping(value = "login")
    public void Login(Model model, HttpServletRequest request, HttpServletResponse response, String userName, String passWord, String role) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        System.out.println("SystemOut:" + userName + passWord + role);
        model.addAttribute("userName", userName);
        if ("user".equals(role)) {//用户登录
            Users userWay1 = userService.find_nameAndPsd(userName, passWord);
            Users userWay2 = userService.find_loginByTel(userName, passWord);
            if (userWay1 != null || userWay2 != null) {
                out.print("{\"ok\":\"true\"}");
                out.close();
                System.out.println("用户登录成功！");

            } else {
                out.print("{\"ok\":\"false\",\"msg\":\"用户名或密码输入错误\"}");
                out.close();
                System.out.println("用户名或密码输入错误");
            }
        } else if ("admin".equals(role)) {//管理员登录
            if (adminService.find_adminByNamePsd(userName, passWord)) {
                out.print("{\"ok\":\"admin\"}");
                out.close();
                System.out.println("管理员正在登陆！");
            } else {
                out.print("{\"ok\":\"false\",\"msg\":\"账号或密码错误\"}");
                out.close();
                System.out.println("账号或密码错误");
            }
        } else {
            out.print("{\"ok\":\"false\",\"msg\":\"请选择你的角色\"}");
            out.close();
            System.out.println("请选择你的角色");
        }

    }

    /*主页跳转*/
    @RequestMapping(value = "loginPage")
    public String loginPage(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("userName") String userName) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        System.out.println("userName:=" + userName);
        request.getSession().setAttribute("userName", userName);//把用户名保存到session中，用于全局显示
        return "forward:/goods/goodsList.action";
    }

    /*用户注册*/
    @RequestMapping("register")
    public void register(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String psd = request.getParameter("psd");
        String sex = request.getParameter("sex");
        String tel = request.getParameter("tel");
        Date perBirthday = Date.valueOf((request.getParameter("birthday")));
        Date laterBirthday = DateUtil.Convertor(perBirthday);
        System.out.println("name:" + name + "psd:" + psd + "sex:" + sex + "tel" + tel + "birthday:" + laterBirthday);
        Users user = new Users(name, psd, sex, tel, laterBirthday);
        Boolean flag1 = userService.find_checkRegisterByName(name);
        Boolean flag2 = userService.find_checkRegisterByTel(tel);
        System.out.println("flag:" + flag1 + "flag2:" + flag2);
        if (flag1 != null) {
            out.print("{\"ok\":\"false\",\"msg\":\"请按要求填写名称\"}");
            out.close();
            System.out.println("请按要求填写名称！");
        }
        if (flag2 != null) {
            out.print("{\"ok\":\"false\",\"msg\":\"请按要求填写电话号\"}");
            out.close();
            System.out.println("请按要求填写电话号！");
        }
        if (flag1 == null && flag2 == null) {
            out.print("{\"ok\":\"true\"}");
            out.close();
            userService.save_register(user);
            System.out.println("注册成功！");
        }

    }

    @RequestMapping(value = "registerPage")
    public String registerPage(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        return "login";
    }

    /*登录验证：用户名*/
    @RequestMapping("registerCheckName")
    public void userNameCheckName(HttpServletRequest request, HttpServletResponse response, String userName, String userTel) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        System.out.println("uerName:" + userName + "userTel:" + userTel);
        if(!UserNameAndPsdFormatCheck.checkUserName(userName)){
            out.print("{\"ok\":\"false\",\"msg\":\"用户名3-10位，不以数字开始，可含常用字符!\"}");
            out.close();
            System.out.println("请按正确用户名格式填写!");
        }else {
            Boolean checkName = userService.find_checkRegisterByName(userName);
            if (!checkName) {//如果用户名注册过返回为真
                out.print("{\"ok\":\"true\"}");
                System.out.println("用户名输入合理！");
            } else {
                out.print("{\"ok\":\"false\",\"msg\":\"用户名被占用\"}");
                out.close();
                System.out.println("用户名被占用！");
            }
        }

    }

    /*登录验证：用户电话号码*/
    @RequestMapping("registerCheckTel")
    public void userNameCheckTel(HttpServletRequest request, HttpServletResponse response, String userName, String userTel) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        System.out.println("uerName:" + userName + "userTel:" + userTel);
        if (!PhoneFormatCheckUtils.isPhoneLegal(userTel)) {
            out.print("{\"ok\":\"false\",\"msg\":\"请按正确电话号格式填写！\"}");
            out.close();
            System.out.println("请按正确电话号格式填写!");
        }else {
            Boolean checkTel = userService.find_checkRegisterByTel(userTel);
            if (!checkTel) {//如果用户电话号码注册过返回为真
                System.out.println("电话号码输入合理！");
            } else {
                out.print("{\"ok\":\"false\",\"msg\":\"电话号码已注册,请直接登录！\"}");
                out.close();
                System.out.println("电话号码已经注册过！");
            }
        }
    }
}
