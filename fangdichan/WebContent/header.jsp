<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</style>
</head>
<body>

		<div class="layui-row">
			<div class="layui-col-md2">
				<img alt="logo" src="${pageContext.request.contextPath}/source/images/logo.png" class="logo">
				<span>房地产交易网</span>
			</div>
			<div class="layui-col-md10 layui-col-md-offset">
				<div class="layui-collapse position">
					<div class="layui-colla-item">
						<h2 class="layui-colla-title position">无锡</h2>
						<div class="layui-colla-content position-choose">选择省市区</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="welcome" style="background-image: url('${pageContext.request.contextPath}/source/images/welcome.png');"></div>
		</div>
		<div class="layui-row">
			<ul class="layui-nav nav" id="navUrl">
				<li class="layui-nav-item layui-this"><a href="index.jsp">首页</a></li>
				<li class="layui-nav-item "><a href="javascript:void(0)">最新内容</a></li>
				<li class="layui-nav-item"><a href="javascript:void(0)">房价</a></li>
				<li class="layui-nav-item"><a href="javascript:void(0)" id="buy">买房</a></li>
				<li class="layui-nav-item"><a href="javascript:void(0)" id="sell">卖房</a></li>
				<li class="layui-nav-item"><a href="javascript:void(0)">问答</a></li>
			</ul>

		</div>


	<script type="text/javascript">
	$("#navUrl").click(function(e) {
		var url = e.target.id;
		if(url=="buy"){
			$("#mainArea").load(url + ".jsp",{"searchStr":null});
		}else if (url) {
			$("#mainArea").load(url + ".jsp");
		}
	})
		//注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;
			//…
		});
	</script>
</body>
</html>