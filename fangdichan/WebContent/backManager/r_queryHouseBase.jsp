<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="allHouseBase" lay-filter="test"></table>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#allHouseBase', //指定原始表格元素选择器（推荐id选择器）
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'houseBaseId',
					title : '房屋基本信息编号',
					sort : true,
					hide : true
				}, {
					field : 'pId',
					title : '区级地址',
					hide : true
				}, {
					field : 'detailPosition',
					title : '详细地址'
				}, {
					field : 'maxFloorNum',
					title : '总楼层数',
				}, {
					field : 'constructionArea',
					title : '房屋建筑面积',
				}, {
					field : 'houseLayout',
					title : '房型'
				}, {
					field : 'houseOrientation',
					title : '朝向',
				}, {
					field : 'houseType',
					title : '产权性质',
				}, {
					field : 'decorationDegree',
					title : '装饰程度',
				}, {
					field : 'mortgageStatus',
					title : '抵押状况',
				}, {
					field : 'completionDate',
					title : '竣工日期',
				}, {
					field : 'eastLongitude',
					title : '定位东经',
					hide : true
				}, {
					field : 'northLatitude',
					title : '定位北纬',
					hide : true
				}] ],
				url : 'RootManager', //数据接口
				method : 'post',
				where : {
					'method' : 'QueryAllHouseBase'
				},
				done : function(res, curr, count) {
					if (res.code == 0) {
						console.log(res.data);
					}else if(res.code == 1){
						layer.msg('没有数据！');
					}
				}
			});
			table.on('tool(demo)', function(obj) {
				var data = obj.data;
				if (obj.event == 'detail') {
					layer.msg('ID：' + data.id + ' 的查看操作');
				}
			});
		})
	</script>
</body>
</html>