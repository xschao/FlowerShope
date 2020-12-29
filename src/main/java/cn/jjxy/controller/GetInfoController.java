package cn.jjxy.controller;

import cn.jjxy.pojo.GetInfo;
import cn.jjxy.service.GetInfoService;
import cn.jjxy.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("getInfo")
public class GetInfoController {
    @Autowired
    private UserService userService;
    @Autowired
    private GetInfoService getInfoService;

    //新增一个收货人，只是单纯的跳转
    @RequestMapping("addOneGetInfoPage")
    public String addOneGetInfo() {
        return "orderRegister";//跳转到新增收货人界面
    }

    /* 显示用户的常用收货人信息 */
    @RequestMapping("getInfoDetailList")
    public String getInfoDetailList(@Param("userName") String userName, Model model, HttpServletRequest request, HttpServletResponse response) {
        Integer id = userService.getUserIdByUserName(userName);//查询当前用户的id，利用用户的id关联查询收货人细明。
        List<GetInfo> listGetInfo = userService.getGetInfoByUserId(id).getListGetInfo();
        System.out.println("用户：" + userName + "对应的收货人有：" + listGetInfo);
        model.addAttribute("listGetInfo", listGetInfo);
        return "getInfoDetailList";
    }

    /* 删除用户的某个收货人信息 */
    @RequestMapping("delGetInfoOneData")
    public String delGetInfoOneData(@Param("getInfoId") Integer getInfoId, @Param("userName") String userName, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Boolean flag = getInfoService.delGetInfoOneData(getInfoId);
        if (flag) {
            System.out.println("用户" + userName + "的收货人地址删除：" + getInfoId + "        成功！");
        } else {
            System.out.println("删除失败！");
        }
        return "redirect:getInfoDetailList.action?userName=" + URLEncoder.encode(userName, "UTF-8");
    }

    /* 修改用户的某个收货人信息 */
    @RequestMapping("updateGetInfoOneData")
    public String updateGetInfoOneData(@Param("getInfoID") Integer getInfoID,@Param("getInfoName") String getInfoName,@Param("getInfoTel") String getInfoTel,@Param("getInfoAddress") String getInfoAddress,@Param("getInfoPost") String getInfoPost,@Param("userName") String userName) throws UnsupportedEncodingException {
        GetInfo getInfo = new GetInfo();
        getInfo.setGetInfoID(getInfoID);
        getInfo.setGetInfoName(getInfoName);
        getInfo.setGetInfoTel(getInfoTel);
        getInfo.setGetInfoAddress(getInfoAddress);
        getInfo.setGetInfoPost(getInfoPost);
        System.out.println("输入的收货人信息："+getInfo);
        Boolean flag = getInfoService.updateGetInfoOneData(getInfo);
        if (flag) {
            System.out.println("修改收货人信息成功！");
        } else {
            System.out.println("修改删除失败！");
        }
        return "redirect:getInfoDetailList.action?userName=" + URLEncoder.encode(userName, "UTF-8");
    }
}
