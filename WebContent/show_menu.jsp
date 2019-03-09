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


<style>
.input-group {
	margin-top: 8px;
}

.menu_item {
	width: 130px;
	height: 175px;
	border: 1px solid #ededed;
	display: inline-flex;
	flex-direction: column;
	margin: 5px;
	padding-top: 3px;
	align-items: center;
}

.menu_item_ed {
	width: 130px;
	height: 175px;
	border: 1px solid #ededed;
	display: inline-flex;
	flex-direction: column;
	margin: 5px;
	padding-top: 3px;
	align-items: center;
}

.menu_item img {
	width: 110px;
	height: 110px;
	border: 1px solid black;
}

.menu_item_ed img {
	width: 110px;
	height: 110px;
	border: 1px solid black;
}

.menu_item span {
	font-size: 10px;
}

.menu_item_ed span {
	font-size: 10px;
}

.menu_item button {
	width: 80%;
	height: 25px;
	text-align: center;
}

.menu_item_ed button {
	width: 80%;
	height: 25px;
	text-align: center;
}

.confirm_div {
	margin: 5px;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	width: 100%;
}

.sum {
	font-family: monospace;
	color: red;
	font-size: 20px;
}

.name_div {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.btn_div {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.add {
	width: 20px;
}

.a {
	height: 100%;
	border: 1px solid #ededed;
	display: inline-flex;
	flex-wrap: wrap;
}

.b {
	height: 100%;
	border: 1px solid #ededed;
	display: inline-flex;
	flex-direction: column;
	align-items: center;
}
</style>
</head>

<body>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">请选择你的菜式</a>
			</div>

			<!-- <form class="bs-example bs-example-form" role="form" action=""
				method="post"> -->
			<div class="col-lg-6">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="搜索菜式"
						id="text" name="food_name" /> <input type="hidden"
						name="order_id" value="${order_id}" /> <input type="hidden"
						name="table_id" value="${table_id}" /> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button"
							onclick="search('${order_id}','${table_id}')">Go!</button>
					</span>
				</div>
			</div>
			<!-- </form> -->
		</div>
		</nav>

		<div class="row">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#">选择菜谱</a></li>
					<%-- <li><a
						href="person_info?order_id=${order_id}&table_id=${table_id}">个人中心</a></li> --%>
					<li onclick="person_info('${order_id}','${table_id }')"><a>个人中心</a></li>
				</ul>
			</div>


			<!-- 菜谱部分 -->
			<div class="col-sm-8 a">
				<c:forEach items="${menuList}" var="menu">
					<div class="menu_item">
						<img src="${menu.food_img}" /> <span class="menu_name">${menu.food_name}</span>
						<span class="menu_price">￥:${menu.food_price}</span>
						<button class="menu_confirm"
							onclick="selectFood('${menu.food_id}','${menu.food_name}','${menu.food_price}','${menu.food_img}')">点菜</button>
					</div>
				</c:forEach>
			</div>

			<!-- 已选菜单部分 -->
			<div class="col-sm-2 b" id="col-sm-2">
				<div class="confirm_div">
					<!-- <form action=""> -->
					<button onclick="getMenuList('${order_id}','${table_id}')">提交订单</button>
					<div>
						<span class="text">总价：￥</span><span class="sum" id="sum"> <c:if
								test="${sum  == NULL}">0</c:if> <c:if test="${sum  != NULL}">${sum }</c:if>
						</span>
					</div>
					<!-- 总价：<span class="count" name="count">0</span> -->
					<%-- <input type="hidden" name="order_id" value="${order_id}"> <input
						type="hidden" name="table_id" value="${table_id}"> --%>
					<!-- </form> -->
				</div>
				<c:forEach items="${menuListed}" var="menu">
					<div class="menu_item_ed" id="${menu.food_id }">
						<img class="menu_img_ed" src="${menu.food_img }" />
						<div class="name_div">
							<span class="menu_name_ed">${menu.food_name}x</span> <span
								class="menu_count_ed">${menu.food_amount }</span>
						</div>
						<span class="menu_price_ed">${menu.food_price }</span>
						<div class="btn_div">
							<button class="add"
								onclick="onAdd('${menu.food_price}','${menu.food_id}')">+</button>
							<button class="minus"
								onclick="onMinus('${menu.food_price}','${menu.food_id}')">-</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function person_info(order_id, table_id) {
			var sum = document.getElementById("sum").innerHTML;
			var menuListed = getListed();
			var params = {
				"order_id" : order_id,
				"table_id" : table_id,
				"sum" : sum,
				"menuListed" : menuListed
			};

			httpPost("person_info", params);
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

		function search(order_id, table_id) {

			var text = document.getElementById("text").value;
			var menuListed = getListed();

			var sum = document.getElementById("sum").innerHTML;

			/* window.location.href = "search?food1=" + text + "&order_id="
					+ order_id + "&table_id=" + table_id + "&menuListed="
					+ menuListed;
			 */
			var params = {
				"food1" : text,
				"order_id" : order_id,
				"table_id" : table_id,
				"sum" : sum,
				"menuListed" : menuListed
			};

			httpPost("search", params);
		}

		function selectFood(menuId1, menuName1, menuPrice1, menuImg1) {

			/* 如果所选菜式已在已选菜单列表中，则直接数量加1 */
			var selectMenuItem = document.getElementById(menuId1);
			if (selectMenuItem != null) {
				updateCount(selectMenuItem, true);
			} else {
				/* 如果不在已选菜单列表中，则创建菜单 */
				selectMenuItem = document.createElement("div");
				selectMenuItem.setAttribute("class", "menu_item_ed");
				selectMenuItem.setAttribute("id", menuId1);

				/* 菜单图片 */
				var menuImg = document.createElement("img");
				menuImg.setAttribute("class", "menu_img_ed");
				menuImg.setAttribute("src", menuImg1);
				selectMenuItem.appendChild(menuImg);

				var nameDiv = document.createElement("div");
				nameDiv.setAttribute("class", "name_div");
				selectMenuItem.appendChild(nameDiv);
				/* 菜单名称 */
				var menuName = document.createElement("span");
				menuName.setAttribute("class", "menu_name_ed");
				menuName.innerHTML = menuName1 + " x ";
				nameDiv.appendChild(menuName);
				/* 菜单数量 */
				var menuCount = document.createElement("span");
				menuCount.setAttribute("class", "menu_count_ed");
				menuCount.innerHTML = 1;
				nameDiv.appendChild(menuCount);

				/* 菜单价格 */
				var menuPrice = document.createElement("span");
				menuPrice.setAttribute("class", "menu_price_ed");
				menuPrice.innerHTML = menuPrice1;
				selectMenuItem.appendChild(menuPrice);

				var btnDiv = document.createElement("div");
				btnDiv.setAttribute("class", "btn_div");
				selectMenuItem.appendChild(btnDiv);

				/*增加  */
				var addBtn = document.createElement("button");
				addBtn.setAttribute("class", "add");
				addBtn.setAttribute("onclick", "onAdd(" + menuPrice1 + ","
						+ menuId1 + ")");
				addBtn.innerHTML = "+";
				btnDiv.appendChild(addBtn);
				/*减少  */
				var minusBtn = document.createElement("button");
				minusBtn.setAttribute("class", "minus");
				minusBtn.setAttribute("onclick", "onMinus(" + menuPrice1 + ","
						+ menuId1 + ")");
				minusBtn.innerHTML = "-";
				btnDiv.appendChild(minusBtn);

				var bodyFa = document.getElementById("col-sm-2");
				bodyFa.appendChild(selectMenuItem);
			}

			updatePrice(menuPrice1, true);

		}

		function updateCount(selectMenuItem, isAdd) {
			var menuCount = selectMenuItem.getElementsByTagName("span")[1];
			var count = parseInt(menuCount.innerHTML);
			if (isAdd) {
				count++;
			} else {
				count--;
			}

			if (count == 0) {
				var node = selectMenuItem.parentNode;
				node.removeChild(selectMenuItem);
				return;
			}
			menuCount.innerHTML = count;
		}

		function updatePrice(menuPrice1, isAdd) {
			/* 更新总价 */
			var countSpan = document.getElementsByClassName("sum");
			var count = parseFloat(countSpan[0].innerHTML);
			//var count = parseFloat(countSpan[0].value);
			if (isAdd) {
				count += parseFloat(menuPrice1);
			} else {
				count -= parseFloat(menuPrice1);
			}

			countSpan[0].innerHTML = Math.round(count * 100) / 100;
		}

		/* 增加按钮 */
		function onAdd(menuPrice, menuId) {
			var selectMenuItem = document.getElementById(menuId);
			updateCount(selectMenuItem, true);
			updatePrice(menuPrice, true);
		}

		function onMinus(menuPrice, menuId) {
			var selectMenuItem = document.getElementById(menuId);
			updateCount(selectMenuItem, false);
			updatePrice(menuPrice, false);
		}

		function getMenuList(order_id, table_id) {

			var menuList = getList();
			var countSpan = document.getElementsByClassName("sum");
			var count = parseFloat(countSpan[0].innerHTML);
			if (count == 0) {
				window.alert("请选择您的菜式");
			} else {
				window.location.href = "submit_form?order_id=" + order_id
						+ "&table_id=" + table_id + "&sum=" + count
						+ "&food_list=" + menuList;
			}
		}

		function getList() {
			var divList = document.getElementsByClassName("menu_item_ed");
			var amountList = document.getElementsByClassName("menu_count_ed");
			var menuList = new Array();
			for (var i = 0; i < divList.length; i++) {
				var menuId = divList[i].id;
				var menuAmount = amountList[i].innerHTML;
				var item = [ menuId, menuAmount ];
				menuList[i] = item;
			}

			return menuList;

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
				//amount
				var menuAmount = amountList[i].innerHTML;
				var item = [ menuId, menuName, menuPrice, menuImg, menuAmount ];
				menuList[i] = item;
			}

			return menuList;
		}
	</script>
</body>
</html>