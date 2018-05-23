package zhou.dao;

public class User {
	public String phoneNum;
	public String userID;
	public String userName;
	public String password;
	
	public User(String phoneNum,String userID,String userName,String password) {
		setPassword(password);
		setPhoneNum(phoneNum);
		setUserID(userID);
		setUserName(userName);
	}
	
	
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
