<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="editSellInfoTab" lay-filter="demo"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-sm" lay-event="editInfo">修改资料</a>
	<a class="layui-btn layui-btn-sm" lay-event="editImg">添加图片</a>
</script>
<table class="layui-table">
	<colgroup>
		<col>
		<col>
	</colgroup>
	<thead>
		<tr>
			<th>发布时间</th>
			<th>具体地址</th>
			<th>修改资料</th>
			<th>添加图片</th>
		</tr>
	</thead>
	<tbody id="baseInfoTab">
	</tbody>
</table>
<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#editSellInfoTab', //指定原始表格元素选择器（推荐id选择器）
				toolbar : true,
				page : true,
				cols : [ [ //标题栏
				{
					field : 'sellDate',
					title : '发布时间',
					sort : true,
				},{
					field : 'houseBaseId',
					title : '房屋基本信息编号',
					sort : true,
					hide : true,
				},{
					field : 'detailPosition',
					title : '位置',
					templet:'<div>{{d.houseBase.detailPosition}}</div>',
				}, {
					field : 'audit',
					title : '编辑',
					toolbar : '#barDemo',
				}] ],
				url : 'SellServlet', //数据接口
				method : 'post',
				where : {
					'method' : 'getHouseBases',
					"nickname": "<%=session.getAttribute("userNickname")%>"
				},
				done : function(res, curr, count) {
					if (res.code == 0) {
						console.log(res.data);
					}
				}
			});
			table.on('tool(demo)', function(obj) {
				var data = obj.data;
				console.log(data,data.houseBaseId)
				if (obj.event === 'editInfo') {
					$("#userEidtMain").load("SellServlet",{"method":"editHouseInfoPage","sellInfoId":data.sellInfoId});
				}else if(obj.event === 'editImg'){
					$("#userEidtMain").load("a_houseImage.jsp",{"houseBaseId":data.houseBaseId});
				}
			})
})
</script>
<script type="text/javascript">

<%-- $(document).ready(function checkRealInfo() {
	$(this).html(`<i class="layui-icon layui-icon-refresh" id="load"></i>`)
	var args = {
			"method" : "getHouseBases",
			"nickname": "<%=session.getAttribute("userNickname")%>",
		};
		$.ajax({
			type : "post",
			url : "SellServlet",
			data : args,
		}).success(function(message) {
			message = $.parseJSON(message);
			if (message.msg == "true") {
				console.log(message.sellInfos);
				$.each(message.sellInfos,function (i,element) {
					$("#baseInfoTab").append("<tr><td>"+this.sellDate+"</td><td>"
							+this.houseBase.detailPosition+"</td><td><button dataId=\""
							+this.sellInfoId+"\" class=\"layui-btn editInfo\">修改资料</button></td><td><button dataId=\""
							+this.sellInfoId+"\" class=\"layui-btn editImg\">提交图片</button></td></tr>")
				})
			}
			$(".editInfo").click(function(e) { // 在页面任意位置点击而触发此事件
				var id=$(this).attr("dataId");
				$("#userEidtMain").load("SellServlet",{"method":"editHouseInfoPage","sellInfoId":id});
			})
			$(".editImg").click(function(e) { // 在页面任意位置点击而触发此事件
				var id=$(this).attr("dataId");
				console.log(e)
				$("#userEidtMain").load("a_houseImage.jsp",{"houseBaseId":"1111112"});
			})
		}).fail(function(err) {
			console.log(err);
			alert("未知错误");
		})
	}) --%>
	
</script>
</body>
</html>