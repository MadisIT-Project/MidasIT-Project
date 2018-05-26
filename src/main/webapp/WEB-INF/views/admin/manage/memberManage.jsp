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
<script>
	function changeadminSelect() {
		var langSelect = document.getElementById("admin");

		var selectValue = langSelect.options[langSelect.selectedIndex].value;


		var selectText = langSelect.options[langSelect.selectedIndex].text;
	}
</script>
<title>MIDAS</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

		<h2 class="sub-header">회원관리</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>no</th>
						<th>email</th>
						<th>name</th>
						<th>admin</th>
						<th>date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="member" varStatus="status">
						<tr>
							<td>${member.no}</td>
							<td>${member.email}</td>
							<td>${member.name}</td>
							<td><select id="admin" name="admin"
								onchange="changeadminSelect()">
									<option selected value="1">1</option>
									<option value="2">2</option>
							</select></td>
							<td>${member.date}</td>
							<td><button value='${member.index}'>x</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="wrap">
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>