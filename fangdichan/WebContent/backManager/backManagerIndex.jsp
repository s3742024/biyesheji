<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/source/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/source/layui/layui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/backManager.css" />

</head>
<body>
	<c:if test="${not empty sessionScope.msg}">
		<script type="text/javascript">
			let msg = "${sessionScope.msg}";
			layui.use('layer', function() {
				var layer = layui.layer;
				layer.msg(msg);
			});
		</script>
		<%
			session.removeAttribute("msg");
		%>
	</c:if>
	<div class="titleImg"><img alt="logo" src="${pageContext.request.contextPath}/source/images/logo.png" class="logo"><span class="title-text">房屋交易管理系统（管理员版）</span></div>
	<div class="layui-row" id="backManagerMain">
		<c:if test="${empty sessionScope.managerId}">
`			<c:import url="adminLogin.jsp"></c:import>
		</c:if>
		<c:if test="${not empty sessionScope.managerId}">
			${sessionScope.managerNickname}
			<c:import url="backManagerHome.jsp"></c:import>
		</c:if>
	</div>

</body>
</html>