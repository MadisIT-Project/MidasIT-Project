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
<script>
	$(document).ready(
		function() {

			$('.remove-btns').on(
					"click",
					function() {
						$.ajax({
							url : "/user/reservation/deleteReady",
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


		});
</script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main"
		style="height: 500px">
		<h2 class="sub-header">
			<spring:message code="reserveinfo" />
		</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th><spring:message code="reservenum" /></th>
						<th><spring:message code="name" /></th>
						<th><spring:message code="price" /></th>
						<th><spring:message code="timestamp" /></th>
						<th><spring:message code="number" /></th>
						<th><spring:message code="state" /></th>
						<th>Remove</th>
					</tr>
				</thead>
				<tbody id="productList">
					<c:forEach items="${product}" var="product" varStatus="status">
						<tr>
							<td>${product.index}</td>
							<td>${product.user_id}</td>
							<td>${product.menu_id}</td>
							<td>${product.date}</td>
							<td>${product.num}</td>
							<td><c:if test="${product.state eq 1}">
									ready
									<td style="vertical-align: middle;"><button
											class="remove-btns btn btn-success" value='${product.index}'>Remove</button></td>
								</c:if> <c:if test="${product.state eq 2}">
									making
									<td style="vertical-align: middle;"></td>
								</c:if> <c:if test="${product.state eq 3}">
									finish
									<td style="vertical-align: middle;"></td>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>



	<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>