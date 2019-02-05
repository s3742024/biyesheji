<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./source/layui/css/layui.css">
<script src="./source/layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="./source/css/myStyle.css" />
<style>
@media screen and (max-width: 992px) {
	.layui-container {
		width: auto;
	}
}

.layui-container {
	padding: 0;
}

.logo {
	height: 50px;
	width: 100%;
}

.position {
	height: 50px;
	line-height: 50px;
	background-color: #eee;
}

.position-choose {
	background-color: #ddd;
}

.welcome {
	background-image: url("./source/images/welcome.png");
	height: 80px;
}

.nav {
	background-color: #62AB00;
}

.nav li {
	width: 150px;
}

.nav a {
	font-size: 1.2rem;
	text-align: center;
}
/* 首页 */
.quick {
	padding: 20px 30px;
}

.quick-info {
	font-size: 3.0rem;
	color: orange;
}

.quick-search {
	display: flex;
}

.quick-search>* {
	height: 50px;
}

.quick-search button {
	flex-basis: 80px
}

.quick-price, .quick-area {
	height: 80px;
	background-color: #b99
}
/* userStatus */
.user-status{height: 400px;padding: 20px;background-color: #eee;opacity: 0.5}
</style>
</head>
<body>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md2">
				<img alt="logo" src="./source/images/logo.png" class="logo">
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
			<div class="welcome"></div>
		</div>
		<div class="layui-row">
			<ul class="layui-nav nav">
				<li class="layui-nav-item layui-this"><a href="">首页</a></li>
				<li class="layui-nav-item "><a href="">最新内容</a></li>
				<li class="layui-nav-item"><a href="">房价</a></li>
				<li class="layui-nav-item"><a href="">买房</a></li>
				<li class="layui-nav-item"><a href="">卖房</a></li>
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