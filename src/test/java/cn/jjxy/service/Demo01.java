package cn.jjxy.service;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Demo01 {
    @Test
    public void TestDeleteSomeChar(){
        String a=",,,23.2,,,4,,,3,,,";
        String str ="11";
        Pattern p = Pattern.compile("\\d*");

        Matcher m = p.matcher(str);

        String res ="";
        while (m.find()) {
            if (!"".equals(m.group()))
                res += m.group()+",";

        }
        System.out.print(res);
    }
    @Test
    public void analysisDate(){
        String getTime = "2020-12-21";
        String[] splitDate = getTime.split("-");
        for(String s:splitDate){
            System.out.println(s);
        }
    }
    @Test
    public void getOrderNumber(){
        int date = Math.abs((int)new Date().getTime());
        System.out.println(date);
    }

}
