<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>
</head>
<body>
	<%=request.getParameter("sellInfoId")%>
	<div>
		<p class="buy-text-title">{{ item.sellTitle }}
		<p>
		<p class="buy-text-info">
			<span class="buy-text-price">{{item.sellPrice}}万</span> <i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.constructionArea }}</span>cm<sup>2</sup> <i class="layui-icon">&#xe623;</i><span>{{
				item.houseBase.houseLayout }}</span>
		<p>
	</div>
	<div class="layui-row" style="overflow: hidden;">
		<div class="layui-col-md9">

			<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				<ul class="layui-tab-title">
					<li class="layui-this">网站设置</li>
					<li>用户管理</li>
					<li>权限分配</li>
					<li>商品管理</li>
				</ul>
				<div class="layui-tab-content buy-all-img" style="float: none">
					<div class="layui-tab-item layui-show">
						<div class="layui-carousel" id="buy-img-1">
							<div carousel-item style="text-align: center">
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/hj/ae14250ba1ab179d163aeb5f579da09c/240x180c.jpg?t=1" class="buy-img-show">
								</div>
								<div>条目2</div>
								<div>条目3</div>
								<div>条目4</div>
								<div>条目5</div>
							</div>
						</div>
					</div>
					<div class="layui-tab-item">内容2</div>
					<div class="layui-tab-item">内容3</div>
					<div class="layui-tab-item">内容4</div>
				</div>
			</div>
			<div class="layui-row" id="buy-houseInfo-desc">
				<p class="buy-text-title">房屋信息</p>
				<hr class="layui-bg-green">
				<div class="layui-col-md6">
					<p>
						<span>详细地址：</span><span>1</span>
					</p>
					<p>
						<span>最高楼层：</span><span>1</span>
					</p>
					<p>
						<span>基本户型：</span><span>1</span>
					</p>
					<p>
						<span>房屋朝向：</span><span>1</span>
					</p>
					<p>
						<span>装修程度：</span><span>1</span>
					</p>
					<p>
						<span>房屋类型：</span><span>1</span>
					</p>
				</div>
				<div class="layui-col-md6">
					<p>
						<span>抵押状况：</span><span>1</span>
					</p>
					<p>
						<span>竣工时间：</span><span>1</span>
					</p>
					<p>
						<span>卖出时间：</span><span>1</span>
					</p>
					<p>
						<span>房屋编号：</span><span>1</span>
					</p>
					<p>
						<span>审核状态：</span><span>1</span>
					</p>
				</div>
			</div>
		</div>


		<div class="layui-col-md3">联系人</div>
	</div>
	<div>
		<p class="buy-text-title">核心卖点</p>
				<hr class="layui-bg-green">
				<p>1</p>
				<p class="buy-text-title">业主心态</p>
				<hr class="layui-bg-green">
				<p>1</p>
	</div>
	<div>
		<p class="buy-text-title">地图展示</p>
	</div>
	<div>
		<p class="buy-text-title">相关推荐</p>
	</div>
	<script type="text/html">
		
	</script>
	
	<script>
	$.ajax({
		type : "post",
		url : "SellServlet",
		data : {"method":"showHouseInfo","sellInfoId":"<%=request.getParameter("sellInfoId")%>"}
	}).success(function(message) {
		//更新要显示的地方
		var message=JSON.parse(message)
		console.log(message);
		//render(message.data);
	}).fail(function(err) {
		console.log(err);
		alert("未知错误");
	})
	function render(data){
		var decorationDegree=['毛坯','简装修','精装修','豪华装修'];
		var houseType=['公寓','普通住宅','别墅','平房','其他'];
		for(var i of data){
			i.houseBase.decorationDegree=decorationDegree[i.houseBase.decorationDegree];
			i.houseBase.houseType=houseType[i.houseBase.houseType];
		}
		var getTpl = dt.innerHTML;
		var view = document.getElementById('buy-main');
		layui.use('laytpl', function(){
			  var laytpl = layui.laytpl;
			  laytpl(getTpl).render(data, function(html){
				  view.innerHTML += html;
				}); 
		})
	}
	layui.use('carousel', function() {
		var carousel = layui.carousel;
		//建造实例
		carousel.render({
			elem : '#buy-img-1',
			width : '100%',
			height:'350px',
			arrow : 'always'
		});
	});
</script>
</body>
</html>