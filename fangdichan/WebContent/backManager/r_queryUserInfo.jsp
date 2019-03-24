<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="userInfo" lay-filter="test"></table>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#userInfo', //指定原始表格元素选择器（推荐id选择器）
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'userId',
					title : '用户编号',
					sort : true
				}, {
					field : 'userNickname',
					title : '用户昵称',
				}, {
					field : 'userPassword',
					title : '用户密码'
				}, {
					field : 'phoneNum',
					title : '联系电话',
				}, {
					field : 'email',
					title : '邮箱地址',
				}, {
					field : 'realInfoId',
					title : '人员真实信息编号'
				}, {
					field : 'userType',
					title : '用户权限',
					edit : 'text'
				}, {
					field : 'managerRemarks',
					title : '管理员备注',
					edit : 'text'
				} ] ],
				url : 'RootManager', //数据接口
				method : 'post',
				where : {
					'method' : 'queryUserInfo'
				},
				done : function(res, curr, count) {
					if (res.code == 0) {
						console.log(res.data);
					}
				}
			});
			//监听单元格编辑
			table.on('edit(test)', function(obj) {
				data = obj.data //得到所在行所有键值
				$.ajax({
					type : "post",
					url : "RootManager",
					data : {
						"method" : "UpdateUserInfo",
						"userType" : data.userType,
						"managerRemarks" : data.managerRemarks,
						"userId" : data.userId
					},
				}).success(function(message) {
					message=$.parseJSON(message);
					layer.msg(message.message);
				}).fail(function(err) {
					layer.msg("未知错误");
				})
			});
		})
	</script>
</body>
</html>