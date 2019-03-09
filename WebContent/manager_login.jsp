<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>在线点餐safafadfasfafasa </title>

<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">

		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">管理员登录</a>
			</div>
		</div>
		</nav>

		<form class="form-horizontal" role="form" action="login">
			<div class="form-group">
				<label for="firstname" class="col-sm-4 control-label">账号：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="id"
						placeholder="请输入账号...">
				</div>
			</div>


			<div class="form-group">
				<label for="lastname" class="col-sm-4 control-label">密码：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="password"
						placeholder="请输入密码...">
				</div>
			</div>

			<div class="col-sm-offset-4 col-sm-10">
				<button type="submit" class="btn btn-info btn-lg">登录</button>
			</div>
		</form>
	</div>

</body>
</html>