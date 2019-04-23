<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="PersonalData" lay-filter="test"></table>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#PersonalData', //指定原始表格元素选择器（推荐id选择器）
				height : 315, //容器高度
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'realInfoId',
					title : '用户真实信息编号',
					sort : true
				}, {
					field : 'realInfoName',
					title : '真实姓名',
				}, {
					field : 'idCardNum',
					title : '身份证号'
				}, {
					field : 'occupation',
					title : '职业',
				}] ],
				url : 'RootManager', //数据接口
				method : 'post',
				where : {
					'method' : 'queryPersonalData'
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