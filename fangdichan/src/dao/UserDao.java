package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.RealInfo;
import bean.User;
import util.JDBCUtils;

public class UserDao {
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private static boolean res = false;
	private static int result = 0;

	/**
	 * 
	 * @description 根据昵称获得用户id
	 * @param 用户昵称
	 * @return user的bean类的数组 没有查询到和出现异常为null
	 */
	public static ArrayList<User>  QueryAllUser() {
		try {
			String sql = "select * from a_user";
			rs = JDBCUtils.executeQuery(sql,null);
			ArrayList<User> Users = new ArrayList<User>();
			while (rs.next()) {// 找到
				String user_id = rs.getString("user_id");
				String user_nickname = rs.getString("user_nickname");
				String user_password = rs.getString("user_password");
				String phone_num = rs.getString("phone_num");
				String email = rs.getString("email");
				String real_info_id = rs.getString("real_info_id");
				String user_type = rs.getString("user_type");
				String manager_remarks = rs.getString("manager_remarks");
				User user = new User(user_id, user_nickname, user_password, phone_num, email, real_info_id, user_type, manager_remarks);
				Users.add(user);
			}
			if (Users.size() == 0)
				return null;
			else
				return Users;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 获取所有账号信息
	 * @return 用户id
	 * @return 没有查询到和出现异常为null
	 */
	public static String QueryUserBydNickName(String nickname) {
		try {
			String sql = "select user_id from a_user where user_nickname = ?";
			Object[] params = { nickname };
			rs = JDBCUtils.executeQuery(sql, params);

			if (rs.next()) {// 找到
				String userId = rs.getString("user_id");
				return userId;
			} else {// 没有找到
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
	/**
	 * 
	 * @description 根据昵称获和密码获得用户信息
	 * @param 用户昵称
	 * @param 用户密码
	 * @return 在bean中定义的用户类
	 * @return 没有查询到和出现异常为null
	 */
	public static User QueryUserByPasswordAndNickName(String nickname, String password) {
		try {
			String sql = "select * from a_user where user_nickname = ? and user_password = ?";
			Object[] params = { nickname, password };
			rs = JDBCUtils.executeQuery(sql, params);

			if (rs.next()) {// 找到
				String userId = rs.getString("user_id");
				String userNickname = rs.getString("user_nickname");
				String userPassword = rs.getString("user_password");
				String phoneNum = rs.getString("phone_num");
				String email = rs.getString("email");
				String realInfoId = rs.getString("real_info_id");
				String userType = rs.getString("user_type");
				String managerRemarks = rs.getString("manager_remarks");
				User user = new User(userId, userNickname, userPassword, phoneNum, email, realInfoId, userType, managerRemarks);
				return user;
			} else {// 没有找到
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}

	/**
	 * 
	 * @description 修改用户个人信息 可改的为用户权限和管理员备注
	 * @param 用户的bean
	 * @return true=成功 false=失败
	 */
	public static boolean UpdateUserInfo(User user) {
		try {
			String sql = "update a_user set user_type =? ,manager_remarks=? where user_id=?";
			Object[] params = { user.getUserType(),user.getManagerRemarks(),user.getUserId() };
			res = JDBCUtils.executeUpdate(sql, params);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(null);
		}

	}

	public static boolean UpdatePwdByNickname(String nickname, String password) {
		try {
			String sql = "update a_user set user_password = ? where user_nickname = ?";
			Object[] params = { password, nickname };
			res = JDBCUtils.executeUpdate(sql, params);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(rs);
		}
	}

	public static boolean UpdateNickname(String nickname, String alterNickname) {
		try {
			String sql = "update a_user set user_nickname = ? where user_nickname = ?";
			Object[] params = { alterNickname, nickname };
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
	 * @description 是否存在该昵称
	 * @param 要查的昵称
	 * @return true=没找到 false=找到或出错
	 */
	public static boolean ExistNickname(String nickname) {
		try {
			String sql = "select * from a_user where user_nickname = ?";
			Object[] params = { nickname };
			rs = JDBCUtils.executeQuery(sql, params);
			if (rs.next()) {// 找到
				return false;
			} else {// 没有找到
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(rs);
		}
	}

	/**
	 * 
	 * @description 是否已经填写真实信息
	 * @param 要查的昵称
	 * @return true=没找到 false=找到或出错
	 */
	public static boolean ExistRealInfo(String userNickname) {
		try {
			String sql = "select real_info_id from a_user where user_nickname = ?";
			Object[] params = { userNickname };
			rs = JDBCUtils.executeQuery(sql, params);
			if (rs.next()) {// 找到
				if(rs.getString("real_info_id")==null) {
					return true;
				}
				return false;
			} else {// 没有找到
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(rs);
		}
	}

	/**
	 * 
	 * @description 添加base_info 
	 * @param 要更新的bean类
	 * @param 昵称
	 * @return true=成功，false=出错
	 */
	public static boolean UpdateRealInfo(String nickname, RealInfo realInfo) {
		try {
			String sql = "INSERT INTO a_real_info(real_info_id,real_info_name,id_card_num,occupation)VALUES(?,?,?,?);update s_sell_info  set real_info_id=? where user_nickname = ?";
			Object[] params = { realInfo.getRealInfoId(), realInfo.getRealInfoName(), realInfo.getIdCardNum(), realInfo.getOccupation(), realInfo.getRealInfoId(), nickname };
			res = JDBCUtils.executeUpdate(sql, params);
			if (res)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtils.close(null);
		}
	}
	/**
	 * 
	 * @description 查询所有个人资料 
	 * @return realInfo的bean类的数组 没有查询到和出现异常为null
	 */
	public static ArrayList<RealInfo>  queryPersonalData() {
		try {
			String sql = "select * from a_real_info";
			rs = JDBCUtils.executeQuery(sql,null);
			ArrayList<RealInfo> realInfos = new ArrayList<RealInfo>();
			while (rs.next()) {// 找到
				String real_info_id = rs.getString("real_info_id");
				String real_info_name = rs.getString("real_info_name");
				String id_card_num = rs.getString("id_card_num");
				String occupation = rs.getString("occupation");
				RealInfo realInfo = new RealInfo(real_info_id,real_info_name,id_card_num,occupation);
				realInfos.add(realInfo);
			}
			if (realInfos.size() == 0)
				return null;
			else
				return realInfos;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtils.close(rs);
		}
	}
}
