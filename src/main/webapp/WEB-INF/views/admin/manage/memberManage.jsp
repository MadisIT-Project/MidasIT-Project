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
	<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main">
		<div class="container">
			<h3>회원 관리</h3>
			<ul class="list-inline">
				<li><a href="#" onclick="menu()">조회</a></li>
				<li><a href="#" onclick="plus()">추가</a></li>
			</ul>
		</div>

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
							<th>update</th>
							<th>remove</th>
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
								<td><button class="btn-modi btn btn-success" value='${member.no}'>edit</button></td>
								<td><button class="btn-delete btn btn-success" value='${member.no}'>x</button></td>
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
						<td><input name="email" id="add-email" class="form-control" /></td>
						<td><input name="passwod" id="add-passwd" class="form-control" /></td>
						<td><input name="name" id="add-name" class="form-control" /></td>
						<td><input name="age" id="add-age" class="form-control" /></td>
						<td><input name="admin" id="add-age" class="form-control" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<button id="add" value="add" class="btn btn-success">add</button>
	</div>

	<div class="wrap">
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>