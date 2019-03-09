<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>在线点餐系统</title>

<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.info_div {
	display: flex;
	flex-direction: column;
}

.sum {
	font-size: 20px;
	color: red;
}

.info_div span {
	margin-top: 10px;
	margin-left: 10px;
}

.submit{
	margin-top:20px;
	margin-left:40px;
}

</style>

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">等待结账. . . . . .</a>
			</div>
		</div>
		</nav>
		<div class="info_div">
			<div>
				<span>等待支付金额：￥</span> <span class="sum">${sum}</span>
			</div>
			<span>订单号：${order_id}</span> <span>餐桌号：${table_id}</span>
		</div>
		<form action="end_meal" class="submit">
			<input type="hidden" name="order_id" value="${order_id}" /> <input
				type="hidden" name="table_id" value="${table_id}" /> <input
				type="submit" value="点击支付"  class="btn btn-primary"/>
		</form>

	</div>

</body>
</html>