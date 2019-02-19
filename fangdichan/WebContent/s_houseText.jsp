<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="layui-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="detailPosition" lay-verify="title" autocomplete="off" placeholder="（例如：幸福小区200号301室）" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">价格</label>
			<div class="layui-input-block">
				<input type="text" name="detailPosition" lay-verify="title" autocomplete="off" placeholder="（例如：幸福小区200号301室）" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">核心卖点</label>
    <div class="layui-input-block">
      <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">业主心态</label>
    <div class="layui-input-block">
      <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</body>
</html>