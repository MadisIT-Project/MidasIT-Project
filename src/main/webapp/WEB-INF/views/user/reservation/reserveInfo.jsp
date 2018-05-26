<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<title>MIDAS</title>
</head>

<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>	
		<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main" style=" height: 500px">
          <h2 class="sub-header"><spring:message code="reserveinfo" /> </h2>
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
				<td>${product.state}</td>
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