<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>房地产交易网</title>
<style>

.user-manager {
	width: 100%;
	display: flex;
	justify-content: space-evenly;
	margin-bottom: 200px;
}
.user-manager>fieldset{
	width: 100%;
}

.font-big {
	font-size: 1.2rem;
/* 	text-align: center; */
}
</style>
</head>
<body>

	<!-- 	主要区域 -->
	<div class="layui-container layui-row">
		<div class="layui-col-md3" style="background-color: #393d49; min-height: 1200px">
			<ul class="layui-nav layui-nav-tree" lay-filter="test" id="userManager">
				<li class="layui-nav-item"><a href="javascript:void(0)" id="editNickname">修改头像昵称</a></li>
				<li class="layui-nav-item"><a href="javascript:void(0)" id="editPwd">修改登录密码</a></li>
				<li class="layui-nav-item"><a href="javascript:void(0)" id="editMsg">修改绑定信息</a></li>
				<li class="layui-nav-item"><a href="javascript:void(0)" id="personalData">完善个人资料</a></li>
				<li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);">卖房相关</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:void(0);" id="editSellInfo">修改卖房信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryPending">查看审核情况</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryRequest">查看买房请求信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="querySelled">查看已卖出房屋信息</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);">买房相关</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:void(0);" id="queryBugLog">查看申请买房记录</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryBuyInfo">查看已购房信息</a>
						</dd>
					</dl></li>
			</ul>
		</div>
		<div class="layui-col-md9" style="min-height: 1200px;background-color: #efefef;border:4px ridge #f0fbeb;">
			<div class="layui-row sell-main">
				<c:if test="${empty sessionScope.userNickname}">
						请先登录
				</c:if>
				<c:if test="${not empty sessionScope.userNickname}">
					<div id="userEidtMain">
						<c:import url="c_editNickname.jsp" charEncoding="utf-8"></c:import>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 	尾部部分 -->

	<script>
		$("#userManager").click(function(e) {
			var url = e.target.id;
			if (url) {
				$("#userEidtMain").load("c_" + url + ".jsp");
			}
		})
	</script>
</body>
</html>