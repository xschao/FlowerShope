package cn.jjxy.pojo;
/**
 * @author  kevin
 * @desc  用户表
 * CREATE TABLE `f_users` (
	`u_id` int(11) PRIMARY KEY AUTO_INCREMENT,
	`u_name` varchar(10) NOT NULL,
	`u_psd` varchar(10) NOT NULL,
	`u_sex` varchar(2),
	`u_tel` varchar(11)，
	`u_birthday` date,
	`u_address` varchar(50)
	)；
 **/
import java.util.Date;
import java.util.List;

public class Users {
	private Integer userId;
	private String userName;
	private String userPsd;
	private String userSex;
	private String UserTel;
	private Date userBirthday;
	private String uerAddress;

	//用户和收货人是一对多的关系 ：在用户一方创建多的一方的集合
	private List<GetInfo> listGetInfo;

	//用户和订单是一对多的关系  ：在一的一方设多的一方的集合
	private List<Order> orderList;


	public Users(Integer userId, String userName, String userPsd, String userSex, String userTel, Date userBirthday, String uerAddress, List<GetInfo> listGetInfo, List<Order> orderList) {
		this.userId = userId;
		this.userName = userName;
		this.userPsd = userPsd;
		this.userSex = userSex;
		UserTel = userTel;
		this.userBirthday = userBirthday;
		this.uerAddress = uerAddress;
		this.listGetInfo = listGetInfo;
		this.orderList = orderList;
	}

	public List<GetInfo> getListGetInfo() {
		return listGetInfo;
	}

	public void setListGetInfo(List<GetInfo> listGetInfo) {
		this.listGetInfo = listGetInfo;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public Users() {
	}

	public Users(String userName, String userPsd, String userSex, String userTel, Date userBirthday) {
		this.userName = userName;
		this.userPsd = userPsd;
		this.userSex = userSex;
		UserTel = userTel;
		this.userBirthday = userBirthday;
	}

	public Users(Integer userId, String userName, String userPsd, String userSex, String userTel, Date userBirthday, String uerAddress, List<GetInfo> listGetInfo) {
		this.userId = userId;
		this.userName = userName;
		this.userPsd = userPsd;
		this.userSex = userSex;
		UserTel = userTel;
		this.userBirthday = userBirthday;
		this.uerAddress = uerAddress;
		this.listGetInfo = listGetInfo;
	}

	public Users(Integer userId, String userName, String userPsd, String userSex, String userTel, Date userBirthday, String uerAddress) {
		this.userId = userId;
		this.userName = userName;
		this.userPsd = userPsd;
		this.userSex = userSex;
		UserTel = userTel;
		this.userBirthday = userBirthday;
		this.uerAddress = uerAddress;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPsd() {
		return userPsd;
	}

	public void setUserPsd(String userPsd) {
		this.userPsd = userPsd;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserTel() {
		return UserTel;
	}

	public void setUserTel(String userTel) {
		UserTel = userTel;
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUerAddress() {
		return uerAddress;
	}

	public void setUerAddress(String uerAddress) {
		this.uerAddress = uerAddress;
	}

	@Override
	public String toString() {
		return "Users{" +
				"userId=" + userId +
				", userName='" + userName + '\'' +
				", userPsd='" + userPsd + '\'' +
				", userSex='" + userSex + '\'' +
				", UserTel='" + UserTel + '\'' +
				", userBirthday=" + userBirthday +
				", uerAddress='" + uerAddress + '\'' +
				'}';
	}

}

