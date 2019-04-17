<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
console.log()
layui.use('element', function(){
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    //console.log(elem)
	    layer.msg(elem.text());
	  });
	});
</script>
<body>
	<div class="layui-card buy-search">
		<div class="layui-card-body">
			<span class="layui-breadcrumb">
			  <span>区域:</span>
			  <a href="">全部</a>
			  <a href="">新吴</a>
			  <a href="">滨湖</a>
			  <a href="">梁溪</a>
			  <a href="">惠山</a>
			  <a href="">锡山</a>
			  <a href="">无锡周边</a>
			</span>
			<hr class="layui-bg-green">
			
			<span class="layui-breadcrumb">
			  <span >售价:</span>
			  <a href="">全部</a>
			  <a href="">50万以下</a>
			  <a href="">50-60万</a>
			  <a href="">60-80万</a>
			  <a href="">100-120万</a>
			  <a href="">120-150万</a>
			  <a href="">150-200万</a>
			  <a href="">200-300万</a>
			  <a href="">300-500万</a>
			  <a href="">500万以上</a>
			</span>
			<hr class="layui-bg-green">
			
			<span class="layui-breadcrumb">
			  <span >房型:</span>
			  <a href="">全部</a>
			  <a href="">50m<sup>2</sup>以下</a>
			  <a href="">50-60万</a>
			  <a href="">60-80万</a>
			  <a href="">100-120万</a>
			  <a href="">120-150万</a>
			  <a href="">150-200万</a>
			  <a href="">200-300万</a>
			  <a href="">300-500万</a>
			  <a href="">500万以上</a>
			</span>
			<hr class="layui-bg-green">
			
			<span class="layui-breadcrumb">
			  <span>房型:</span>
			  <a href="">全部</a>
			  <a href="">一室</a>
			  <a href="">二室</a>
			  <a href="">三室</a>
			  <a href="">四室</a>
			  <a href="">五室</a>
			  <a href="">五室以上</a>
			</span>
		</div>
	</div>
	<div id="buy-main">
		
	</div>
	<button class="layui-btn layui-btn-fluid buy-more" onclick="moreQuery()">点击加载更多...</button>
	<!-- <div class="layui-row buy-box">
		<div class="layui-col-md2">
      	<img alt="" src="https://pic1.ajkimg.com/display/hj/ae14250ba1ab179d163aeb5f579da09c/240x180c.jpg?t=1" class="buy-img">
    </div>
    <div class="layui-col-md7 buy-item-text">
     	<p class="buy-text-title">千家萬户实拍 溪岸景园 99平150万 毛坯3房 视野开<p>
     	<p class="buy-text-info"><span>好的</span><em>|</em><span>不错</span><p>
     	<p class="buy-text-position">太湖畔山庄园   滨湖-太湖新城-山水东路105号</p>
    </div>
    <div class="layui-col-md3 buy-text-price">
      	180万
    </div>
	</div> -->

	<script id="dt" type="text/html">
		{{#  layui.each(d, function(index, item){ }}
			<div class="layui-row layui-card buy-box" onclick=getDetail('{{item.sellInfoId}}')>
				<div class="layui-card-body">
					<div class="layui-col-md2">
		  			<img alt="" src="https://pic1.ajkimg.com/display/hj/ae14250ba1ab179d163aeb5f579da09c/240x180c.jpg?t=1" class="buy-img">
					</div>
					<div class="layui-col-md7 buy-item-text">
			 			<p class="buy-text-title">{{ item.sellTitle }}<p>
			 			<p class="buy-text-info">
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.houseLayout }}</span>
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.constructionArea }}</span>cm<sup>2</sup>
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.decorationDegree }}</span>
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.houseType }}</span><p>
			 			<p class="buy-text-position">{{ item.houseBase.detailPosition }}</p>
					</div>
					<div class="layui-col-md3 buy-text-price">
			  		{{item.sellPrice}}万
					</div>
				</div>
			</div>
		{{#  }); }}
		
	</script>
	<script type="text/javascript">
	
	var page=1;
	var num=4;
	function render(data){
		console.log(data)
		var decorationDegree=['毛坯','简装修','精装修','豪华装修'];
		var houseType=['公寓','普通住宅','别墅','平房','其他'];
		for(var i of data){
			i.houseBase.decorationDegree=decorationDegree[i.houseBase.decorationDegree-1];
			i.houseBase.houseType=houseType[i.houseBase.houseType-1];
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
	function getInfo(){
		$.ajax({
			type : "post",
			url : "BuyServlet",
			data : {"method":"default","page":page,"num":num},
		}).success(function(message) {
			//更新要显示的地方
			var message=JSON.parse(message)
			//console.log(message.data);
			render(message.data);
		}).fail(function(err) {
			console.log(err);
			alert("未知错误");
		})
	}
	getInfo();
	/*		var data = { //数据
 			"list":[{"title":"千家萬户实拍 溪岸景园 99平150万 毛坯3房 视野开",
				"houseBase":{
					"houseLayout":"layer",
					"houseType":"layer.layui.com",
					"detailPosition":"detailPosition"
				}
			},{"title":"千家萬户实拍 溪岸景园 99平150万 毛坯3房 视野开",
				"houseBase":{
					"houseLayout":"不错",
					"houseType":"好的",
					"detailPosition":"太湖畔山庄园   滨湖-太湖新城-山水东路105号"
				}
			}] 
		}
	*/
		function moreQuery() {
			page++;
			getInfo();
		}
		function getDetail(sellInfoId){
			$('#mainArea').load("a_buyDetail.jsp",{"sellInfoId":sellInfoId})
		}
	</script>
</body>
</html>