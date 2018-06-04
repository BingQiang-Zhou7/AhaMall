package zhou.dao;

public class Comment {
	public String commodityName;
	public String userPhoneNum;
	public String commentConent;
	public String commentTime;
	
	public Comment(String commodityName,String userPhoneNum,String commentConent,String commentTime) {
		setCommentConent(commentConent);
		setCommentTime(commentTime);
		setCommodityName(commodityName);
		setUserPhoneNum(userPhoneNum);
	}
	
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}
	public String getUserPhoneNum() {
		return userPhoneNum;
	}
	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}
	public String getCommentConent() {
		return commentConent;
	}
	public void setCommentConent(String commentConent) {
		this.commentConent = commentConent;
	}
	public String getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
}
