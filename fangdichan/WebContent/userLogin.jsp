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

	<div class="login-box">

<!-- 				<form action="LoginServlet" method="post"> -->
<!-- 					用户名：<input type="text" name="uname"><br> 密 码：<input type="password" name="upwd"><br> <input type="submit" value="登陆"> -->
<!-- 				</form> -->
		<form class="layui-form" action="LoginServlet" method="post">
			<div class="layui-form-item">
				<p class="login-title">用户登陆</p>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label login-label">账号</label>
				<div class="layui-input-block  login-input">
					<input type="text" name="uname" required lay-verify="required" placeholder="用户名/手机号/邮箱" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label login-label">密码</label>
				<div class="layui-input-block login-input">
					<input type="text" name="upwd" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<input type="text" name="title" required lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-item">
				<input type="checkbox" name="zzz" lay-skin="switch" lay-text="记住我|不记住">
				<a class="login-wjmm">忘记密码</a>
			</div>
			<div class="layui-form-item">
				<button type="submit" class="layui-btn layui-btn-fluid">登陆</button>
			</div>
			<div class="layui-form-item">
				<label>还没有账号?立即</label>
				<a>注册</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	layui.use('form', function(){
		  var form = layui.form;
		  
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    layer.msg(JSON.stringify(data.field));
		    return false;
		  });
		});
	</script>
</body>
</html>