package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User;

public class userLogin {
	public static int login(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = -1;// -1=系统异常，0=用户名或密码有误，1=登陆成功
		int result = -1;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433;DatabaseName=fangdichan;integratedSecurity=TRUE;";
			
			String sql = "select count(*) from a_user where user_nickname = ? and user_password = ?";

			// 连接数据库
			conn = DriverManager.getConnection(url);
			// 建立Statement对象
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserNickname());
			pstmt.setString(2, user.getUserPassword());
			// 执行数据库查询语句
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			if (result > 0) {
				// 登陆成功

				return 1;
			} else {
				// 登陆失败
				return 0;
			}

		} catch (ClassNotFoundException ex) {
			System.out.println("数据库驱动加载失败");
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("数据库连接失败");
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
}
