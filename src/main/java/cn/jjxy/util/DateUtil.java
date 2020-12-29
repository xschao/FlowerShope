package cn.jjxy.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateUtil {
    public static Date Convertor(java.util.Date date) {
        java.util.Date covDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            covDate = sdf.parse(sdf.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date laterDate = new Date(covDate.getTime());
        return laterDate;
    }

    public static Date orderDateConvertor(java.util.Date date) {
        java.util.Date covDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        try {
            covDate = sdf.parse(sdf.format(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date laterDate = new Date(covDate.getTime());
        System.out.println("laterDate:"+laterDate);
        return laterDate;
    }
}
