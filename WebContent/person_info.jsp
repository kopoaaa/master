<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Viewport" content="width=device-width, initial-scale=1">
<title>在线点餐系统</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.info_div {
	display: flex;
	flex-direction: column;
}

.confirm_div {
	display: flex;
	flex-direction: column;
}

.menu_item_ed {
	width: 130px;
	height: 155px;
	border: 1px solid #ededed;
	display: inline-flex;
	flex-direction: column;
	margin: 5px;
	padding-top: 3px;
	align-items: center;
}

.menu_item_ed img {
	width: 110px;
	height: 110px;
	border: 1px solid black;
}

.menu_item_ed span {
	font-size: 10px;
}

.name_div {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
}
</style>

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">本次消费记录</a>
			</div>
		</div>
		</nav>


		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked">
					<%-- <li><a
						href="return_show_menu?order_id=${order_id}&table_id=${table_id}">选择菜谱</a></li> --%>
					<li onclick="return_show_menu('${order_id}','${table_id }')"><a>选择菜谱</a></li>
					<li class="active"><a href="#">个人中心</a></li>
				</ul>
			</div>

			<div class="col-sm-10">

				<div class="info_div">
					<span>本次消费订单号：${order_id}</span> <span>本次消费人数：${people}</span> <span>本次消费桌号：${table}</span>
					<span>是否结账：${is_accounted}</span>
				</div>

				<div>
					<!-- <form action=""> -->
					总价：￥<span class="sum" id="sum"> <c:if test="${sum  == NULL}">0</c:if>
						<c:if test="${sum  != NULL}">${sum}</c:if>
					</span>
				</div>
				<c:if test="${menuListed != \"[]\"}">
					<span>所选菜单如下:</span>
					<br />
				</c:if>
				<div>
					<c:forEach items="${menuListed}" var="menu">
						<div class="menu_item_ed" id="${menu.food_id }">
							<img class="menu_img_ed" src="${menu.food_img }" />
							<div class="name_div">
								<span class="menu_name_ed">${menu.food_name}x</span> <span
									class="menu_count_ed">${menu.food_amount }</span>
							</div>
							<span class="menu_price_ed">${menu.food_price }</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		function return_show_menu(order_id, table_id) {
			var sum = document.getElementById("sum").innerHTML;
			var menuListed = getListed();
			var params = {
				"order_id" : order_id,
				"table_id" : table_id,
				"sum" : sum,
				"menuListed" : menuListed
			};

			httpPost("return_show_menu", params);
		}

		function httpPost(URL, PARAMS) {
			var temp = document.createElement("form");
			temp.action = URL;
			temp.method = "post";
			temp.style.display = "none";

			for ( var x in PARAMS) {
				var opt = document.createElement("textarea");
				opt.name = x;
				opt.value = PARAMS[x];
				temp.appendChild(opt);
			}

			document.body.appendChild(temp);
			temp.submit();

			return temp;
		}

		function getListed() {
			var divList = document.getElementsByClassName("menu_item_ed");
			var amountList = document.getElementsByClassName("menu_count_ed");
			var nameList = document.getElementsByClassName("menu_name_ed");
			var imgList = document.getElementsByClassName("menu_img_ed");
			var priceList = document.getElementsByClassName("menu_price_ed");
			var menuList = new Array();
			for (var i = 0; i < divList.length; i++) {
				//id
				var menuId = divList[i].id;
				//name
				var menuName = nameList[i].innerHTML;
				//img
				var menuImg = imgList[i].src;
				//price
				var menuPrice = priceList[i].innerHTML;
				//amout
				var menuAmount = amountList[i].innerHTML;
				var item = [ menuId, menuName, menuPrice, menuImg, menuAmount ];
				menuList[i] = item;
			}

			return menuList;
		}
	</script>

</body>
</html>