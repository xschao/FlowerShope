package cn.jjxy.util;

public class UserNameAndPsdFormatCheck {
    public static boolean checkUserName(String userName){
        /*持中文，又支持英文字符，不能以数字开头*/
        String regExp = "^[a-zA-Z\\u4e00-\\u9fa5]{1}[a-zA-Z0-9_\\u4e00-\\u9fa5]{2,10}$";
        return userName.matches(regExp);
    }
    public static boolean checkUserPsd(String psd){
        /* 匹配6~10位由数字和26个英文字母混合而成的密码： */
        String regExp = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$";
        return psd.matches(regExp);
    }
}
