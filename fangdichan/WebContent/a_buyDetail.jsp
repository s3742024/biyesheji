<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>
</head>
<body>
	<div id="buy-header"></div>
	<div class="layui-row" style="overflow: hidden;">
		<div class="layui-col-md9">

			<div class="layui-tab layui-tab-card" lay-filter="docDemoTabBrief">
				<ul class="layui-tab-title">
					<li class="layui-this">室内图</li>
					<li>户型图</li>
					<li>环境图</li>
					<li>周边地图</li>
				</ul>
				<div class="layui-tab-content buy-all-img" style="float: none">
					<div class="layui-tab-item layui-show">
						<div class="layui-carousel" id="buy-img-1">
							<div carousel-item style="text-align: center">
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/hj/ae14250ba1ab179d163aeb5f579da09c/240x180c.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/anjuke/59f551-%E7%90%86%E6%83%B3%E7%BD%AE%E4%B8%9A/ab8def1cc08413f08e049a79047efb3d-599x450.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/anjuke/ba0af5-%E9%BA%A6%E7%A6%BE%E6%88%BF%E5%9C%B0%E4%BA%A7/61e33afc051a9c5229b5e324ff88aeea-599x450.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/anjuke/9b32ca-%E9%BA%A6%E7%A6%BE%E6%88%BF%E5%9C%B0%E4%BA%A7/5c8ec5e319a9a659a18014812aad1811-599x450.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/anjuke/a9850d-%E9%BA%A6%E7%A6%BE%E6%88%BF%E5%9C%B0%E4%BA%A7/07ae7e8b69be620faf589a81664095ba-599x450.jpg?t=1" class="buy-img-show">
								</div>
							</div>
						</div>
					</div>
					<div class="layui-tab-item">
						<img alt="" src="https://pic1.ajkimg.com/display/anjuke/c44287-%E5%A5%BD%E7%9A%84%E5%AE%B6%E6%88%BF%E4%BA%A7/dd5972254c643ad9ed8a69a8e2e0b0f5-599x450.jpg?t=1" class="buy-img">
					</div>
					<div class="layui-tab-item">
						<div class="layui-carousel" id="buy-img-2">
							<div carousel-item style="text-align: center">
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/hj/085c99012efec94916a0b5d6d2bba58c/600x450.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/hj/1857eaa5fbcef90b580356ff97061c48/600x450.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/hj/5ca5f48d22342dbb94cf9212f03fa0c3/600x450.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/hj/3cd8a5d51a257ad831f2705216d50c7f/600x450.jpg?t=1" class="buy-img-show">
								</div>
								<div>
									<img alt="" src="https://pic1.ajkimg.com/display/hj/676c24322bf4b4f6d10614b007a6351e/600x450.jpg?t=1" class="buy-img-show">
								</div>
							</div>
						</div>
					</div>
					<div class="layui-tab-item">周边地图</div>
				</div>
			</div>
			<div class="layui-row" id="buy-houseInfo-desc"></div>
			<div id="buy-introduce"></div>
			<div>
				<p class="buy-text-title" id="buy-map">地图展示</p>
			</div>
			<div>
				<p class="buy-text-title">相关推荐</p>
			</div>
		</div>


		<div class="layui-col-md3 user-status" id="buy-contact">
			<c:if test="${empty sessionScope.userNickname}">
						登录可进行买房申请
					<%-- <c:import url="userLogin.jsp"></c:import> --%>
			</c:if>
			<c:if test="${not empty sessionScope.userNickname}">
				<c:import url="contact.jsp"></c:import>
			</c:if>
		</div>
	</div>
	<script type="text/html" id="buyHeaderTpl">
			<p class="buy-text-title">{{ d.sellTitle }}
		<p>
		<p class="buy-text-info">
			<span class="buy-text-price">{{d.sellPrice}}万</span> <i class="layui-icon">&#xe623;</i><span>{{ d.houseBase.constructionArea }}</span>m<sup>2</sup> <i class="layui-icon">&#xe623;</i><span>{{
				d.houseBase.houseLayout }}</span>
		<p>
	</script>
	<script type="text/html" id="houseInfoDesc">
						<p class="buy-text-title">房屋信息</p>
				<hr class="layui-bg-green">
				<div class="layui-col-md6">
					<p>
						<span>详细地址：</span><span>{{d.houseBase.detailPosition}}</span>
					</p>
					<p>
						<span>最高楼层：</span><span>{{d.houseBase.maxFloorNum}}</span>
					</p>
					<p>
						<span>房屋朝向：</span><span>{{d.houseBase.houseOrientation}}</span>
					</p>
					<p>
						<span>装修程度：</span><span>{{d.houseBase.decorationDegree}}</span>
					</p>
					<p>
						<span>房屋类型：</span><span>{{d.houseBase.houseType}}</span>
					</p>
				</div>
				<div class="layui-col-md6">
					<p>
						<span>抵押状况：</span><span>{{d.houseBase.mortgageStatus}}</span>
					</p>
					<p>
						<span>竣工时间：</span><span>{{d.houseBase.completionDate}}</span>
					</p>
					<p>
						<span>卖出时间：</span><span>{{d.sellDate}}</span>
					</p>
					<p>
						<span>房屋编号：</span><span>{{d.houseBase.houseBaseId}}</span>
					</p>
					<p>
						<span>审核状态：</span><span>审核通过</span>
					</p>
				</div>
	</script>
	<script type="text/html" id="IntroduceTpl">
	<p class="buy-text-title">核心卖点</p>
	<hr class="layui-bg-green">
	<p>{{d.sellPoint}}</p>
	<p class="buy-text-title">业主心态</p>
	<hr class="layui-bg-green">
	<p>{{d.sellMentality}}</p>
</script>
	<script>
	var eastLongitude=0;
	var northLatitude=0;
	//$('#buy-contact').load("contact.jsp")
	$.ajax({
		type : "post",
		url : "SellServlet",
		data : {"method":"showHouseInfo","sellInfoId":"<%=request.getParameter("sellInfoId")%>"}
		}).success(function(message) {
			//更新要显示的地方
			var message = JSON.parse(message)
			console.log(message.data);
			render(message.data);
		}).fail(function(err) {
			console.log(err);
			alert("未知错误");
		})
		function render(data) {
			eastLongitude = data.houseBase.eastLongitude;
			northLatitude = data.houseBase.northLatitude;
			$('#buy-map').after("<iframe src=\"mapDirection.html\" width=\"100%\" height=\"400\" scrolling=\"no\" ></iframe>");
			var decorationDegree = [ '毛坯', '简装修', '精装修', '豪华装修' ];
			var houseType = [ '公寓', '普通住宅', '别墅', '平房', '其他' ];
			var mortgageStatus = [ '有', '无' ];
			var houseOrientation = [ '东', '南', '西', '北', '东南', '东北', '西南', '西北' ]
			data.houseBase.decorationDegree = decorationDegree[data.houseBase.decorationDegree - 1];
			data.houseBase.houseType = houseType[data.houseBase.houseType - 1];
			data.houseBase.mortgageStatus = mortgageStatus[data.houseBase.mortgageStatus - 1];
			data.houseBase.houseOrientation = houseOrientation[data.houseBase.houseOrientation - 1];
			var buyHeadTpl = buyHeaderTpl.innerHTML;
			var getTpl = houseInfoDesc.innerHTML;
			var buyIntroduceTpl = IntroduceTpl.innerHTML;
			var view1 = document.getElementById('buy-header');
			var view2 = document.getElementById('buy-houseInfo-desc');
			var view3 = document.getElementById('buy-introduce');
			layui.use('laytpl', function() {
				var laytpl = layui.laytpl;
				laytpl(buyHeadTpl).render(data, function(html) {
					view1.innerHTML = html;
				});
				laytpl(getTpl).render(data, function(html) {
					view2.innerHTML = html;
				});
				laytpl(buyIntroduceTpl).render(data, function(html) {
					view3.innerHTML = html;
				});
			})
		}
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#buy-img-1',
				width : '100%',
				height : '350px',
				arrow : 'always',
			});
			carousel.render({
				elem : '#buy-img-2',
				width : '100%',
				height : '350px',
				arrow : 'always',
			});
		});
		layui.use('element', function(){
			  var element = layui.element;
			  //一些事件监听
			  element.on('tab(docDemoTabBrief)', function(data){
				  if(data.index=='3'){
					  document.getElementById('buy-map').scrollIntoView()
				  }
				});
			});
		
	</script>
</body>
</html>