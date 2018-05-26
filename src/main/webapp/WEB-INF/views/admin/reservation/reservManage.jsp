<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<title>MIDAS</title>
</head>
<script type="text/javascript">
	
	function changeNextState(state, productId){
		console.log(state); 
		console.log("click changeNextState");
		$.ajax({
			type : "POST",
			url : "/admin/reservation/nextState", 
			dataType : "json",
			data : {
				"state" : state + 1,
				"productId" : productId
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
				"${_csrf.token}");
			},
			success : function(result) {
				console.log(result);
				location.replace('/admin/reservation/reservManage');
			},
			complete : function(result) {
				console.log("complete");

			},
			error : function(xhr, status, error) {
				console.log("error");
			}
		});
	}
</script>

<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main" style="height: 500px">
		<h2 class="sub-header">
			<spring:message code="reserveinfo" />
		</h2>
		<c:if test="${error == false }">
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
							<th>change state</th>
						</tr>
					</thead>
					<tbody id="productList">
						<c:forEach items="${productList}" var="product" varStatus="status">
							<tr>
								<td>${product.index}</td>
								<td>${product.user_id}</td>
								<td>${product.menu_id}</td>
								<td>${product.date}</td>
								<td>${product.num}</td>
								<td><c:if test="${product.state == '1'}">
									ready
								</c:if> <c:if test="${product.state == '2'}">
									making
								</c:if> <c:if test="${product.state == '3'}">
									finish
								</c:if></td>
								<td><c:if test="${product.state != '3'}">
										<input type="button" onclick="changeNextState(${product.state}, ${product.index})" value="next Step" />
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		<c:if test="${error == true }">
			자료가 없습니다.
		</c:if>
	</div>

	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>