<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>房地产交易网</title>

</head>
<body>
	<!-- 头部部分 -->
	<c:import url="header.jsp"></c:import>
	<!-- 	主要区域 -->
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md8 index-main" style="background-color: #dee">
				<div class="quick">
					<div class="layui-row quick-info">快速查询房屋信息</div>
					<div class="layui-row quick-search">
						<input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
						<button class="layui-btn layui-btn-fluid">
							<i class="layui-icon">&#xe615</i>搜索
						</button>
					</div>
					<div class="quick-area"></div>
					<div class="quick-price"></div>
				</div>
				<div class="index-show-item">
					<p>热门楼盘>></p>
					<div class="layui-row">
						<div class="layui-carousel" id="carousel1">
							<div carousel-item>
								<div>条目1</div>
								<div>条目2</div>
								<div>条目3</div>
								<div>条目4</div>
								<div>条目5</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-row ad-1">
					<img alt="ad1" src="${pageContext.request.contextPath}/source/images/ad1.jpg">
				</div>
				<div class="index-show-item">
					<p>热门导购>></p>
					<div class="layui-row">
						<div class="layui-carousel" id="carousel2">
							<div carousel-item>
								<div>条目1</div>
								<div>条目2</div>
								<div>条目3</div>
								<div>条目4</div>
								<div>条目5</div>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-row ad-1">
					<img alt="ad2" src="${pageContext.request.contextPath}/source/images/ad2.jpg">
				</div>
				<div class="index-show-item">
					<p>精选>></p>
					<div class="layui-row" style="background-color: #fcc; height: 150px; width: 100%">精选推荐</div>
				</div>
			</div>
			<div class="layui-col-md4 index-main" style="background-color: #eca;">
				<!-- 用户状态部分 -->
				<div class="user-status">
					<c:if test="${empty sessionScope.userNickname}">
						<c:import url="userLogin.jsp"></c:import>
					</c:if>
					<c:if test="${not empty sessionScope.userNickname}">
						<%-- 					${sessionScope.userNickname} --%>
						<c:import url="userStatus.jsp"></c:import>
					</c:if>
				</div>
				<fieldset class="layui-elem-field">
					<legend>新房动态</legend>
					<div class="layui-field-box index-news">内容区域</div>
				</fieldset>
				<div class="layui-row ad-2">
					<img alt="ad3" src="${pageContext.request.contextPath}/source/images/ad3.jpg">
				</div>
				<fieldset class="layui-elem-field">
					<legend>无锡租房小区排行</legend>
					<div class="layui-field-box index-news">内容区域</div>
				</fieldset>
				<div class="layui-row ad-2">
					<img alt="ad4" src="${pageContext.request.contextPath}/source/images/ad4.jpg">
				</div>
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
	<script type="text/javascript">
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#carousel1',
				width : '100%',
				arrow : 'always'
			});
			carousel.render({
				elem : '#carousel2',
				width : '100%',
				arrow : 'always'
			});
		});
	</script>
</body>
</html>