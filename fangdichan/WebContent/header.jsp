<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/source/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="./source/css/myStyle.css" />
<script src="${pageContext.request.contextPath}/source/layui/layui.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/source/js/jquery.js"></script> --%>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<style type="text/css">
.index-news {
	height: 300px
}
</style>
</head>
<body>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md2">
				<img alt="logo" src="${pageContext.request.contextPath}/source/images/logo.png" class="logo">
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
			<div class="welcome" style="background-image: url('${pageContext.request.contextPath}/source/images/welcome.png"');"></div>
		</div>
		<div class="layui-row">
			<ul class="layui-nav nav" style="">
				<li class="layui-nav-item layui-this"><a href="index.jsp">首页</a></li>
				<li class="layui-nav-item "><a href="">最新内容</a></li>
				<li class="layui-nav-item"><a href="">房价</a></li>
				<li class="layui-nav-item"><a href="">买房</a></li>
				<li class="layui-nav-item"><a href="sell.jsp">卖房</a></li>
				<li class="layui-nav-item"><a href="">问答</a></li>
			</ul>

		</div>
	</div>

	<script type="text/javascript">
		//注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;
			//…
		});
	</script>
</body>
</html>