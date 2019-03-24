<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="layui-form" id="houseImageSubmit">
		<div class="layui-upload">
			<button type="button" class="layui-btn" id="imgType1">添加图片：</button>
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

		layui.use('upload', function() {
			var upload = layui.upload;
			//多图片上传
			upload.render({
				elem : '#imgType1',
				url : 'HouseImage',
				multiple : true,
				auto : false,
				bindAction : '#houseImgBtn',
				headers: {"houseBaseId": "<%=request.getParameter("houseBaseId")%>"} ,
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