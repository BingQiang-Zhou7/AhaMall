package zhou.dao;

import java.util.ArrayList;

public class Commdify {
	public String commdifyID;
	public String commdifyName;
	public String commdifyType;
	public int commdifyPrice;
	public String commdifyAddTime;
	public String commdifyAddressOfImage;
	public String commdifyDescription;
	public String commdifyNumberOfComment;
	public ArrayList<String> CommentContent;
	
	public Commdify(String commdifyID,String commdifyName,String commdifyType,int commdifyPrice,
			String commdifyAddTime,String commdifyAddressOfImage,String commdifyDescription,String commdifyNumberOfComment) 
	{
		setCommdifyID(commdifyID);
		setCommdifyName(commdifyName);
		setCommdifyType(commdifyType);
		setCommdifyPrice(commdifyPrice);
		setCommdifyAddTime(commdifyAddTime);
		setCommdifyAddressOfImage(commdifyAddressOfImage);
		setCommdifyDescription(commdifyDescription);
		setCommdifyNumberOfComment(commdifyNumberOfComment);
	}
	
	
	public String getCommdifyID() {
		return commdifyID;
	}
	public void setCommdifyID(String commdifyID) {
		this.commdifyID = commdifyID;
	}
	public String getCommdifyName() {
		return commdifyName;
	}
	public void setCommdifyName(String commdifyName) {
		this.commdifyName = commdifyName;
	}
	public String getCommdifyType() {
		return commdifyType;
	}
	public void setCommdifyType(String commdifyType) {
		this.commdifyType = commdifyType;
	}
	public int getCommdifyPrice() {
		return commdifyPrice;
	}
	public void setCommdifyPrice(int commdifyPrice) {
		this.commdifyPrice = commdifyPrice;
	}
	public String getCommdifyAddTime() {
		return commdifyAddTime;
	}
	public void setCommdifyAddTime(String commdifyAddTime) {
		this.commdifyAddTime = commdifyAddTime;
	}
	public String getCommdifyAddressOfImage() {
		return commdifyAddressOfImage;
	}
	public void setCommdifyAddressOfImage(String commdifyAddressOfImage) {
		this.commdifyAddressOfImage = commdifyAddressOfImage;
	}
	public String getCommdifyDescription() {
		return commdifyDescription;
	}
	public void setCommdifyDescription(String commdifyDescription) {
		this.commdifyDescription = commdifyDescription;
	}
	public String getCommdifyNumberOfComment() {
		return commdifyNumberOfComment;
	}
	public void setCommdifyNumberOfComment(String commdifyNumberOfComment) {
		this.commdifyNumberOfComment = commdifyNumberOfComment;
	}
}
