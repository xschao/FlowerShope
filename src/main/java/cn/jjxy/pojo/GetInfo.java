package cn.jjxy.pojo;

import javax.print.DocFlavor;

/**
 * @author  kevin
 * @desc    收货人信息表  ：一个用户对用多个收货人信息表
 *
 * CREATE TABLE `f_getinfo` (
`gi_id` int(8) NOT NULL AUTO_INCREMENT,
`gi_userId` int(8) NOT NULL,   用户表的id是收货人信息表的外键
`gi_uerName` varchar(10) DEFAULT NULL,
`gi_userTel` varchar(11) DEFAULT NULL,
`gi_userAddress` varchar(30) DEFAULT NULL,
`gi_uerPost` varchar(6) DEFAULT NULL,
PRIMARY KEY (`gi_id`),
CONSTRAINT `getinfo_ibfk_1` FOREIGN KEY (`gi_id`) REFERENCES `f_users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
 **/
public class GetInfo {
    //  收货人信息表  ：一个用户对用多个收货人信息表
    private Integer getInfoID;
    private String usersId;//用户表的id是收货人信息表的外键
    private String getInfoName;
    private String getInfoTel;
    private String getInfoAddress;
    private String getInfoPost;//收货人邮编

    // 收货人信息表和用户表是多对一的关系：  在收货人信息表中存放用户对象
    private Users users;

    // 收货地址和订单是一对一关系 ： 在收货地址设置订单对象
    private Order order;

    public GetInfo() {
    }

    public GetInfo(Integer getInfoID, String usersId, String getInfoName, String getInfoTel, String getInfoAddress, String getInfoPost) {
        this.getInfoID = getInfoID;
        this.usersId = usersId;
        this.getInfoName = getInfoName;
        this.getInfoTel = getInfoTel;
        this.getInfoAddress = getInfoAddress;
        this.getInfoPost = getInfoPost;
    }

    public Integer getGetInfoID() {
        return getInfoID;
    }

    public String getUsersId() {
        return usersId;
    }

    public String getGetInfoName() {
        return getInfoName;
    }

    public String getGetInfoTel() {
        return getInfoTel;
    }

    public String getGetInfoAddress() {
        return getInfoAddress;
    }

    public String getGetInfoPost() {
        return getInfoPost;
    }

    public Users getUsers() {
        return users;
    }

    public void setGetInfoID(Integer getInfoID) {
        this.getInfoID = getInfoID;
    }

    public void setUsersId(String usersId) {
        this.usersId = usersId;
    }

    public void setGetInfoName(String getInfoName) {
        this.getInfoName = getInfoName;
    }

    public void setGetInfoTel(String getInfoTel) {
        this.getInfoTel = getInfoTel;
    }

    public void setGetInfoAddress(String getInfoAddress) {
        this.getInfoAddress = getInfoAddress;
    }

    public void setGetInfoPost(String getInfoPost) {
        this.getInfoPost = getInfoPost;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "GetInfo{" +
                "getInfoID=" + getInfoID +
                ", usersId='" + usersId + '\'' +
                ", getInfoName='" + getInfoName + '\'' +
                ", getInfoTel='" + getInfoTel + '\'' +
                ", getInfoAddress='" + getInfoAddress + '\'' +
                ", getInfoPost='" + getInfoPost + '\'' +
                '}';
    }
}
