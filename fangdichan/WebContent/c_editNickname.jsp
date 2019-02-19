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
			<legend class="font-big">头像</legend>
			<div class="layui-field-box">
				<img src="./source/images/user.jpg"></img>
			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend class="font-big">修改头像</legend>
			<div class="layui-field-box">
				<button type="button" class="layui-btn" id="test1">
					<i class="layui-icon">&#xe67c;</i>上传图片
					</button>
			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend class="font-big">头像修改规则</legend>
			<div class="layui-field-box">此处为文本</div>
		</fieldset>
	</div>
	<div class="layui-row user-manager">
		<fieldset class="layui-elem-field">
			<legend class="font-big">昵称</legend>
			<div class="layui-field-box" id="userNickname">${sessionScope.userNickname}</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend class="font-big">修改昵称</legend>
			<form class="layui-form" id="editNicknameSubmit">
			<div class="layui-field-box">
				<input type="text" name="title" required lay-verify="required" placeholder="输入要修改的昵称" autocomplete="off" class="layui-input" id="editNicknameTxt">
				<button class="layui-btn layui-btn-fluid">提交</button>
			</div>
			</form>
			
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend class="font-big">昵称修改规则</legend>
			<div class="layui-field-box">此处为文本</div>
		</fieldset>
	</div>
	<script type="text/javascript">
	$('#editNicknameSubmit').on('submit', function(){
		editPwd();
	  event.preventDefault(); //阻止默认事件
	})
		function editPwd() {
			var alterNickname=$("#editNicknameTxt").val();
			var nickname="<%=session.getAttribute("userNickname")%>";
			var args = {
				"method" : "editNickname",
				"alterNickname" : alterNickname,
				"nickname" : nickname
			};
			$.ajax({
				type : "post",
				url : "userManager",
				data : args,
			}).success(function(message) {
				//更新要显示的地方
				$("#userNickname").text(alterNickname);
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