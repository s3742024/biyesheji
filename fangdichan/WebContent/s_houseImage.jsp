<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="layui-table">
		<colgroup>
			<col>
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>具体地址</th>
				<th>添加图片</th>
			</tr>
		</thead>
		<tbody id="baseInfoTab">
			
		</tbody>
	</table>
	<form class="layui-form" id="houseImageSubmit">
		<div class="layui-upload">
			<button type="button" class="layui-btn" id="imgType1">实际图片：</button>
			<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
				预览图：
				<div class="layui-upload-list" id="imgBox1"></div>
			</blockquote>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit id="houseImgBtn">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
	
	$("#houseImageSubmit").ready(function checkRealInfo() {
		var args = {
				"method" : "getHouseBases",
				"nickname": "<%=session.getAttribute("userNickname")%>",
			};
			$.ajax({
				type : "post",
				url : "SellServlet",
				data : args,
			}).success(function(message) {
				message = $.parseJSON(message);
				if (message.msg == "true") {
					console.log(message.houseBases);
					$.each(message.houseBases,function (i,element) {
						$("#baseInfoTab").append("<tr><td>"+this.detailPosition+"</td><td><button data-id=\""+this.houseBaseId+"\" class=\"layui-btn\">立即提交</button></td></tr>")
					})
				}
			}).fail(function(err) {
				console.log(err);
				alert("未知错误");
			})
		})
		
		
		
		layui.use('upload', function() {
			var upload = layui.upload;
			//多图片上传
			upload.render({
				elem : '#imgType1',
				url : 'SellServlet',
				multiple : false,
				auto : false,
				bindAction : '#houseImgBtn',
				choose : function(obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result) {
						$('#imgBox1').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
					});
				},
				done : function(res) {
					console.log(res)
				}
			});
		});
	</script>
</body>
</html>