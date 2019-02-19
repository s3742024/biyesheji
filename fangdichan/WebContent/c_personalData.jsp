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
			<legend class="font-big">个人资料</legend>
			<div class="layui-field-box">
				<p id="noRealInfo" style="display: none;">还没有填写个人资料，请尽快补全</p>
				<p id="hasRealInfo" style="display: none;">您已填写个人资料，不可修改</p>
			</div>
		</fieldset>


		<fieldset class="layui-elem-field">
			<legend class="font-big">说明</legend>
			<div class="layui-field-box">
				⚪请如实填写个人资料<br />⚪个人资料填写后不能修改<br />⚪网站不会泄露您个人隐私<br />
			</div>
		</fieldset>
	</div>
	<div class="layui-row user-manager" style="display: none;" id="showRealInfo">
		<fieldset class="layui-elem-field">
			<legend class="font-big">个人资料</legend>
			<form class="layui-form" id="personalDataSubmit" >
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-block">
						<input type="text" name="title" required lay-verify="required" placeholder="（例如：李四）" autocomplete="off" class="layui-input" id="realName">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号码</label>
					<div class="layui-input-block">
						<input type="text" name="title" required lay-verify="required" placeholder="（例如：320202199001010510）" autocomplete="off" class="layui-input" id="idCardNum">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">职业</label>
					<div class="layui-input-block">
						<input type="text" name="title" required lay-verify="required" placeholder="（例如：程序员）" autocomplete="off" class="layui-input" id="occupation">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">上传身份证图片</label>
					<div class="layui-input-block">
						<input type="text" name="title" placeholder="（这个没有做）" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-input-block">
					<button class="layui-btn" id="realInfoSubmit">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</form>
		</fieldset>
	</div>
	<script type="text/javascript">
	$(document).ready(function checkRealInfo() {
		var args = {
				"method" : "CheckRealInfo",
				"nickname": "<%=session.getAttribute("userNickname")%>"
			};
		$.ajax({
			type : "post",
			url : "userManager",
			data : args,
		}).success(function(message) {
			if(message=="true"){
				$("#hasRealInfo").show();
				$("#noRealInfo").hide();
				$("#showRealInfo").hide();
			}
			else{
				$("#noRealInfo").show();
				$("#hasRealInfo").hide();
				$("#showRealInfo").show();
			}
		}).fail(function(err) {
			console.log(err);
			alert("未知错误");
		})
	})
		$('#personalDataSubmit').on('submit', function() {
			realInfo();
			event.preventDefault(); //阻止默认事件
		})
		function realInfo() {
			var args = {
				"method" : "updateRealInfo",
				"realName" : $("#realName").val(),
				"idCardNum" : $("#idCardNum").val(),
				"occupation" : $("#occupation").val(),
				"nickname": "<%=session.getAttribute("userNickname")%>",
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