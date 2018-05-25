<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 

<!DOCTYPE html>
<html>
<head>
	<title>MIDAS</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" href="/resources/css/common.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	
	<!-- Not Working -->
	<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/3.2.0/css/bootstrap.min.css"></script>
	<script src="/webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-11">
				<h3 style="display: inline">게시판</h3>
			</div>
			<!-- BUTTON -->
			<sec:authorize access="isAuthenticated()">
				<div class="col-lg-1">
					<form action="board/write" method="get" class="form-inline">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button type="submit" class="btn btn-default">글쓰기</button>
					</form>
				</div>
			</sec:authorize>
		</div>
	
		<p />
		<hr>
		<p />
	
		<!--  LIST GROUP -->
		<ul class="list-group">
			<c:forEach items="${boardList}" var="board" varStatus="status">
				<li class="list-group-item">
					<div>
						<h4 style="display: inline"><a href="board/${board.index}">${board.title}</a></h4>
						<c:if test="${CommentCountList.get(status.index) ne 0}">
						    <span class="badge">+${CommentCountList.get(status.index)}</span>
						</c:if>
					</div><p># created ${board.created_date} by ${UserList.get(status.index)}</p>
				</li>
			</c:forEach>
		</ul>
	</div>
	<center>
		<div class="container">
			<div class="btn-group" role="group" aria-label="First group">
				<button type="button" class="btn btn-default">"<"</button>
				<button type="button" class="btn btn-default">1</button>
				<button type="button" class="btn btn-default">2</button>
				<button type="button" class="btn btn-default">3</button>
				<button type="button" class="btn btn-default">4</button>
				<button type="button" class="btn btn-default">5</button>
				<button type="button" class="btn btn-default">">"</button>
			</div>
		</div>
	</center>
	
	<div class="wrap">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>