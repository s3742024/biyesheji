<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

		<div class="layui-col-md3" style="background-color: #dee; min-height: 1000px">
			<ul class="layui-nav layui-nav-tree" lay-filter="test" id="rootManager">
			<li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);">用户管理</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:void(0);" id="queryUserInfo">账号信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryPersonalData">用户个人资料</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryContactInfo">联系人信息</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);">卖房审核</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:void(0);" id="queryHouseBase">房屋基本信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryHouseImage">房屋图片信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="auditInfo">审核卖房信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="querySellAudit">已审核记录</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);">交易管理</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:void(0);" id="queryPurchaseData">查看申请买房记录</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryTransactionInfo">查看已交易信息</a>
						</dd>
					</dl></li>
					<li class="layui-nav-item layui-nav-itemed"><a href="javascript:void(0);">网站管理</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:void(0);" id="queryWebInfo">查看网站信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="addWebInfo">添加网站信息</a>
						</dd>
						<dd>
							<a href="javascript:void(0);" id="queryLoginLog">查看登录日志</a>
						</dd>
					</dl></li>
			</ul>
		</div>
		<div class="layui-col-md9 index-main" style="background-color: #eca;min-height: 1000px" id="rootEidtMain">
			
		</div>
	<script>
		$("#rootManager").click(function(e) {
			var url = e.target.id;
			if (url) {
				$("#rootEidtMain").load("r_" + url + ".jsp");
			}
		})
	</script>
</body>
</html>