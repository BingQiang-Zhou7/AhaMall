package zhou.dao;

import java.util.ArrayList;

public class Order {
	public String payTime;
	public String orderID;
	public ArrayList<Commodity> commodities = null;
	
	public Order(String payTime,String orderID) {
		setOrderID(orderID);
		setPayTime(payTime);
		commodities = new ArrayList<Commodity>();
	}
	
	
	public ArrayList<Commodity> getCommodities() {
		return commodities;
	}
	public void setCommodities(ArrayList<Commodity> commodities) {
		this.commodities = commodities;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	
}
