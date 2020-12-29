package cn.jjxy.controller;

import cn.jjxy.mapper.UsersMapper;
import cn.jjxy.pojo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("person")
public class UserHomeController {
    @Autowired
    private UsersMapper usersMapper;
    /* 跳转至主页，显示主页信息 */
    @RequestMapping("userHome")
    public String loginPage(Model model, @RequestParam("userName") String userName) throws IOException {
        Users user = usersMapper.getUserByName(userName);
        model.addAttribute("user",user);
        return "userInfoPage";
    }
    /* 修改用户的个人信息 */
    @RequestMapping("modifyUserData")
    public String modifyUserData(@RequestParam("name") String name,@RequestParam("psd") String psd,@RequestParam("sex") String sex,@RequestParam("tel") String tel, @RequestParam("userId") Integer userId){
        Users user = new Users();
        user.setUserId(userId);
        user.setUserName(name);
        user.setUserPsd(psd);
        user.setUserSex(sex);
        user.setUserTel(tel);
        usersMapper.updateUserByUserId(user);
        return "forward: userHome.action?userName="+name;
    }
}
