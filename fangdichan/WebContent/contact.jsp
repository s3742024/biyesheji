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
				<p class="login-title" id="buyContactTitle">填写联系方式</p>
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
			<div class="layui-form-item" >
				<textarea name="purchaseRemarks" placeholder="联系人备注" class="layui-textarea" id="buyContactRemarks"></textarea>
			</div>
			<div class="layui-form-item">
				<button type="submit" class="layui-btn layui-btn-fluid" id="buyContactBtn">提交申请</button>
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
					"contactCall" : $("input[name='contactCall']").val(),
					"contactPhone" : $("input[name='contactPhone']").val(),
					"purchaseRemarks" : $("textarea[name='purchaseRemarks']").val(),
			};
			console.log(args.sellInfoId,args.userNickname)
			$.ajax({
				type : "post",
				url : "BuyServlet",
				data : args,
			}).success(function(message) {
				var msg=JSON.parse(message);
				console.log(message);
				var data=msg.data;
				//添加提示
				if(msg.code==1){
					layui.use('layer', function() {
						var layer = layui.layer;
						layer.msg("添加出错");
					});
				}else{
					$("input[name='contactCall']").val(data.contactCall);
					$("input[name='contactPhone']").val(data.contactPhone);
					$("#buyContactTitle").text("联系人");
					$("#buyContactRemarks").val("已通知卖房者，以上为卖房者资料，请勿泄露给他人");;
					$("#buyContactBtn").hide();
				}
				
			}).fail(function(err) {
				console.log(err);
				alert("未知错误");
			})
		}
		</script>
</body>
</html>