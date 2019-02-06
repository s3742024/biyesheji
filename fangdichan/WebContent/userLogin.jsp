<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty sessionScope.msg}">
		<h2>${sessionScope.msg}</h2>
		<script type="text/javascript">
		let msg="${sessionScope.msg}";
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.open({
				  title: '错误',
				  content: msg
				});     
			});    
		  console.log(msg)
		</script>
		<%session.removeAttribute("msg"); %>
	</c:if>
	<form action="LoginServlet" method="post">
		用户名：<input type="text" name="uname"><br> 密 码：<input type="password" name="upwd"><br> <input type="submit" value="登陆">
	</form>
</body>
</html>