package bean;

public class User {
	private String userId;
	private String userNickname;
	private String userPassword;
	private String phoneNum;
	private String email;
	private String realInfoId;
	private String userType;
	private String managerRemarks;

	public User() {
	}

	public User(String userNickname, String userPassword) {
		this.userNickname = userNickname;
		this.userPassword = userPassword;
	}

	public User(String userId, String userNickname, String userPassword, String phoneNum, String email, String realInfoId, String userType, String managerRemarks) {
		this.userId = userId;
		this.userNickname = userNickname;
		this.userPassword = userPassword;
		this.phoneNum = phoneNum;
		this.email = email;
		this.realInfoId = realInfoId;
		this.userType = userType;
		this.managerRemarks = managerRemarks;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealInfoId() {
		return realInfoId;
	}

	public void setRealInfoId(String realInfoId) {
		this.realInfoId = realInfoId;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getManagerRemarks() {
		return managerRemarks;
	}

	public void setManagerRemarks(String managerRemarks) {
		this.managerRemarks = managerRemarks;
	}

}
