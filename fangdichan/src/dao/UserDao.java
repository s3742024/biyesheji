package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	 * @description 修改用户个人信息
	 * @param string
	 * @return
	 */
	public static User UpdateUserNick(String id, User user) {
//		try {
//			String sql = "select * from a_user where user_password = ? and user_nickname = ?";
//			// 连接数据库
//			conn = JDBCUtils.getConnection();
//			// 建立Statement对象
//			pstmt = conn.prepareStatement(sql);
//			// pstmt.setString(1, password);
//			// pstmt.setString(2, nickname);
//			// 执行数据库查询语句
//			rs = pstmt.executeQuery();
//			if (rs.next()) {// 登陆成功
//				String userId = rs.getString("user_id");
//				String userNickname = rs.getString("user_nickname");
//				String userPassword = rs.getString("user_password");
//				String phoneNum = rs.getString("phone_num");
//				String email = rs.getString("email");
//				String realInfoId = rs.getString("real_info_id");
//				String userType = rs.getString("user_type");
//				String managerRemarks = rs.getString("manager_remarks");
//				User user = new User(userId, userNickname, userPassword, phoneNum, email, realInfoId, userType, managerRemarks);
//				return user;
//			} else {
//				// 没有找到
//				return null;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		} finally {
//			JDBCUtils.close(rs, pstmt, conn);
//		}

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
			if (rs.next()) {//找到
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
}
