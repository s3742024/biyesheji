package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.HouseBase;
import bean.SellInfo;
import util.JDBCUtils;
import util.UUIDUtils;

public class TransactionDao {
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private static boolean res = false;
	private static int result = 0;
	
	/**
	 * 
	 * @description 给house_base sell_info添加新的记录
	 * @param userId 卖房者id
	 * @param houseBase bean类
	 * @return true=成功false=出错
	 */
	public static boolean InputHouseBaseInfo(String userId,HouseBase houseBase) {
		try {
			String sql = "insert into s_house_base values(?,?,?,?,?,?,?,?,?,?,?,?,?);insert into s_sell_info(sell_info_id,house_base_id,sell_user_id) values(?,?,?)";
			Object[] params = { houseBase.getHouseBaseId(), //前13个
					houseBase.getpId(),
					houseBase.getDetailPosition(),
					houseBase.getMaxFloorNum(),
					houseBase.getConstructionArea(),
					houseBase.getHouseLayout(),
					houseBase.getHouseOrientation(),
					houseBase.getHouseType(),
					houseBase.getDecorationDegree(),
					houseBase.getMortgageStatus(),
					houseBase.getCompletionDate(),
					houseBase.getEastLongitude(),
					houseBase.getNorthLatitude(),
					UUIDUtils.getUUID(),//后3个
					houseBase.getHouseBaseId(),
					userId
			};
			res = JDBCUtils.executeUpdate(sql, params);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 根据用户id获得所有交易信息包括基本信息
	 * @param 用户id
	 * @return houseBases 所有sell_info的数组，null没有查询到和出现异常
	 */
	public static ArrayList<SellInfo> QueryUserBydNickName(String userid) {
		try {
			String sql = "select * from s_house_base,s_sell_info where sell_user_id = ? and s_house_base.house_base_id=s_sell_info.house_base_id";
			Object[] params = { userid };
			rs = JDBCUtils.executeQuery(sql, params);
			ArrayList<SellInfo> sellInfos = new ArrayList<SellInfo>();
			while (rs.next()) {// 找到
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
				HouseBase houseBase=new HouseBase(house_base_id,p_id,detail_position,max_floor_num,construction_area,house_layout,house_orientation,house_type,decoration_degree,mortgage_status,completion_date,east_longitude,north_latitude);
				String sell_info_id = rs.getString("sell_info_id");
				//String house_base_id = rs.getString("house_base_id");
				String sell_title = rs.getString("sell_title");
				String sell_date = rs.getString("sell_date");
				String sell_user_id = rs.getString("sell_user_id");
				String sell_price = rs.getString("sell_price");
				String sell_point = rs.getString("sell_point");
				String sell_mentality = rs.getString("sell_mentality");
				String contact_info_id = rs.getString("contact_info_id");
				SellInfo sellInfo=new SellInfo(sell_info_id,house_base_id,sell_title,sell_date,sell_user_id,sell_price,sell_point,sell_mentality,contact_info_id,houseBase);
				sellInfos.add(sellInfo);
				
			} 
			if(sellInfos.size()==0)
				return null;
			else
				return sellInfos;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 插入卖房信息和交易信息
	 * @param sellInfo 卖出信息，里面有houseBase 基本信息
	 * @return 1=匹配成功，0=账号封禁，-1=没有找到或出错
	 */
	public static boolean updateHouseInfo(SellInfo sellInfo) {
		try {
			String sql = "insert into s_house_base values(?,?,?,?,?,?,?,?,?,?,?,?,?);insert into s_sell_info values(?,?,?,?,?,?,?,?,?)";
			HouseBase houseBase=sellInfo.getHouseBase();
			Object[] params = { houseBase.getHouseBaseId(), //前13个
					houseBase.getpId(),
					houseBase.getDetailPosition(),
					houseBase.getMaxFloorNum(),
					houseBase.getConstructionArea(),
					houseBase.getHouseLayout(),
					houseBase.getHouseOrientation(),
					houseBase.getHouseType(),
					houseBase.getDecorationDegree(),
					houseBase.getMortgageStatus(),
					houseBase.getCompletionDate(),
					houseBase.getEastLongitude(),
					houseBase.getNorthLatitude(),
					sellInfo.getSellInfoId(),//后9个
					sellInfo.getHouseBaseId(),
					sellInfo.getSellTitle(),
					sellInfo.getSellDate(),
					sellInfo.getSellUserId(),
					sellInfo.getSellPrice(),
					sellInfo.getSellPoint(),
					sellInfo.getSellMentality(),
					sellInfo.getContactInfoId()
			};
			res = JDBCUtils.executeUpdate(sql, params);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(rs);
		}
	}
}
