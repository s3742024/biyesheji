<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="layui-row ">
		<div class="user-notice-image">
			<img src="${pageContext.request.contextPath}/source/images/user.jpg"></img>
		</div>
		<div class="user-notice-name">
			<p style="color:#363;font-size: 1.4rem;font-weight: bold;">${sessionScope.userNickname}</p>
			<p>普通用户</p>
		</div>
	</div>
		<div class="layui-row user-notice" id="userNotice">
		<i class="layui-icon layui-icon-username"><a href="javascript:void(0)" id="userInfoEdit">账号资料修改</a></i>
		<i class="layui-icon layui-icon-auz">完善个人信息</i>
		<i class="layui-icon layui-icon-notice">最新通知</i>
		<a href="LogoutServlet"><i class="layui-icon layui-icon-return">退出登陆</i></a>
	</div>
</body>
<script>
$("#userNotice").click(function(e) {
	var url = e.target.id;
	if (url) {
		$("#mainArea").load(url + ".jsp");
	}
})
</script>
</html>