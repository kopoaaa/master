<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
.left {
	background: #409EFF;
}

.left a {
	color: #FFFFFF;
}

.a {
	height: 100%;
	border: 1px solid #ededed;
	display: inline-flex;
	flex-wrap: wrap;
	flex-direction: column;
}

.add_menu_div {
	text-align: center;
	margin-top: 5px;
}

.menu_list {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
}

.menu_item {
	width: 130px;
	height: 180px;
	border: 1px solid black;
	border-radius: 10px;
	display: inline-flex;
	flex-direction: column;
	margin: 10px;
	padding-top: 3px;
	align-items: center;
}

.menu_item img {
	width: 110px;
	height: 110px;
	border: 1px solid #ededed;
}

.menu_item span {
	font-size: 12px;
}

.btn_div {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.btn_div button {
	width: 50px;
	height: 28px;
	text-align: center;
	font-size: 10px;
}

.confirm_text{
	font-size:20px;
}

</style>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">管理界面</a>
			</div>
		</div>
		</nav>

		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked">
					<li class="left"><a href="#">菜谱管理</a></li>
					<li><a href="turn_manage_table">餐桌管理</a></li>
					<li><a href="turn_manage_form">订单管理</a></li>
				</ul>
			</div>

			<div class="col-sm-10 a">

				<div class="row">
					<div class="col-sm-12 add_menu_div">
						<!-- 按钮触发模态框 -->
						<button class="btn" data-toggle="modal" data-target="#addModal">添加菜谱</button>
					</div>
				</div>

				<!-- 添加菜式模态框（Modal） -->
				<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">输入所要添加的菜式信息</h4>
							</div>

							<div class="modal-footer">
								<form class="form-horizontal" role="form" action="add_food"
									method="post">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">菜名</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="food_name"
												placeholder="输入菜式名字...">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">价格</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="food_price"
												placeholder="输入菜式价格...">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">样图</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="food_img"
												placeholder="输入菜式图片地址...">
										</div>
									</div>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-primary">提交</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- 编辑菜式模态框（Modal） -->
				<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">请编辑菜式信息</h4>
							</div>

							<div class="modal-footer">
								<form class="form-horizontal" role="form" action="update_food"
									method="post">

									<input type="hidden" name="food_id" id="food_id" />

									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">菜名</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="food_name"
												name="food_name" placeholder="输入菜式名字...">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">价格</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="food_price"
												name="food_price" placeholder="输入菜式价格...">
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 control-label">样图</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="food_img"
												name="food_img" placeholder="输入菜式图片地址...">
										</div>
									</div>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-primary">提交</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- 删除提示模态框（Modal） -->
				<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">确认信息</h4>
							</div>

							<div class="modal-footer">
								<form class="form-horizontal" role="form" action="delete_food"
									method="post">
									
									<input type="hidden"  name="food_id" id="delete_food_id" />
									
									<div class="form-group">
										<label for="lastname" class="confirm_text col-sm-8 control-label">是否要删除此菜式？</label>
									</div>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-primary">确定</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="menu_list">
					<c:forEach items="${menuList}" var="menu">
						<div class="menu_item">
							<img src="${menu.food_img}" />
							<input type="hidden" name="food_id" value="${menu.food_id}" /> <span>${menu.food_name}</span>
							<span>￥:${menu.food_price}</span>
							<div class="btn_div">
								<button class="btn" data-toggle="modal" data-target="#editModal"
									onclick="edit_food('${menu.food_id }','${menu.food_name }','${menu.food_price }','${menu.food_img }')">编辑</button>
								<button class="btn" data-toggle="modal" data-target="#confirmModal" onclick="delete_food('${menu.food_id}')">删除</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function delete_food(foodId) {
			document.getElementById("delete_food_id").value = foodId;
		}

		function edit_food(foodId, foodName, foodPrice, foodImg) {
			document.getElementById("food_id").value = foodId;
			document.getElementById("food_name").value = foodName;
			document.getElementById("food_price").value = foodPrice;
			document.getElementById("food_img").value = foodImg;

		}
	</script>
</body>
</html>