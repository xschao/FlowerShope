package cn.jjxy.pojo;
/**
 * @author  kevin
 * @desc 管理员
 * CREATE TABLE `f_admin` (
    `a_id` int(8) NOT NULL AUTO_INCREMENT,
    `a_name` varchar(10) NOT NULL,
    `a_psd` varchar(10) NOT NULL,
    PRIMARY KEY (`a_id`)
    ) ;
 **/
public class Admin extends Users{
    private Integer adminId;
    private String adminName;
    private String adminPsd;

    public Admin() {
    }

    public Admin(Integer adminId, String adminName, String adminPsd) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminPsd = adminPsd;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPsd() {
        return adminPsd;
    }

    public void setAdminPsd(String adminPsd) {
        this.adminPsd = adminPsd;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminPsd='" + adminPsd + '\'' +
                '}';
    }
}
