package zhou.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zhou.dao.Comment;
import zhou.dao.Commodity;

public class DataProcess {
	DataAccess dataAccess;
	
	public DataProcess(String dbName) {
		dataAccess = new DataAccess(dbName);
	}
	
	
	// 获取商品信息
	public ArrayList<Commodity> getCommodityInfo(String type,String sort,String fuzzy) {
		Object[] parameter = new Object[] {type,sort,fuzzy};
		ResultSet resultSet = dataAccess.DatabaseOperations("call SortCommodityWithTypeAndSort(?,?,?)", parameter);
		ArrayList<Commodity> commodityList = new ArrayList<Commodity>();
		try {
			while (resultSet.next()) {
				commodityList.add(
						new Commodity(resultSet.getString("id"), resultSet.getString("name"), resultSet.getString("type"), 
								resultSet.getInt("price"), resultSet.getString("addedTime"), resultSet.getString("addressofimage"), 
								resultSet.getString("description"),resultSet.getString("numofcomment"),resultSet.getInt("isRecommend"),"0"));
			}
			resultSet.close();
			closeConnect();
			if (commodityList.size() == 0) {
				return null;
			}
			return commodityList;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//关闭连接
	public void closeConnect() {
		dataAccess.colseConnect();
	}
	
	//获取商品评论
	public ArrayList<Comment> getCommentInfo(String commodityid) {
		Object[] parameter = new Object[] {commodityid};
		ResultSet resultSet = dataAccess.DatabaseOperations("call SearchCommodityComment(?)", parameter);
		ArrayList<Comment> CommentList = new ArrayList<Comment>();
		try {
			while (resultSet.next()) {
				String userPhoneNum = resultSet.getString("userPhoneNum");
				userPhoneNum =userPhoneNum.substring(0, 3)+"********";
				CommentList.add(new Comment(resultSet.getString("name"),userPhoneNum, 
						resultSet.getString("content"), resultSet.getString("commenttime"))
						);
			}
			resultSet.close();
			closeConnect();
			if (CommentList.size() == 0) {
				return null;
			}
			return CommentList;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}	
	}
	
	// 获取商品信息
	public ArrayList<Commodity> getCartCommodityInfo(String userPhoneNum) {
		Object[] parameter = new Object[] {userPhoneNum};
		ResultSet resultSet = dataAccess.DatabaseOperations("call SortCommodityInShoppingCart(?)", parameter);
		ArrayList<Commodity> commodityList = new ArrayList<Commodity>();
		try {
			while (resultSet.next()) {
				commodityList.add(
						new Commodity(resultSet.getString("id"), resultSet.getString("name"), resultSet.getString("type"), 
								resultSet.getInt("price"), resultSet.getString("addedTime"), resultSet.getString("addressofimage"), 
								resultSet.getString("description"),resultSet.getString("numofcomment"),resultSet.getInt("isRecommend"),resultSet.getString("numOfCommodity")));
			}
			resultSet.close();
			closeConnect();
			if (commodityList.size() == 0) {
				return null;
			}
			return commodityList;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	//获取商品评论
	public void InsertcommodityToshoppingCart(String userPhoneNum,String commodityId,String numOfCommodity) {
		Object[] parameter = new Object[] {userPhoneNum,commodityId,numOfCommodity};
		dataAccess.DatabaseOperations("call InsertCommodityToShoppingCart(?,?,?)", parameter);
		closeConnect();
	}
	
	//更新购物车商品数量
	public void UpdateCommodityToShoppingCart(String userPhoneNum,String commodityId,String numOfCommodity) {
		Object[] parameter = new Object[] {userPhoneNum,commodityId,numOfCommodity};
		dataAccess.DatabaseOperations("call UpdateCommodityToShoppingCart(?,?,?)", parameter);
		closeConnect();
	}
	
	//删除购物车商品 commodityId=all 删除全部
	public void DeleteCommodityToShoppingCart(String userPhoneNum,String commodityId) {
		Object[] parameter = new Object[] {userPhoneNum,commodityId};
		dataAccess.DatabaseOperations("call DeleteCommodityToShoppingCart(?,?)", parameter);
		closeConnect();
	}
	
	public static void main(String[] args) {
//		ArrayList<Commodity> commodityList = new DataProcess().getCommodityInfo("全部", "默认", "false");
//		
//		for (Commodity commodity : commodityList) {
//			System.out.println(commodity.getCommodityID());
//			System.out.println(commodity.getCommodityName());
//			System.out.println(commodity.getCommodityType());
//			System.out.println(commodity.getCommodityPrice());
//			System.out.println(commodity.getCommodityAddressOfImage());
//			System.out.println(commodity.getCommodityNumberOfComment());
//			System.out.println(commodity.getCommodityAddTime());
//			System.out.println(commodity.getCommodityDescription());
//			System.out.println(commodity.getCommodityIsRecommend());
//			System.out.println("----------------------------------------");
//		}
//		System.out.println(commodityList.size());
		
//		ArrayList<Comment> commentList = new DataProcess("AhaMall").getCommentInfo("xiaomi_005");
//		for (Comment comment : commentList) {
//			System.out.println(comment.getCommentConent());
//			System.out.println(comment.getCommentTime());
//			System.out.println(comment.getCommodityName());
//			System.out.println(comment.getUserPhoneNum());
//			System.out.println("----------------------------------------");
//		}
		
//		new DataProcess("AhaMall").InsertcommodityToshoppingCart("13312341234","apple_001","1");
//		System.out.println("hello");
		
//		new DataProcess("AhaMall").DeleteCommodityToShoppingCart("13312341234","apple_001");
//		System.out.println("hello");
		
//		new DataProcess("AhaMall").UpdateCommodityToShoppingCart("13312341234","apple_001","100");
//		System.out.println("hello");
		
		ArrayList<Commodity> commodityList = new DataProcess("AhaMall").getCartCommodityInfo("13312341234");
		
		for (Commodity commodity : commodityList) {
			System.out.println(commodity.getCommodityID());
			System.out.println(commodity.getCommodityName());
			System.out.println(commodity.getCommodityType());
			System.out.println(commodity.getCommodityPrice());
			System.out.println(commodity.getCommodityAddressOfImage());
			System.out.println(commodity.getCommodityNumberOfComment());
			System.out.println(commodity.getCommodityAddTime());
			System.out.println(commodity.getCommodityDescription());
			System.out.println(commodity.getCommodityIsRecommend());
			System.out.println(commodity.getCommodityNumber());
			System.out.println("----------------------------------------");
		}
		System.out.println(commodityList.size());
	}
}
