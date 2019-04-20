<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="queryPurchaseTab" lay-filter="demo"></table>
<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#queryPurchaseTab', //指定原始表格元素选择器（推荐id选择器）
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'purchaseApplicationId',
					title : '买房申请编号',
					sort : true,
				}, {
					field : 'sellInfoId',
					title : '卖房信息编号',
					hide : true,
					sort : true,
				}, {
					field : 'applyDate',
					title : '申请时间',
					sort : true,
				}, {
					field : 'purchaseUserId',
					title : '申请用户id',
					hide : true,
					sort : true,
				}, {
					field : 'contactInfoId',
					title : '联系人信息编号',
				}, {
					field : 'purchaseRemarks',
					title : '申请备注',
				}] ],
				url : 'RootManager', //数据接口
				method : 'post',
				where : {
					'method' : 'QueryPurchase',
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