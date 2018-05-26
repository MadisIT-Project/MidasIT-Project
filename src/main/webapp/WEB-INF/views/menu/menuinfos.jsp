<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<sec:authentication var="user" property="principal" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<title>MIDAS</title>
</head>
<script>
var selectCheck=0;
	$(document).ready(
			function() {
				$('.checkbox').on(
						"click",
						function() {
							var tr_id = $(this).parent().parent().attr('id');
							var table = document.getElementById("buy");
							if ($(this).is(":checked")) {
								var row = table.insertRow(1);
								row.className = $(this).parent().parent().children(".menu-index").children().val();
								console.log("className : " + $(this).parent().parent().children(".menu-index").children().val());
								var cell1 = row.insertCell(0);
								var cell2 = row.insertCell(1);
								var cell3 = row.insertCell(2);
								console.log($(this).parent().parent().children(
										".menu-name").html())
								row.id = tr_id;
								cell1.innerHTML = $(this).parent().parent()
										.children(".menu-name").html();
								cell1.className = 'menu-name';
								cell2.innerHTML = $(this).parent().parent()
										.children(".menu-price").html();
								cell2.className = 'menu-price';
								cell3.innerHTML =  "<input type='text' class='num-1' name='count' value=1>";
								cell3.className = 'menu-num';
								selectCheck++;
							} else {
								var aa = $("#buy").find('#' + tr_id);
								aa.remove();
								selectCheck--;
							}
							if(selectCheck == 0){
								console.log("none");
								document.getElementById("sub_buy").style.display = "none";
							}else{
								console.log("block");
								document.getElementById("sub_buy").style.display = "block";
							}
						});

				$('#reserve-btn').on("click", function() {
					var rowNum = $('#buy >thead >tr').length;
					console.log("get in click" + rowNum);

					
					for (var i = 1; i < rowNum; i++) {
						var temp = $('#buy tr:eq(' + i + ')');
						var user_id = ${user.index};
						var menu_id = temp.attr('class');
						//console.log("html : " + temp.attr('class'));
						var num = temp.children(".menu-num").children(".num-1").val();
						
						console.log(user_id + "/" + menu_id + "/" + num)
						$.ajax({
						    url: "/user/reservation/insert",
						    type: 'POST',
						    data: {"user_id" : user_id, "menu_id" : menu_id, "num" : num},
						    beforeSend : function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}",
										"${_csrf.token}");
							},
						    success: function(){
						    		console.log("suceess");
						    		//history.go();
						    },
						    error: function(error){
						        console.log(error);
						    }
						});
						
						//console.log(name +"/" +price + "/" + num);
					}
					
					window.location.replace("http://localhost:8080/menu/menuInfo");

				});
			
			});
</script>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main" style="height: 500px">

		<h2 class="sub-header">Menu</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>name</th>
						<th>image</th>
						<th>price</th>
						<th>detail</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${menuList}" var="menu" varStatus="status">
						<tr id='${status.index}'>
							<td class="menu-index"><input class="checkbox" type="checkbox" value='${menu.index}'></td>
							<td class="menu-name">${menu.name}</td>
							<td class="menu-image">image</td>
							<td class="menu-price">${menu.price}</td>
							<td class="menu-detail">${menu.detail}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div id="sub_buy" style="display:none;" class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main">
		<h2 class="sub-header">구매 내역</h2>
		<div class="table-responsive">
			<table id="buy" class="table table-striped">
				<thead>
					<tr>
						<th>name</th>
						<th>price</th>
						<th>number</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>

		<div style="text-align: right">
			<button id="reserve-btn" type="button" class="btn btn-default">예약하기</button>
		</div>
	</div>


	<div class="wrap">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>