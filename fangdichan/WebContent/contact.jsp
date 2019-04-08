<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form class="layui-form"  method="post" id="buyContectSubmit">
			<div class="layui-form-item">
				<p class="login-title">填写联系方式</p>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label login-label">称呼</label>
				<div class="layui-input-block  login-input">
					<input type="text" name="contactCall" lay-verify="required" autocomplete="off" placeholder="（例如：东先生）" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label login-label">电话</label>
				<div class="layui-input-block login-input">
					<input type="text" name="contactPhone" lay-verify="required" autocomplete="off" placeholder="（例如：173*******1）" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<textarea name="purchaseRemarks" placeholder="联系人备注" class="layui-textarea"></textarea>
			</div>
			<div class="layui-form-item">
				<button type="submit" class="layui-btn layui-btn-fluid">提交申请</button>
			</div>
		</form>
		<script type="text/javascript">
		layui.use('form', function(){
			  var form = layui.form;
			});
		$('#buyContectSubmit').on('submit', function() {
			buyContectSubmit();
			event.preventDefault(); //阻止默认事件
		})
		function buyContectSubmit(){
			var args = {
					"method" : "buyContextInfo",
					"sellInfoId":"<%=request.getParameter("sellInfoId")%>",
					"userNickname":"<%=session.getAttribute("userNickname")%>",
					"detailPosition" : $("input[name='contactCall']").val(),
					"maxFloorNum" : $("input[name='contactPhone']").val(),
					"constructionArea" : $("textarea[name='purchaseRemarks']").val(),
			};
			console.log(args.sellInfoId,args.userNickname)
			$.ajax({
				type : "post",
				url : "BuyServlet",
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