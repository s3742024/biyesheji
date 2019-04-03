package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.HouseBase;
import bean.SellInfo;
import util.JDBCUtils;

public class BuyDao {
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private static boolean res = false;
	private static int result = 0;
	
	private static ArrayList<SellInfo> transformation (ResultSet rs) throws SQLException {
		ArrayList<SellInfo> sellInfos = new ArrayList<SellInfo>();
		
		while(rs.next()) {
			String house_base_id = rs.getString("house_base_id");
			String p_id = rs.getString("p_id");
			String detail_position = rs.getString("detail_position");
			String max_floor_num = rs.getString("max_floor_num");
			String construction_area = rs.getString("construction_area");
			String house_layout = rs.getString("house_layout");
			String house_orientation = rs.getString("house_orientation");
			String house_type = rs.getString("house_type");
			String decoration_degree = rs.getString("decoration_degree");
			String mortgage_status = rs.getString("mortgage_status");
			String completion_date = rs.getString("completion_date");
			String east_longitude = rs.getString("east_longitude");
			String north_latitude = rs.getString("north_latitude");
			HouseBase houseBase = new HouseBase(house_base_id, p_id, detail_position, max_floor_num, construction_area, house_layout, house_orientation, house_type, decoration_degree,
					mortgage_status, completion_date, east_longitude, north_latitude);
			String sell_info_id = rs.getString("sell_info_id");
			// String house_base_id = rs.getString("house_base_id");
			String sell_title = rs.getString("sell_title");
			String sell_date = rs.getString("sell_date");
			String sell_user_id = rs.getString("sell_user_id");
			String sell_price = rs.getString("sell_price");
			String sell_point = rs.getString("sell_point");
			String sell_mentality = rs.getString("sell_mentality");
			String contact_info_id = rs.getString("contact_info_id");
			SellInfo sellInfo = new SellInfo(sell_info_id, house_base_id, sell_title, sell_date, sell_user_id, sell_price, sell_point, sell_mentality, contact_info_id, houseBase);
			sellInfos.add(sellInfo);
		}
		if (sellInfos.size() == 0)
			return null;
		else
			return sellInfos;
	}
	/**
	 * 
	 * @description 获得所有卖房信息，不排序
	 * @param page 第几页
	 * @param num 每页几条数据
	 * @return sellInfo 对应的sell_info的数组，null没有查询到和出现异常
	 */
	public static ArrayList<SellInfo> QuerySellInfoById(int page,int num) {
		try {//这里只能用字符串拼接不然会出错
			String sql = "select top "+ num +" * from (select row_number() over(order by sell_date asc) as rownumber,* from houserAllInfo_b) temp_row where rownumber>"+num*(page-1);
			rs = JDBCUtils.executeQuery(sql, null);
			return transformation(rs);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
}
