<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.image-upload {
	width: 50;
}

#plus {
	display: none;
}

#plusbtn {
	float: right;
	display: inline;
	display: none;
}

#minusbtn {
	float: right;
	display: inline;
	display: none;
}

#add {
	float: right;
	display: none;
}
</style>
<script>
	function menu() {
		$("#plus").hide();
		$("#add").hide();
		$("#plusbtn").hide();
		$("#minusbtn").hide();
		$("#info").show();

	}
	function plus() {
		$("#info").hide();
		$("#add").show();
		$("#plusbtn").show();
		$("#minusbtn").show();
		$("#plus").show();

	}

	function plusmenu() {
		var table = document.getElementById("plusmenu");
		// Get the output text
		var len = table.rows.length;
		var row = table.insertRow(len);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);

		cell1.innerHTML = "<input name='name' class='name' value='name' placeholder='name'  class='form-control' />";
		cell2.innerHTML = "<input name='price' class='price' value='price' placeholder='price'  class='form-control' />";
		cell3.innerHTML = "<input name='detail' type='textarea' class='detail' value='detail' placeholder='detail'  class='form-control' />";
		cell4.innerHTML = '<form id="profile_frm" class="columns js-uploadable-container js-upload-avatar-image is-default" action="/mypage/upload?${_csrf.parameterName}=${_csrf.token}" encType="multipart/form-data" method="post"><div class=""><input class="attachment" name="attachment" type="file" class=""></div></form>';
	}
	function minusmenu() {
		var table = document.getElementById("plusmenu");
		// Get the output text
		var len = table.rows.length;
		table.deleteRow(len - 1);
	}

	function changeadminSelect() {
		var langSelect = document.getElementById("admin");

		var selectValue = langSelect.options[langSelect.selectedIndex].value;


		var selectText = langSelect.options[langSelect.selectedIndex].text;
	}

	$(document).ready(function() {

		$('.btn-modi').on("click", function() {
			var pa = $(this).parent().parent();
			console.log(pa.html());
			console.log(pa.find('.admin').find(".admin-1 option:selected").val());

			$.ajax({
				url : "/admin/manage/memberManage/update",
				type : 'POST',
				data : {
					no : $(this).val(),
					name : pa.find('.name').children().val(),
					age : pa.find('.age').children().val(),
					admin : pa.find('.admin').find(".admin-1 option:selected").val()
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
				},
				success : function() {
					history.go();
				},
				error : function(error) {
					console.log(error);
				}
			});

		});

		$('.btn-delete').on("click", function() {
			$.ajax({
				url : "/admin/manage/memberManage/delete",
				type : 'POST',
				data : {
					no : $(this).val()
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
				},
				success : function() {
					history.go();
				},
				error : function(error) {
					console.log(error);
				}
			});
		});

		$('#add').on("click", function() {
			console.log("add");
			console.log($('#add-name').val());

			$.ajax({
				url : "/admin/manage/memberManage/add",
				type : 'POST',
				data : {
					email : $('#add-email').val(),
					password : $('#add-passwd').val(),
					name : $('#add-name').val(),
					age : $('#add-age').val(),
					admin : $('#add-admin').val()
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
				},
				success : function() {
					history.go();
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	});
</script>
<title>MIDAS</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="container">
			<h3>메뉴 관리</h3>
			<ul class="list-inline">
				<li><a href="#" onclick="menu()">조회</a></li>
				<li><a href="#" onclick="plus()">추가</a></li>
				<li id="plusbtn"><button onclick="plusmenu()" value="plus">+</button></li>
				<li id="minusbtn"><button onclick="minusmenu()" value="minus">-</button></li>
			</ul>
		</div>


		<h2 class="sub-header">회원관리</h2>
		<div id="info" class="table-responsive">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>no</th>
							<th>email</th>
							<th>name</th>
							<th>age</th>
							<th>admin</th>
							<th>date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="member" varStatus="status">
							<tr>
								<td>${member.no}</td>
								<td>${member.email}</td>
								<td class="name"><input type="text" name="fname"
									class="name-1" value='${member.name}'></td>
								<td class="age"><input type="text" name="fname"
									class="age-1" value='${member.age}'></td>
								<td class="admin"><select class="admin-1" id="admin"
									name="admin" onchange="changeadminSelect()">
										<c:if test="${member.admin eq 0}">
											<option selected value="0">0</option>
											<option value="1">1</option>
										</c:if>
										<c:if test="${member.admin eq 1}">
											<option value="0">0</option>
											<option selected value="1">1</option>
										</c:if>
								</select></td>
								<td>${member.date}</td>
								<td><button class="btn-modi" value='${member.no}'>edit</button></td>
								<td><button class="btn-delete" value='${member.no}'>x</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div id="plus" class="table-responsive">
			<table id="plusmenu" class="table table-striped">
				<thead>
					<tr>

						<th>email</th>
						<th>password</th>
						<th>name</th>
						<th>age</th>
						<th>admin</th>
				</thead>
				<tbody>

					<tr>
						<!- 추가 -->
						<td><input name="email" id="add-email" value='1234'
							placeholder="1234" class="form-control" /></td>
						<td><input name="passwod" id="add-passwd" value='1234'
							placeholder="1234" class="form-control" /></td>
						<td><input name="name" id="add-name" value='name'
							placeholder="name" class="form-control" /></td>
						<td><input name="age" id="add-age" value='12'
							placeholder="12" class="form-control" /></td>
						<td><input name="admin" id="add-age" value='0'
							placeholder="0" class="form-control" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<button id="add" value="add">add</button>
	</div>

	<div class="wrap">
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>