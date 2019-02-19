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
							+this.houseBase.detailPosition+"</td><td><button data-id=\""
							+this.houseBaseId+"\" class=\"layui-btn\">修改资料</button></td><td><button data-id=\""
							+this.houseBaseId+"\" class=\"layui-btn\">提交图片</button></td></tr>")
				})
			}
		}).fail(function(err) {
			console.log(err);
			alert("未知错误");
		})
	})
</script>
</body>
</html>