<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<title>MIDAS</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h2 class="sub-header">Menu</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>시간</th>
                  <th>이름</th>
                  <th>가격</th>
                  <th>주문일시</th>
                  <th>수량</th>
                  <th>상태</th>
                </tr>
              </thead>
              <tbody id="productList">
              </tbody>
            </table>
          </div>
       </div>
       <ul class="list-group">
			<c:forEach items="${product}" var="product" varStatus="status">
				<li class="list-group-item">
				${product.index}
				${product.user_id}
				${product.menu_id}
				${product.num}
				${product.date}
				${product.state}
				</li>
			</c:forEach>
		</ul>
       
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>