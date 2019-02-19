<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="layui-form" id="houseBaseInfoSubmit">
		<div class="layui-form-item">
			<label class="layui-form-label">选择地区</label>
			<div class="layui-input-inline">
				<select name="provinceSelect">
					<option value="">请选择省</option>
					<option value="浙江" selected="">浙江省</option>
					<option value="你的工号">江西省</option>
					<option value="你最喜欢的老师">福建省</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<select name="citySelect">
					<option value="">请选择市</option>
					<option value="杭州">杭州</option>
					<option value="宁波" disabled="">宁波</option>
					<option value="温州">温州</option>
					<option value="温州">台州</option>
					<option value="温州">绍兴</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<select name="areaSelect">
					<option value="">请选择县/区</option>
					<option value="西湖区">西湖区</option>
					<option value="余杭区">余杭区</option>
					<option value="拱墅区">临安市</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">具体地址</label>
			<div class="layui-input-block">
				<input type="text" name="detailPosition" lay-verify="title" autocomplete="off" placeholder="（例如：幸福小区200号301室）" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">最高楼层</label>
				<div class="layui-input-inline">
					<input type="text" name="maxFloorNum" lay-verify="required" autocomplete="off" placeholder="（例如：8）" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">建筑面积</label>
				<div class="layui-input-inline">
					<input type="tel" name="constructionArea" lay-verify="required" autocomplete="off" placeholder="（例如：90）" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">户型</label>
				<div class="layui-input-inline">
					<input type="text" name="houseLayout" lay-verify="email" autocomplete="off" placeholder="（例如：两室一厅）" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">朝向</label>
				<div class="layui-input-inline">
					<select name="houseOrientation" lay-verify="required">
						<option value="">（请选择）</option>
						<option value="1">东</option>
						<option value="2">南</option>
						<option value="3">西</option>
						<option value="4">北</option>
						<option value="5">东南</option>
						<option value="6">东北</option>
						<option value="7">西南</option>
						<option value="8">西南</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">装修程度</label>
				<div class="layui-input-inline">
					<select name="decorationDegree" lay-verify="required">
						<option value="">（请选择）</option>
						<option value="1">毛坯</option>
						<option value="2">简装修</option>
						<option value="3">精装修</option>
						<option value="4">豪华装修</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">房屋类型</label>
				<div class="layui-input-inline">
					<select name="houseType" lay-verify="required">
						<option value="">（请选择）</option>
						<option value="1">公寓</option>
						<option value="2">普通住宅</option>
						<option value="3">别墅</option>
						<option value="4">平房</option>
						<option value="5">其他</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">抵押状况</label>
				<div class="layui-input-inline">
					<select name="mortgageStatus" lay-verify="required">
						<option value="">（请选择）</option>
						<option value="1">有</option>
						<option value="2">无</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">竣工时间</label>
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="completionDate" placeholder="（请选择）" name="completionDate">
				</div>
			</div>
		</div>
		<div class="layui-form-item" id="setMapPoint">
			<div class="layui-inline">
				<label class="layui-form-label">地图定位</label>
				<div class="layui-input-inline">
					<input type="tel" name="mapPoint1" lay-verify="required|phone" autocomplete="off" readOnly="true" class="layui-input" id="mapPointTxt1">
					<input type="tel" name="mapPoint2" lay-verify="required|phone" autocomplete="off" readOnly="true" class="layui-input" id="mapPointTxt2">
				</div>
			</div>
			<iframe src="baiduMap.html" width="500" height="400" scrolling="no"></iframe>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#completionDate',
				type : 'month',
			});
		});
		function showInfo(e){
			$("#mapPointTxt1").val(e.point.lng);
			$("#mapPointTxt2").val(e.point.lat);
		}
		$('#houseBaseInfoSubmit').on('submit', function() {
			BaseInfoSubmit();
			event.preventDefault(); //阻止默认事件
		})
		function BaseInfoSubmit(){
			var args = {
					"method" : "baseInfo",
					//"areaSelect" : $("select[name='areaSelect']").val(),
					"pId" : "1",
					"detailPosition" : $("input[name='detailPosition']").val(),
					"maxFloorNum" : $("input[name='maxFloorNum']").val(),
					"constructionArea" : $("input[name='constructionArea']").val(),
					"houseLayout" : $("input[name='houseLayout']").val(),
					"houseOrientation" : $("select[name='houseOrientation']").val(),
					"decorationDegree" : $("select[name='decorationDegree']").val(),
					"propertyRight" : $("select[name='houseType']").val(),
					"mortgageStatus" : $("select[name='mortgageStatus']").val(),
					"completionDate" : $("input[name='completionDate']").val(),
					"eastLongitude" : $("input[name='mapPoint1']").val(),
					"northLatitude" : $("input[name='mapPoint2']").val(),
					"nickname": "<%=session.getAttribute("userNickname")%>",
			};
		$.ajax({
				type : "post",
				url : "SellServlet",
				data : args,
			}).success(function(message) {
				let msg = "${sessionScope.msg}";
				//添加提示
				layui.use('layer', function() {
					var layer = layui.layer;
					layer.msg(message);
				});
			}).fail(function(err) {
				console.log(err);
				alert("未知错误");
			})
		}
	</script>
</body>
</html>