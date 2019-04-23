<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="queryAllContact" lay-filter="demo"></table>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#queryAllContact', //指定原始表格元素选择器（推荐id选择器）
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'contactinfoId',
					title : '联系人编号',
					sort : true,
				}, {
					field : 'contactCall',
					title : '称呼',
				}, {
					field : 'contactPhone',
					title : '联系电话'
				}] ],
				url : 'RootManager', //数据接口
				method : 'post',
				where : {
					'method' : 'queryAllContact'
				},
				done : function(res, curr, count) {
					if (res.code == 0) {
						console.log(res.data);
					}else if(res.code == 1){
						layer.msg('没有数据！');
					}
				}
			});
		})
	</script>
</body>
</html>