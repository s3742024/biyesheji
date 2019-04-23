<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
  console.log()
  layui.use('element', function () {
    var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

    //监听导航点击
    element.on('nav(demo)', function (elem) {
      //console.log(elem)
      layer.msg(elem.text());
    });
  });
</script>

<body>
	<div class="layui-card buy-search">
		<div class="layui-card-body">
			<span class="layui-breadcrumb"> <span>区域:</span> <a href="javascript:void(0)">全部</a> <a href="javascript:void(0)">新吴</a> <a href="javascript:void(0)">滨湖</a> <a href="javascript:void(0)">梁溪</a>
				<a href="javascript:void(0)">惠山</a> <a href="javascript:void(0)">锡山</a> <a href="javascript:void(0)">无锡周边</a>
			</span>
			<hr class="layui-bg-green">

			<span class="layui-breadcrumb"> <span>售价:</span> <a href="javascript:getPrice(0)">全部</a> <a href="javascript:getPrice(1)">50万以下</a> <a href="javascript:getPrice(2)">50-60万</a> <a
				href="javascript:getPrice(3)">60-80万</a> <a href="javascript:getPrice(4)">80-100万</a><a href="javascript:getPrice(5)">100-120万</a> <a href="javascript:getPrice(6)">120-150万</a> <a
				href="javascript:getPrice(7)">150-200万</a> <a href="javascript:getPrice(8)">200-300万</a> <a href="javascript:getPrice(9)">300-500万</a> <a href="javascript:getPrice(10)">500万以上</a>
				<div class="layui-inline" style="vertical-align: baseline; margin-left: 10px;">
					<input type="text" name="price_min" placeholder="万元" autocomplete="off" style="width: 50px"><em>-</em> <input type="text" name="price_max" placeholder="万元" autocomplete="off"
						style="width: 50px">
					<button class="layui-btn layui-btn-xs" onclick="getPrice(11)">确定</button>
				</div>
			</span>
			<hr class="layui-bg-green">

			<span class="layui-breadcrumb"> <span>房型:</span> <a href="javascript:getArea(0)">全部</a> <a href="javascript:getArea(1)">50m<sup>2</sup>以下
			</a> <a href="javascript:getArea(2)">50-70m<sup>2</sup></a> <a href="javascript:getArea(3)">70-90m<sup>2</sup></a> <a href="javascript:getArea(4)">90-120m<sup>2</sup></a> <a
				href="javascript:getArea(5)">120-150m<sup>2</sup></a> <a href="javascript:getArea(6)">150-200m<sup>2</sup></a> <a href="javascript:getArea(7)">200-300m<sup>2</sup></a> <a
				href="javascript:getArea(8)">300m<sup>2</sup>以上
			</a>
				<div class="layui-inline" style="vertical-align: baseline; margin-left: 10px;">
					<input type="text" name="area_min" placeholder="平方米" autocomplete="off" style="width: 50px"><em>-</em> <input type="text" name="area_max" placeholder="平方米" autocomplete="off"
						style="width: 50px">
					<button class="layui-btn layui-btn-xs" onclick="getArea(9)">确定</button>
				</div>
			</span>
			<hr class="layui-bg-green">

			<span class="layui-breadcrumb"> <span>房型:</span> <a href="javascript:void(0)">全部</a> <a href="javascript:void(0)">一室</a> <a href="javascript:void(0)">二室</a> <a href="javascript:void(0)">三室</a>
				<a href="javascript:void(0)">四室</a> <a href="javascript:void(0)">五室</a> <a href="javascript:void(0)">五室以上</a>
			</span>
		</div>
	</div>
	<div id="buy-main"></div>
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
			<div class="layui-card buy-box" onclick=getDetail('{{item.sellInfoId}}')>
				<div class="layui-card-body layui-row " style="height:200px">
					<div class="layui-col-md3">
							<img alt="showImage" src="ShowImageServlet?url={{item.imgUrl}}" style="max-height:180px;width:auto">
					</div>
					<div class="layui-col-md7 buy-item-text">
			 			<p class="buy-text-title">{{ item.sellTitle }}<p>
			 			<p class="buy-text-info">
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.houseLayout }}</span>
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.constructionArea }}</span>m<sup>2</sup>
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.decorationDegree }}</span>
							<i class="layui-icon">&#xe623;</i><span>{{ item.houseBase.houseType }}</span><p>
			 			<p class="buy-text-position">{{ item.houseBase.detailPosition }}</p>
					</div>
					<div class="layui-col-md2">
			  		<p class=" buy-text-price">{{item.sellPrice}}万</p>
						<p>{{Math.round(item.sellPrice*10000/item.houseBase.constructionArea)}}元/m<sup>2</sup></p>
					</div>
				</div>
			</div>
		{{#  }); }}
		
	</script>
	<script type="text/javascript">
		var minPrice=0;
		var maxPrice=9999;
		var minArea=0;
		var maxArea=9999;
    var page = 1;
    var num = 5;
    function render(data) {
      var decorationDegree = ['毛坯', '简装修', '精装修', '豪华装修'];
      var houseType = ['公寓', '普通住宅', '别墅', '平房', '其他'];
      if(!data){
    	  layer.msg('没有查询到'); 
    	  return;
      }
      for (var i of data) {
        i.houseBase.decorationDegree = decorationDegree[i.houseBase.decorationDegree - 1];
        i.houseBase.houseType = houseType[i.houseBase.houseType - 1];
        i.imgUrl="e0733154a4dc4b87856c8c0ab1549ce3.jpg"
      }
      
      var getTpl = dt.innerHTML;
      var view = document.getElementById('buy-main');
      /* layui.use('laytpl', function () {
        var laytpl = layui.laytpl;
        laytpl(getTpl).render(data, function (html) {
          view.innerHTML += html;
        });
      }) */
      //console.log(data)
			renderImg(data);

    }
    function renderImg(Data){
    	for(var i of Data){
    		var url=null;
   	       $.ajax({
   	           type: "post",
   	           url: "BuyServlet",
   	        async:false,
   	           data: { "method": "QueryHouseImage", 
   	           	"houseBaseId": i.houseBase.houseBaseId, 
   	           },
   	         }).success(function (message) {
   	        	 var message=JSON.parse(message)
   	           if(message.code=="0"){
   	        	   console.log(message);
   	        			console.log("kaishi",i.imgUrl)
   	        			i.imgUrl=message.data.imageUrl;
   	        			console.log("jieshu",i.imgUrl)
   	           }
   	         }).fail(function (err) {
   	           console.log(err);
   	           alert("未知错误");
   	         })
    	}
    	var view = document.getElementById('buy-main');
    	var getTpl = dt.innerHTML;
    	
    	layui.use('laytpl', function () {
          var laytpl = layui.laytpl;
          laytpl(getTpl).render(Data, function (html) {
        	  console.log(Data)
            view.innerHTML += html;
          });
      })
    	
    	
    }
    function getInfo() {
    	console.log(minPrice,maxPrice,minArea,maxArea,page,num)
      $.ajax({
        type: "post",
        url: "BuyServlet",
        data: { "method": "default", 
        	"page": page, 
        	"num": num ,
        	"minPrice":minPrice,
        	"maxPrice":maxPrice,
        	"minArea":minArea,
        	"maxArea":maxArea
        },
      }).success(function (message) {
        //更新要显示的地方
        var message = JSON.parse(message)
        //console.log(message.data);
        render(message.data);
      }).fail(function (err) {
        console.log(err);
        alert("未知错误");
      })
    }
    
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
    function getDetail(sellInfoId) {
      $('#mainArea').load("a_buyDetail.jsp", { "sellInfoId": sellInfoId })
    }
    function getPrice(mode) {
     	switch(mode){
     		case 0:{minPrice=0;maxPrice=9999} break; 
     		case 1:{minPrice=0;maxPrice=50} break; 
     		case 2:{minPrice=50;maxPrice=60} break; 
     		case 3:{minPrice=60;maxPrice=80} break; 
     		case 4:{minPrice=80;maxPrice=100} break; 
     		case 5:{minPrice=100;maxPrice=120} break; 
     		case 6:{minPrice=120;maxPrice=150} break; 
     		case 7:{minPrice=150;maxPrice=200} break; 
     		case 8:{minPrice=200;maxPrice=300} break; 
     		case 9:{minPrice=300;maxPrice=500} break; 
     		case 10:{minPrice=500;maxPrice=9999} break; 
     		case 11:{minPrice=$("input[name='price_min']").val()|0;maxPrice=$("input[name='price_max']").val()|9999}
     	}
     	$("#buy-main").html("");
     	page=1;
      getInfo();
    }
    function getArea(mode) {
	    	switch(mode){
		    	case 0:{minArea=0;maxArea=9999} break;
		    	case 1:{minArea=0;maxArea=50} break;
		    	case 2:{minArea=50;maxArea=70} break;
		    	case 3:{minArea=70;maxArea=80} break;
		    	case 4:{minArea=90;maxArea=120} break;
		    	case 5:{minArea=120;maxArea=150} break;
		    	case 6:{minArea=150;maxArea=200} break;
		    	case 7:{minArea=200;maxArea=300} break;
		    	case 8:{minArea=300;maxArea=999} break;
		    	case 9:{minArea=$("input[name='area_min']").val()|0;maxAre=$("input[name='area_max']").val()|9999}
			 	}
	    	$("#buy-main").html("");
	    	page=1;
	  		getInfo();
     }
    $(document).ready(function(){
    	var searchStr="<%=request.getParameter("searchStr")%>";
    	console.log("searchStr",searchStr);
    	if(searchStr){
    		$.ajax({
	        type: "post",
	        url: "BuyServlet",
	        data: { "method": "QuerySellInfoAlter", 
	        	"scearchStr": searchStr, 
	        },
	      }).success(function (message) {
	        //更新要显示的地方
	        var message = JSON.parse(message)
	        //console.log(message.data);
	        render(message.data);
	      }).fail(function (err) {
	        console.log(err);
	        alert("未知错误");
	      })
    	}else{
    		getInfo();
    	}
    })
    	
  </script>
</body>

</html>