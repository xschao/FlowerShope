package cn.jjxy.pojo;
/**
 * @author  kevin
 * @desc    实现对收货人信息的插入 ，gi_id作为f_getInfo的主键，它自动增长，所以不用插入。也因此新建一个类，将插入的数据封装至此
 **/
public class GetInfoAdd {
    private String usersId;//用户表的id是收货人信息表的外键
    private String getInfoName;
    private String getInfoTel;
    private String getInfoAddress;
    private String getInfoPost;//收货人邮编

    public GetInfoAdd() {
    }

    public GetInfoAdd(String usersId, String getInfoName, String getInfoTel, String getInfoAddress, String getInfoPost) {
        this.usersId = usersId;
        this.getInfoName = getInfoName;
        this.getInfoTel = getInfoTel;
        this.getInfoAddress = getInfoAddress;
        this.getInfoPost = getInfoPost;
    }

    public String getUsersId() {
        return usersId;
    }

    public void setUsersId(String usersId) {
        this.usersId = usersId;
    }

    public String getGetInfoName() {
        return getInfoName;
    }

    public void setGetInfoName(String getInfoName) {
        this.getInfoName = getInfoName;
    }

    public String getGetInfoTel() {
        return getInfoTel;
    }

    public void setGetInfoTel(String getInfoTel) {
        this.getInfoTel = getInfoTel;
    }

    public String getGetInfoAddress() {
        return getInfoAddress;
    }

    public void setGetInfoAddress(String getInfoAddress) {
        this.getInfoAddress = getInfoAddress;
    }

    public String getGetInfoPost() {
        return getInfoPost;
    }

    public void setGetInfoPost(String getInfoPost) {
        this.getInfoPost = getInfoPost;
    }

    @Override
    public String toString() {
        return "GetInfoAdd{" +
                "usersId='" + usersId + '\'' +
                ", getInfoName='" + getInfoName + '\'' +
                ", getInfoTel='" + getInfoTel + '\'' +
                ", getInfoAddress='" + getInfoAddress + '\'' +
                ", getInfoPost='" + getInfoPost + '\'' +
                '}';
    }
}
