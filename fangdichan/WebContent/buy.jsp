<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	买房
	<div class="buy-search" id=""></div>
	<div class="buy-box">
		
	</div>
	<div id="test1"></div>
	<script>
	<form class="layui-form" action="">
	</form>
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			//执行一个laypage实例
			laypage.render({
				elem : 'test1', //注意，这里的 test1 是 ID，不用加 # 号
				count : 50, //数据总数，从服务端得到
				jump : function(obj, first) {
					//obj包含了当前分页的所有参数，比如：
					console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
					console.log(obj.limit); //得到每页显示的条数
				}
			});
		});
	</script>
</body>
</html>