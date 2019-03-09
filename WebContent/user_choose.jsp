<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Viewport" content="width=device-width, initial-scale=1">
<title>在线点餐系统</title>
<link rel="stylesheet"  href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>



	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">在线点餐系统</a>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">制作人员：</a></li>
					<li><a href="#">冯超</a></li>
					<li><a href="#">魏仲凯</a></li>
					<li><a href="#">彭春考</a></li>
					<li><a href="#">郑晓锋</a></li>
					<li><a href="#">陈钰泽</a></li>
				</ul>
			</div>
		</div>
		</nav>

		<div class="container">
			<div style="text-align: center; margin-top: 100px">

				<div class="btn-group">
					<button type="button" class="btn btn-default btn-lg"
						style="font-size: 50px">
						<span class="glyphicon glyphicon-user"></span>
					</button>
					<select id="test1"
						style="font-size: 30px; width: 150px; height: 72px" size="1">
						<option value="" disabled selected hidden>就餐人数</option>
						<c:forEach items="${peopleNumber}" var="people">
							<option value="${people}">${people}</option>
						</c:forEach>
					</select>
				</div>

				&nbsp;

				<div class="btn-group">
					<button type="button" class="btn btn-default btn-lg"
						style="font-size: 50px">
						<span class="glyphicon glyphicon-glass"></span>
					</button>

					<select id="test2"
						style="font-size: 30px; width: 150px; height: 72px" size="1">
						<option value="" disabled selected hidden>餐桌号数</option>
						<c:forEach items="${tableNumber}" var="table">
							<option value="${table}">${table}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>


		<div style="text-align: center; margin-top: 50px">
			<!-- 按钮触发模态框 -->

			<div class="container">
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#myModal" style="font-size: 30px" onclick="confirm()">确定</button>
			</div>

			<!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">确认就餐信息</h4>
						</div>
						<div class="modal-body">
							<text id="text1"></text>
							&nbsp;
							<text id="text2"></text>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="btn_cancel"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" id="btn_confirm"
								onclick="window.location.href='show_menu?people_number=' + people + '&table_id=' + table + '&order_id=' + order_id">确认</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var people, table;
		var Date = new Date();
		var order_id=change(Date);
		
	
		
		function confirm() {

			var myselect1 = document.getElementById("test1");
			var index1 = myselect1.selectedIndex;
			var value1 = myselect1.options[index1].value;

			var myselect2 = document.getElementById("test2");
			var index2 = myselect2.selectedIndex;
			var value2 = myselect2.options[index2].value;

			people = value1;
			table = value2;
			
			if(people =='' || table ==''){
				document.getElementById("text1").innerHTML = "请输入就餐人数与餐桌号";
				document.getElementById("btn_confirm").style.visibility="hidden";
				document.getElementById("btn_cancel").innerHTML="确定";
				return;
			}
			document.getElementById("btn_cancel").innerHTML="取消";
			document.getElementById("btn_confirm").style.visibility="visible";
			document.getElementById("text1").innerHTML = "就餐人数为：" + people;

			document.getElementById("text2").innerHTML = "餐桌号数为：" + table;

		}
		
		
		function change(date) {  
		    var y = date.getFullYear();  
		    var m = date.getMonth() + 1;  
		    m = m < 10 ? ('0' + m) : m;  
		    var d = date.getDate();  
		    d = d < 10 ? ('0' + d) : d;  
		    var h = date.getHours();  
		    var minute = date.getMinutes();  
		    minute = minute < 10 ? ('0' + minute) : minute; 
		    var second= date.getSeconds();  
		    second = minute < 10 ? ('0' + second) : second;  
		    return y + m + d + h + minute + second;  
		} 
		
	</script>
</body>
</html>