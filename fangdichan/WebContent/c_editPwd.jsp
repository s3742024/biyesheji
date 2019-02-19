<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="layui-row user-manager">
		<fieldset class="layui-elem-field">
			<legend class="font-big">选择验证方式</legend>
			<div class="layui-field-box">
				<button class="layui-btn layui-btn-fluid">手机短信验证</button>
				<button class="layui-btn layui-btn-fluid">电子邮箱验证</button>
			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend class="font-big">手机验证</legend>
			<div class="layui-field-box">
				<button class="layui-btn">接收验证码</button>
				<input type="text" name="title" required lay-verify="required" placeholder="输入验证码" autocomplete="off" class="layui-input">
				<button class="layui-btn layui-btn-fluid" onclick="editPwd()">提交</button>
			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend class="font-big">修改密码</legend>
			<form class="layui-form" id="editPwdSubmit">
				<div class="layui-field-box">
					<input type="text" name="title" required lay-verify="required" placeholder="输入要修改的密码" autocomplete="off" class="layui-input" id="editPwdTxt">
					<button class="layui-btn layui-btn-fluid">提交</button>
				</div>
			</form>

		</fieldset>
		<fieldset class="layui-elem-field">
			<legend class="font-big">密码修改规则</legend>
			<div class="layui-field-box">此处为文本</div>
		</fieldset>
	</div>
	<script type="text/javascript">
	$('#editPwdSubmit').on('submit', function(){
		editPwd();
	  event.preventDefault(); //阻止默认事件
	})
		function editPwd() {
			var pwd=$("#editPwdTxt").val();
			var nickname="<%=session.getAttribute("userNickname")%>";
			var args = {
				"method" : "editPwd",
				"password" : pwd,
				"nickname" : nickname
			};
			$.ajax({
				type : "post",
				url : "userManager",
				data : args,
			}).success(function(message) {
				let msg = "${sessionScope.msg}";
				//添加提示
				layui.use('layer', function() {
					var layer = layui.layer;
					layer.msg(message);
				});
			}).fail(function(err) {
				console.log(err);
				alert("未知错误");
			})
		}
	</script>
</body>
</html>