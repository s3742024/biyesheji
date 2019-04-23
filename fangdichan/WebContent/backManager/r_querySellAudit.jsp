<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="querySellAuditTab" lay-filter="demo"></table>
<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#querySellAuditTab', //指定原始表格元素选择器（推荐id选择器）
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'sellAuditId',
					title : '审核信息编号',
					hide : true,
					sort : true,
				}, {
					field : 'sellInfoId',
					title : '卖房信息编号',
					hide : true,
					sort : true,
				}, {
					field : 'auditDate',
					title : '审核时间',
					sort : true,
				}, {
					field : 'auditStatus',
					title : '审核状态',
					sort : true,
				}, {
					field : 'auditorRemark',
					title : '备注',
				}] ],
				url : 'RootManager', //数据接口
				method : 'post',
				where : {
					'method' : 'querySellAudit',
					'auditorId':'<%=session.getAttribute("managerId")%>'
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