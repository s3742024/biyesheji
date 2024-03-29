<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <h2>${sellInfo.getSellTitle()}</h2> --%>
	<form class="layui-form" id="houseInfoSubmit">
		<div class="layui-form-item">
			<label class="layui-form-label">选择地区</label>
			<div class="layui-input-inline">
				<select name="provinceSelect">
					<option value="">请选择省</option>
					<option value="江苏省" selected="selected">江苏省</option>
					<option value="浙江">浙江省</option>
					<option value="江西">江西省</option>
					<option value="福建">福建省</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<select name="citySelect">
					<option value="">请选择市</option>
					<option value="杭州">杭州</option>
					<option value="宁波">宁波</option>
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
				<input type="text" name="detailPosition" lay-verify="title" autocomplete="off" placeholder="（例如：幸福小区200号301室）" class="layui-input" value="${sellInfo.houseBase.getDetailPosition()}">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">最高楼层</label>
				<div class="layui-input-inline">
					<input type="text" name="maxFloorNum" lay-verify="required" autocomplete="off" placeholder="（例如：8）" class="layui-input" value="${sellInfo.houseBase.getMaxFloorNum()}">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">建筑面积</label>
				<div class="layui-input-inline">
					<input type="tel" name="constructionArea" lay-verify="required" autocomplete="off" placeholder="单位为平方米（例如：90）" class="layui-input" value="${sellInfo.houseBase.getConstructionArea()}">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">户型</label>
				<div class="layui-input-inline">
					<input type="text" name="houseLayout" lay-verify="email" autocomplete="off" placeholder="（例如：两室一厅）" class="layui-input" value="${sellInfo.houseBase.getHouseLayout()}">
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
						<option value="8">西北</option>
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
					<input type="text" class="layui-input" id="completionDate" placeholder="（请选择）" name="completionDate" value="${sellInfo.houseBase.getCompletionDate()}">
				</div>
			</div>
		</div>
		<div class="layui-form-item" id="setMapPoint">
			<div class="layui-inline" style="vertical-align: top">
				<label class="layui-form-label">地图定位</label>
				<div class="layui-input-inline">
					<input type="tel" name="mapPoint1" lay-verify="required|phone" autocomplete="off" readOnly="true" class="layui-input" id="mapPointTxt1" value="${sellInfo.houseBase.getEastLongitude()}"> 
					<input type="tel" name="mapPoint2" lay-verify="required|phone" autocomplete="off" readOnly="true" class="layui-input" id="mapPointTxt2" value="${sellInfo.houseBase.getNorthLatitude()}">
				</div>
			</div>
			<iframe src="baiduMap.html" width="450" height="400" scrolling="no" style="float:right"></iframe>
		</div>
		<!-- 		介绍信息 -->
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="sellTitle" autocomplete="off" placeholder="（例如：市中心黄金地段，欲购从速！）" class="layui-input" value="${sellInfo.getSellTitle()}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">房价</label>
			<div class="layui-input-block">
				<input type="text" name="sellPrice" autocomplete="off" placeholder="单位为人民币万（例如：145）" class="layui-input" value="${sellInfo.getSellPrice()}">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">核心卖点</label>
			<div class="layui-input-block">
				<textarea name="sellPoint" placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">业主心态</label>
			<div class="layui-input-block">
				<textarea name="sellMentality" placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>
		<span id="sellInfoId" style="display: none;"></span>
		<!-- 					提交 -->
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" id="houseInfoBtn">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
	//更新lay表格
	layui.use('form', function(){
				var form = layui.form; 
        form.render();
		});
	$(document).ready(function(){
		changeSelect("houseOrientation","${sellInfo.houseBase.getHouseOrientation()}");
		changeSelect("decorationDegree","${sellInfo.houseBase.getHouseOrientation()}");
		changeSelect("houseType","${sellInfo.houseBase.getHouseType()}");
		changeSelect("mortgageStatus","${sellInfo.houseBase.getMortgageStatus()}");
		$("textarea[name='sellPoint']").val("${sellInfo.getSellPoint()}");
		$("textarea[name='sellMentality']").val("${sellInfo.getSellMentality()}");
		$("#sellInfoId").text("${sellInfo.getSellInfoId()}")
	})
	function changeSelect(selectid,value){
	    var selobj=$("select[name="+selectid+"]").find("option[value="+value+"]");   
	    selobj.attr("selected","selected");
	}
	$('#houseInfoSubmit').on('submit', function() {
		BaseInfoSubmit();
		event.preventDefault(); //阻止默认事件
	})
	function BaseInfoSubmit(){
		var args = {
				"method" : "editHouseInfo",
				"sellInfoId" : $("#sellInfoId").text(),
				"sellTitle" : $("input[name='sellTitle']").val(),
				"sellPrice" : $("input[name='sellPrice']").val(),
				"sellPoint" : $("textarea[name='sellPoint']").val(),
				"sellMentality" : $("textarea[name='sellMentality']").val(),	
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
				if(message=="更改成功"){
					$("#userEidtMain").load("c_editSellInfo.jsp");
				}
			});
		}).fail(function(err) {
			console.log(err);
			alert("未知错误");
		})
	}
	</script>
</body>
</html>