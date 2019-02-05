<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="layui-row user-status">
		登陆
		<c:set value="董涛" target="${user}" property="userNickname"></c:set>
		<c:set value="123321" target="${user}" property="userPassword"></c:set>
		<h2>
			<c:out value="${user.userNickname }"></c:out>
			<c:out value="${user.userPassword }"></c:out>
		</h2>
		
	</div>
</body>
</html>