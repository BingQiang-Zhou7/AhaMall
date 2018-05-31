package zhou.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import zhou.dao.Commodity;

public class DataProcess {
	DataAccess dataAccess = new DataAccess("AhaMall");
	
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
								resultSet.getString("description"),resultSet.getString("numofcomment"),resultSet.getInt("isRecommend")));
			}
			resultSet.close();
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
	
	public static void main(String[] args) {
		ArrayList<Commodity> commodityList = new DataProcess().getCommodityInfo("全部", "默认", "false");
		
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
			System.out.println("----------------------------------------");
		}
		System.out.println(commodityList.size());
	}
}
