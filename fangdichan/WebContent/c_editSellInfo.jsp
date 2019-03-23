<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
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
$(document).ready(function checkRealInfo() {
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
				$("#userEidtMain").load("a_houseImage.jsp");
			})
		}).fail(function(err) {
			console.log(err);
			alert("未知错误");
		})
	})
	
</script>
</body>
</html>