<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="layui-row">
		<div class="layui-col-md8 index-main">
			<div class="layui-card">
				<div class="quick-info">快速查询房屋信息</div>
				<div class="quick-search">
					<input type="text" name="searchStr" placeholder="请输入名称、地址" autocomplete="off" class="layui-input">
					<button class="layui-btn layui-btn-fluid" onclick="search()">
						<i class="layui-icon">&#xe615</i>搜索
					</button>
				</div>
				<div class="quick-area">
					<span class="layui-breadcrumb"> <span>热门区域:</span> <a href="javascript:void(0)">滨湖</a> <a href="javascript:void(0)">崇安</a> <a href="javascript:void(0)">南长</a> <a href="javascript:void(0)">北塘</a>
						<a href="javascript:void(0)">新区</a> <a href="javascript:void(0)">惠山</a> <a href="javascript:void(0)">锡山</a>
					</span>
				</div>
				<div class="quick-price">
					<span class="layui-breadcrumb"> <span>热门板块:</span> <a href="javascript:void(0)">崇安寺</a> <a href="javascript:void(0)">太湖</a> <a href="javascript:void(0)">清名桥</a> <a href="javascript:void(0)">河埒</a>
						<a href="javascript:void(0)">旺庄</a> <a href="javascript:void(0)">广益</a> <a href="javascript:void(0)">黄巷</a>
					</span>
				</div>
			</div>
			<div class="index-show-item">
				<p class="quick-info">热门楼盘 >></p>
				<div class="layui-row">
					<div class="layui-carousel" id="carousel1">
						<div carousel-item>
							<div><img src="${pageContext.request.contextPath}/source/images/c1_1.png"></img></div>
							<div><img src="${pageContext.request.contextPath}/source/images/c1_2.png"></img></div>
							<div><img src="${pageContext.request.contextPath}/source/images/c1_3.png"></img></div>
							<div><img src="${pageContext.request.contextPath}/source/images/c1_4.png"></img></div>
						</div>
					</div>
				</div>
			</div>
			<div class="ad-1">
				<img alt="ad1" src="${pageContext.request.contextPath}/source/images/ad1.jpg">
			</div>
			<div class="index-show-item">
				<p class="quick-info">热门导购 >></p>
				<div class="layui-row">
					<div class="layui-carousel" id="carousel2">
						<div carousel-item>
							<div><img src="${pageContext.request.contextPath}/source/images/c2_1.png"></img></div>
							<div><img src="${pageContext.request.contextPath}/source/images/c2_2.png"></img></div>
							<div><img src="${pageContext.request.contextPath}/source/images/c2_3.png"></img></div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row ad-1">
				<img alt="ad2" src="${pageContext.request.contextPath}/source/images/ad2.jpg">
			</div>
			<div class="index-show-item">
				<p class="quick-info">精选 >></p>
				<div class="layui-row" style="height: 200px; width: 100%">
					<img src="${pageContext.request.contextPath}/source/images/c3.png" style="width:100%;height:100%"></img>
				</div>
			</div>
		</div>
		<div class="layui-col-md4 index-main" style="padding: 20px 0 0 20px">
			<!-- 用户状态部分 -->
			<div class="user-status" style="background-color: #0096881c;">
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
			<div class="layui-row ad-2" style="height: 330px">
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
	<script type="text/javascript">
	layui.use('carousel', function() {
		var carousel = layui.carousel;
		//建造实例
		carousel.render({
			elem : '#carousel1',
			width : '100%',
			height: '350px',
			arrow : 'always',
			/* indicator: 'none' */
		});
		carousel.render({
			elem : '#carousel2',
			width : '100%',
			height: '350px',
			arrow : 'always'
		});
	});
	function search(){
		var searchStr=$("input[name='searchStr']").val();
		if (search!=null){
			$("#mainArea").load("buy.jsp",{"searchStr":searchStr});
		}
	}
	</script>
</body>
</html>