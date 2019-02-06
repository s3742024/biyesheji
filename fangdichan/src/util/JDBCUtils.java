package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtils {
	// 定义数据库四大基本信息
	private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url = "jdbc:sqlserver://localhost:1433;DatabaseName=fangdichan;integratedSecurity=TRUE";
	private static String username = "";
	private static String password = "";
	private static PreparedStatement pstmt = null;
	private static Connection conn = null;

	// 返回数据库链接对象
	public static Connection getConnection() {
		try {
			Class.forName(driver);
			// 获取数据库链接对象
			return DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			// 把编译异常转变为运行时异常
			throw new RuntimeException("数据库链接失败");
		}
	}

	// 静态关闭流对象
	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static boolean executeUpdate(String sql, Object[] params) {
		try {
			pstmt = getConnection().prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + i, params[i]);
				}
			}
			int count = pstmt.executeUpdate();
			if (count > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static ResultSet executeQuery(String sql, Object[] params) {
		try {
			pstmt = getConnection().prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
			return pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
