package cn.jjxy.service;

import cn.jjxy.pojo.GetInfo;
import cn.jjxy.pojo.GetInfoAdd;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*.xml")

public class GetInfoTest {
    @Autowired
    private GetInfoService getInfoService;
    @Test
    public void addOneGetInfoData(){
        GetInfoAdd getInfoAdd = new GetInfoAdd();
        getInfoAdd.setUsersId("1");
        getInfoAdd.setGetInfoName("小王的阿姨");
        getInfoAdd.setGetInfoTel("1367782753");
        getInfoAdd.setGetInfoPost("330200");
        getInfoAdd.setGetInfoAddress("嘉业花园33栋10号");
        getInfoService.addOneGetInfoData(getInfoAdd);
    }
    /* 根据收货人id删除收货人信息*/
    @Test
    public void TestDelGetInfoOneData(){
        GetInfo getInfoByGetInfoId = getInfoService.findGetInfoByGetInfoId(1);
        System.out.println("1111"+getInfoByGetInfoId);
    }

    /* 根据收货人id修改收货人信息*/
    @Test
    public void TestUpdateGetInfoOneData(){
        GetInfo getInfo = new GetInfo();
        getInfo.setGetInfoID(10);
        getInfo.setGetInfoName("小王的姨夫");
        getInfoService.updateGetInfoOneData(getInfo);
    }
}
