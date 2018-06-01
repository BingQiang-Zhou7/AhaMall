package zhou.dao;


public class Commodity {
	public String commodityID;
	public String commodityName;
	public String commodityType;
	public int commodityPrice;
	public String commodityAddTime;
	public String commodityAddressOfImage;
	public String commodityDescription;
	public String commodityNumberOfComment;
	public int commodityIsRecommend;
	public String commodityNumber;
	
	public String getCommodityNumber() {
		return commodityNumber;
	}

	public void setCommodityNumber(String commodityNumber) {
		this.commodityNumber = commodityNumber;
	}

	public int getCommodityIsRecommend() {
		return commodityIsRecommend;
	}

	public void setCommodityIsRecommend(int commodityIsRecommend) {
		this.commodityIsRecommend = commodityIsRecommend;
	}

	public Commodity(String commodityID,String commodityName,String commodityType,int commodityPrice,
			String commodityAddTime,String commodityAddressOfImage,String commodityDescription,
			String commodityNumberOfComment,int commodityIsRecommend,String commodityNumber) 
	{
		setCommodityID(commodityID);
		setCommodityName(commodityName);
		setCommodityType(commodityType);
		setCommodityPrice(commodityPrice);
		setCommodityAddTime(commodityAddTime);
		setCommodityAddressOfImage(commodityAddressOfImage);
		setCommodityDescription(commodityDescription);
		setCommodityNumberOfComment(commodityNumberOfComment);
		setCommodityIsRecommend(commodityIsRecommend);
		setCommodityNumber(commodityNumber);
	}

	public String getCommodityID() {
		return commodityID;
	}

	public void setCommodityID(String commodityID) {
		this.commodityID = commodityID;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public int getCommodityPrice() {
		return commodityPrice;
	}

	public void setCommodityPrice(int commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	public String getCommodityAddTime() {
		return commodityAddTime;
	}

	public void setCommodityAddTime(String commodityAddTime) {
		this.commodityAddTime = commodityAddTime;
	}

	public String getCommodityAddressOfImage() {
		return commodityAddressOfImage;
	}

	public void setCommodityAddressOfImage(String commodityAddressOfImage) {
		this.commodityAddressOfImage = commodityAddressOfImage;
	}

	public String getCommodityDescription() {
		return commodityDescription;
	}

	public void setCommodityDescription(String commodityDescription) {
		this.commodityDescription = commodityDescription;
	}

	public String getCommodityNumberOfComment() {
		return commodityNumberOfComment;
	}

	public void setCommodityNumberOfComment(String commodityNumberOfComment) {
		this.commodityNumberOfComment = commodityNumberOfComment;
	}
}
