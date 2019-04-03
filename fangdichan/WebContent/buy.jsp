<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="buy-search">
		房屋信息检索
	</div>
	<div id="buy-search">>
		
	</div>
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
		{{#  layui.each(d.list, function(index, item){ }}
			<div class="layui-row buy-box">
			<div class="layui-col-md2">
		  	<img alt="" src="https://pic1.ajkimg.com/display/hj/ae14250ba1ab179d163aeb5f579da09c/240x180c.jpg?t=1" class="buy-img">
			</div>
			<div class="layui-col-md7 buy-item-text">
			 	<p class="buy-text-title">{{ item.title }}<p>
			 	<p class="buy-text-info"><span>{{ item.houseBase.houseLayout }}</span><em>|</em><span>{{ item.houseBase.houseType }}</span><p>
			 	<p class="buy-text-position">{{ item.houseBase.detailPosition }}</p>
			</div>
			<div class="layui-col-md3 buy-text-price">
			  	180万
			</div>
			</div>
		{{#  }); }}
		
	</script>
	<script type="text/javascript">
		var data = { //数据
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
		var getTpl = dt.innerHTML;
		var view = document.getElementById('buy-search');
		layui.use('laytpl', function(){
			  var laytpl = layui.laytpl;
			  laytpl(getTpl).render(data, function(html){
				  view.innerHTML = html;
				});
		})
		
	</script>
</body>
</html>