<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>房地产交易网</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/source/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="./source/css/myStyle.css" />
<script src="${pageContext.request.contextPath}/source/layui/layui.js"></script>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<style type="text/css">
.index-news {
	height: 300px
}
</style>
</head>
<body>
	<!-- 头部部分 -->
	<div class="layui-container" id="title"></div>
	<%-- <c:import url="header.jsp"></c:import> --%>
	<!-- 	主要区域 -->
	<div class="layui-container" id="mainArea">
		
	</div>
	<!-- 	尾部部分 -->
		<div class="layui-container" id="footer">
		</div>
	<script type="text/javascript">
		$("#title").load("header.jsp");
		$("#mainArea").load("home.jsp");
		$("#footer").load("footer.jsp");
	</script>
</body>
</html>