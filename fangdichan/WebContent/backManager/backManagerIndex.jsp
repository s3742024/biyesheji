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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/source/css/backManager.css" />
</head>
<body>
	<div class="layui-container titleImg" style="background-image: url('${pageContext.request.contextPath}/source/images/backImg.jpg')"></div>
	<div class="layui-container layui-row" id="backManagerMain">
		<%-- <c:if test="${empty sessionScope.userNickname}"> --%>
		<c:import url="backManagerHome.jsp"></c:import>
<%-- 			<c:import url="adminLogin.jsp"></c:import> --%>
		<%-- </c:if> --%>
		<%-- <c:if test="${not empty sessionScope.userNickname}"> --%>
			<%-- 					${sessionScope.userNickname} --%>
			
		<%-- </c:if> --%>
	</div>

</body>
</html>