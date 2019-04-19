<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="QueryAudited" lay-filter="demo"></table>

	<script type="text/javascript">
	layui.use('table', function() {
		var table = layui.table;
		table.render({
			elem : '#QueryAudited', //指定原始表格元素选择器（推荐id选择器）
			height : 800, //容器高度
			toolbar : true,
			page : true,
			cols : [ [ 
				{
					field : 'sellInfoId',
					title : '房屋基本信息编号',
					sort : true,
					hide : true
				}, {
					field : 'auditDate',
					title : '审核时间',
					sort : true,
				}, {
					field : 'auditStatus',
					title : '审核结果',
					sort : true,
				}, {
					field : 'auditorRemark',
					title : '管理员备注',
				}, {
					field : 'houseBaseId',
					title : '房屋基本信息编号',
					templet:'<div>{{d.sellInfo.houseBaseId}}</div>',
					sort : true,
				}, {
					field : 'sellTitle',
					title : '标题',
					templet:'<div>{{d.sellInfo.sellTitle}}</div>'
				}, {
					field : 'sellPrice',
					title : '卖房价格',
					templet:'<div>{{d.sellInfo.sellPrice}}</div>'
				}, {
					field : 'sellPoint',
					title : '核心卖点',
					templet:'<div>{{d.sellInfo.sellPoint}}</div>'
				}, {
					field : 'sellMentality',
					title : '业主心态',
					templet:'<div>{{d.sellInfo.sellMentality}}</div>'
				}
			] ],
			url : 'userManager', //数据接口
			method : 'post',
			where : {
				'method' : 'queryAudited',
				'nickname':"<%=session.getAttribute("userNickname")%>"
			},
			done : function(res, curr, count) {
				if (res.code == 0) {
					console.log(res.data);
				}
			}
		});

	})
		
	</script>
</body>
</html>