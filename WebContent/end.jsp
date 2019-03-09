<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 定时跳转 -->
<meta http-equiv="refresh" content="5;url=/ordering_online">

<title>在线点餐系统</title>

<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.welcome {
	margin-top: 100px;
	display: flex;
	flex-direction: column;
	text-align: center;
	padding: 10px;
	width: 100%;
}

.text2 {
	margin-top: 10px;
}

.text {
	font-size: 50px;
	color: blue;
}

.btn {
	position: relative;
	margin-top: 50px;
	width: 100px;
	left: 46%;
}
</style>

</head>
<body onload="run()">

	<div class="welcome">
		<span class="text">欢迎再次光临</span>
		<button class="btn btn-primary" onclick="back()">直接返回</button>
		<div class="text2">
			<span id="spanId">5</span>秒后返回点菜首页
		</div>
	</div>

</body>

<script type="text/javascript">
	var x = 5;
	function run() {
		// 获取到的是span标签的对象
		var span = document.getElementById("spanId");
		// 获取span标签中间的文本
		span.innerHTML = x;
		x--;
		// 再让run方法执行呢，一秒钟执行一次
		window.setTimeout("run()", 1000);
	}

	function back() {
		window.location.href = "/order_online";
	}
</script>

</html>