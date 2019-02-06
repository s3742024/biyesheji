<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<<jsp:useBean id="user" class="bean.User"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 头部部分 -->
	<c:import url="header.jsp"></c:import>
	<!-- 	主要区域 -->
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md8" style="background-color: #dee; height: 1000px">
				<div class="quick">
					<div class="layui-row quick-info">快速查询房屋信息</div>
					<div class="layui-row quick-search">
						<input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
						<button class="layui-btn layui-btn-fluid">流体按钮（最大化适应）</button>
					</div>
					<div class="quick-area"></div>
					<div class="quick-price"></div>
				</div>
			</div>
			<div class="layui-col-md4" style="background-color: #eca; height: 1000px">
				<!-- 用户状态部分 -->

				<%-- 				<c:set value="董涛" target="${user}" property="userNickname"></c:set> --%>
				<%-- 				<c:out value="${user.userNickname }"></c:out> --%>
				<%-- 				<c:out value="${user.userPassword }"></c:out> --%>
				<c:if test="${empty sessionScope.userNickname}">
					<h2>还没登陆</h2>
					<c:import url="userLogin.jsp"></c:import>
				</c:if>
				<c:if test="${not empty sessionScope.userNickname}">
					${sessionScope.userNickname}
					
					<h2>登陆了</h2>
				</c:if>

				<%
					// 					Connection conn;
					// 					Statement stmt;
					// 					ResultSet rs;
					// 					try {
					// 						//加载数据库驱动程序，对于jdbc4版本可以不用写这段代码	                 		
					// 						Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					// 						out.println("数据库驱动加载成功");
					// 					} catch (ClassNotFoundException ex) {
					// 						out.println("数据库驱动加载失败");
					// 					}
					// 					String url = "jdbc:sqlserver://localhost:1433;DatabaseName=fangdichan;integratedSecurity=TRUE;";
					// 					String sql = "select * from t_Area";
					// 					try {
					// 						//连接数据库
					// 						conn = DriverManager.getConnection(
					// 								"jdbc:sqlserver://localhost:1433;DatabaseName=fangdichan;integratedSecurity=TRUE");
					// 						//建立Statement对象
					// 						stmt = conn.createStatement();
					// 						//执行数据库查询语句
					// 						rs = stmt.executeQuery(sql);
					// 						while (rs.next()) {
					// 							int id = rs.getInt("id");
					// 							String name = rs.getString("area");
					// 							out.println("id:" + id + "\tname:" + name);

					// 						}
					// 						if (rs != null) {
					// 							rs.close();
					// 							rs = null;
					// 						}
					// 						if (stmt != null) {
					// 							stmt.close();
					// 							stmt = null;
					// 						}
					// 						if (conn != null) {
					// 							conn.close();
					// 							conn = null;
					// 						}
					// 						out.println("数据库连接成功");
					// 					} catch (SQLException e) {
					// 						e.printStackTrace();
					// 						out.println("数据库连接失败");
					// 					}
				%>

			</div>
		</div>
	</div>
	<!-- 	尾部部分 -->
	<c:import url="footer.jsp"></c:import>

</body>
</html>