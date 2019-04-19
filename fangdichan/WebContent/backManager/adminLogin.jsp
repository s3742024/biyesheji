<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="layui-col-md8 layui-col-md-offset2 animated bounceInUp login-box">
		<form class="layui-form" action="LoginServlet2" method="post">
			<div class="layui-form-item">
				<p class="login-title">管理员登陆</p>
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
				<button type="submit" class="layui-btn layui-btn-fluid">登陆</button>
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