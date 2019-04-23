<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="QueryAllToBeAudited" lay-filter="demo"></table>
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="audit">审核</a>
</script>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#QueryAllToBeAudited', //指定原始表格元素选择器（推荐id选择器）
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'sellInfoId',
					title : '卖房信息编号',
					hide : true,
					sort : true,
				}, {
					field : 'houseBaseId',
					title : '房屋基本信息编号',
					hide : true
				}, {
					field : 'sellTitle',
					title : '卖房标题'
				}, {
					field : 'sellDate',
					title : '发布时间',
					sort : true,
				}, {
					field : 'sellUserId',
					title : '卖房用户编号',
					sort : true,
				}, {
					field : 'sellPrice',
					title : '房价',
					sort : true,
				}, {
					field : 'sellPoint',
					title : '核心卖点',
				}, {
					field : 'sellMentality',
					title : '业主心态',
				}, {
					field : 'contactInfoId',
					title : '联系人信息编号',
					hide : true,
					sort : true,
				}, {
					field : 'audit',
					toolbar : '#barDemo',
				} ] ],
				url : 'RootManager', //数据接口
				method : 'post',
				where : {
					'method' : 'QueryAllToBeAudited'
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
				console.log(data)
				if (obj.event === 'audit') {
					//layer.msg('ID：' + data.sellInfoId + ' 的查看操作');
					audit(obj)
				}
			})
		})
		function audit(obj) {
			layer.confirm('纳尼？', {
				btn : [ '通过', '失败', '取消' ],
				content : '<textarea placeholder=\"请输入内容\" class=\"layui-textarea\" id=\"remark\"></textarea>'
			//可以无限个按钮
			}, function(index, layero) {
				//按钮【按钮一】的回调
				//console.log("1",$('#remark').val(),data.sellInfoId)
				sendAuditInfo(obj, 1);
				layer.close(index);
			}, function(index) {
				//按钮【按钮二】的回调
				sendAuditInfo(obj, 2);
				console.log("2")
			}, function(index) {
				//按钮【按钮三】的回调
				console.log("3")
			});
		}
		function sendAuditInfo(obj, status) {
			$.ajax({
				type : "post",
				url : "RootManager",
				data : {
					"method" : "audit",
					"auditorRemark" : $('#remark').val(),
					"sellInfoId" : obj.data.sellInfoId,
					"auditStatus" : status,
					"auditorId" : "1001"
				}
			}).success(function(message) {
				message = $.parseJSON(message);
				layer.msg(message.message);
				if (message.code == "0") {
					obj.del();
				}
			}).fail(function(err) {
				alert("未知错误")
			})
		}
	</script>
</body>
</html>