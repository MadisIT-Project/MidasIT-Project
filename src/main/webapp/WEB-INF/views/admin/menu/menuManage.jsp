<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<title>MIDAS</title>
<script src="/webjars/jquery/3.3.1/jquery.js"></script>
<script src="/webjars/bootstrap/3.3.5/js/bootstrap.js"></script>

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
		$("#info").show();
	}
	function plus() {
		$("#info").hide();
		$("#add").show();
		$("#plus").show();
	}

	$(document).ready(
			function() {

				$('.modi-btn').on(
						"click",
						function() {
							var pa = $(this).parent().parent();
							console.log(pa.html());
							console.log(pa.find('.name').children().val());

							$.ajax({
								url : "/admin/menu/menuManage/update",
								type : 'POST',
								data : {
									index : $(this).val(),
									name : pa.find('.name').children().val(),
									price : pa.find('.price').children().val(),
									detail : pa.find('.detail').children()
											.val()
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
				$('.remove-btn').on(
						"click",
						function() {
							$.ajax({
								url : "/admin/menu/menuManage/delete",
								type : 'POST',
								data : {
									index : $(this).val()
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

				$('#add').on(
						"click",
						function() {
							console.log("add");
							console.log($('#add-name').val());

							document.getElementById("imageName").value = $('#add-name').val()
							menu_frm.submit();

							$.ajax({
								url : "/admin/menu/menuManage/add",
								type : 'POST',
								data : {
									name : $('#add-name').val(),
									price : $('#add-price').val(),
									detail : $('#add-detail').val()
								},
								beforeSend : function(xhr) {
									xhr.setRequestHeader("${_csrf.headerName}",
											"${_csrf.token}");
								},
								success : function() {
									location.href("/");
								},
								error : function(error) {
									console.log(error);
								}
							});
						});
			});
</script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>

	<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main">
		<div class="container">
			<h3>메뉴 관리</h3>
			<ul class="list-inline">
				<li><a href="#" onclick="menu()">조회</a></li>
				<li><a href="#" onclick="plus()">추가</a></li>
			</ul>
		</div>

		<div id="info" class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>name</th>
						<th>price</th>
						<th>detail</th>
						<th>image</th>
						<th>modify</th>
						<th>remove</th>
				</thead>
				<tbody>
					<!-- 조회 -->
					<c:forEach items="${menuList}" var="menu" varStatus="status">
						<tr class='${menu.index}'>
							<td class="name" style="vertical-align: middle;"><input type="text" name="fname" class="name-1" value='${menu.name}'></td>
							<td class="price" style="vertical-align: middle;"><input type="text" name="fname" class="price-1" value='${menu.price}'></td>
							<td class="detail" style="vertical-align: middle;"><input type="text" name="fname" class="detail-1" value='${menu.detail}'></td>
							<td class="path" style="vertical-align: middle;"><img class="avatar rounded-2" src="/file/menu/${menu.name}" width="50" height="50"></td>
							<td style="vertical-align: middle;"><button class="modi-btn btn btn-success" value='${menu.index}'>Modified</button></td>
							<td style="vertical-align: middle;"><button class="remove-btn btn btn-success" value='${menu.index}'>Remove</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="plus" class="table-responsive">
			<table id="plusmenu" class="table table-striped">
				<thead>
					<tr>
						<th>name</th>
						<th>price</th>
						<th>detail</th>
						<th>image</th>
				</thead>
				<tbody>

					<tr>
						<!- 추가 -->
						<td style="vertical-align: middle;"><input id="add-name" name="name" class="form-control" /></td>
						<td style="vertical-align: middle;"><input name="price" id="add-price" class="form-control" /></td>
						<td style="vertical-align: middle;"><input name="detail" id="add-detail" class="form-control" /></td>
						<td style="vertical-align: middle;">
							<form id="menu_frm" class="columns js-uploadable-container js-upload-avatar-image is-default" action="/file/menuImageUpload?${_csrf.parameterName}=${_csrf.token}" encType="multipart/form-data" method="post">
								<input type="hidden" id="imageName" name="imageName" /> <input class="attachment1" name="attachment1" type="file">
							</form>
						</td>

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