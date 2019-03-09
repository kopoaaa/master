<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Viewport" content="width=device-width, initial-scale=1">
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

.add_table_div {
	width: 100%;
	margin-top: 5px;
	text-align: right;
}

.table {
	width: 700px;
	border: 1px solid #ededed;
	margin-top: 5px;
}

.status {
	background: #E9F2FD;
}

.span_cls {
	margin-top: 10px;
}

.delete_td {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.delete_button {
	color: red;
}

.confirm_text {
	font-size: 20px;
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
					<li class="left"><a href="#">餐桌管理</a></li>
					<li><a href="turn_manage_form">订单管理</a></li>
				</ul>
			</div>

			<div class="col-sm-10">


				<div class="row">
					<div class="col-sm-12 add_table_div">
						<!-- 按钮触发模态框 -->
						<button class="btn" data-toggle="modal" data-target="#addModal">添加餐桌</button>
					</div>
				</div>

				<!--添加餐桌的模态框  -->
				<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">输入所要添加的餐桌号</h4>
							</div>

							<div class="modal-footer">
								<form class="form-horizontal" role="form" action="add_table"
									method="post">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 control-label">餐桌号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="table_id"
												id="table_id" placeholder="输入餐桌号...">
										</div>
									</div>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary"
										onclick="check('${table_list}')">提交</button>
								</form>
							</div>
						</div>
					</div>
				</div>

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
								<form class="form-horizontal" role="form" action="delete_table"
									method="post">

									<input type="hidden" name="table_id" id="delete_table_id" />

									<div class="form-group">
										<label for="lastname"
											class="confirm_text col-sm-8 control-label">是否要删除此餐桌？</label>
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
							<th>餐桌号数</th>
							<th>就餐人数</th>
							<th>餐桌状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${table_list}" var="table">
							<c:if test="${table.status =='已占用' }">
								<tr class="danger">
							</c:if>
							<c:if test="${table.status =='未占用' }">
								<tr class="status">
							</c:if>
							<td><span class="id_span">${table.table_id}</span>号桌</td>
							<td><span>${table.people_number}人</span></td>
							<td class="delete_td"><span>${table.status}</span> 
								<%-- <a	href="delete_table?table_id=${table.table_id}"> --%>
								<span class="btn delete_button glyphicon glyphicon-remove" data-toggle="modal" data-target="#confirmModal" onclick="delete_table('${table.table_id}')"></span>
								<!-- </a> -->
							</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>

	<script type="text/javascript">
	
	
		function delete_table(table_id){
			document.getElementById("delete_table_id").value = table_id;
		}
	
	
		function check(table_list) {

			var newId = document.getElementById("table_id").value;
			var idList = document.getElementsByClassName("id_span");

			if (newId == "") {
				window.alert("请输入餐桌号");
				return;
			}

			for (var i = 0; i < idList.length; i++) {
				if (newId == idList[i].innerHTML) {
					window.alert("餐桌已存在");
					document.getElementById("table_id").value = '';
					return;
				}
			}
			window.location.href = "add_table?table_id=" + newId;

		}
	</script>

</body>
</html>