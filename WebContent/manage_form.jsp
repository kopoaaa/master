<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>在线点餐啊</title>

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

.table {
	border: 1px solid #ededed;
}

.is_accounted {
	background: #E9F2FD;
}

.delete_td {
}

.delete_button {
	width: 20px;
	height: 20px;
	margin-top: -17px;
	color: red;
	left:25px;
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
					<li><a href="turn_manage_menu">菜谱管理</a></li>
					<li><a href="turn_manage_table">餐桌管理</a></li>
					<li class="left"><a href="#">订单管理</a></li>
				</ul>
			</div>

			<div class="col-sm-10">
			
			<!-- 删除提示模态框（Modal） -->
				<div class="modal fade" id="confirmModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">确认信息</h4>
							</div>

							<div class="modal-footer">
								<form class="form-horizontal" role="form" action="delete_form"
									method="post">

									<input type="hidden" name="order_id" id="order_id" />
									<input type="hidden" name="table_id" id="table_id" />

									<div class="form-group">
										<label for="lastname"
											class="confirm_text col-sm-8 control-label">是否要删除此订单？</label>
									</div>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-primary">确定</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>订单单号</th>
							<th>就餐人数</th>
							<th>就餐桌号</th>
							<th>下单时间</th>
							<th>所选菜式</th>
							<th>总金额</th>
							<th>订单状态</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${form_list}" var="form">
							<c:if test="${form.value.is_accounted =='未结账' }">
								<tr class="danger">
							</c:if>
							<c:if test="${form.value.is_accounted =='已结账' }">
								<tr class="is_accounted">
							</c:if>
							<td><span>${form.value.order_id}</span></td>
							<td><span>${form.value.people_number}人</span></td>
							<td><span>${form.value.table_id}号桌</span></td>
							<%-- <td>订单评价：<span>${form.evaluate}</span> </td>--%>

							<td><span>${form.value.time}</span></td>

							<td><c:forEach items="${form.value.list}" var="food">
									<span>${food.food_name}</span>X<span>${food.food_amount}</span>
									<br>
								</c:forEach></td>
							<td><span>${form.value.sum}元</span></td>
							<td class="delete_td"><span>${form.value.is_accounted}</span>
								<span class="btn delete_button glyphicon glyphicon-remove"
								data-toggle="modal" data-target="#confirmModal"
								onclick="delete_table('${form.value.order_id }','${table.table_id}')"></span></td>
						</c:forEach>
						</tr>
					</tbody>
				</table>

			</div>
		</div>

	</div>
	
	<script type="text/javascript">
	
		function delete_table(order_id,table_id){
			document.getElementById("order_id").value = order_id;
			document.getElementById("table_id").value = table_id;
		}
	
	</script>
	
</body>
</html>