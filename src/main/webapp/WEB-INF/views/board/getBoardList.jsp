<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<h1 style="display: inline">게시판</h1>
			</div>
			<!-- BUTTON -->
			<div class="col-lg-1">
				<form action="writeBoard" method="get" class="form-inline">
					<button type="submit" class="btn btn-default">글쓰기</button>
				</form>
			</div>
		</div>
	
		<p />
		<hr>
		<p />
	
		<!--  LIST GROUP -->
		<ul class="list-group">
			<c:forEach items="${boardList}" var="board">
				<li class="list-group-item">
					<div>
						<h4 style="display: inline"><a href="getBoard?index=${board.index}">${board.title}</a></h4>
						<span class="badge">+14</span>
					</div><p># created ${board.created_date} by ${board.u_index}</p>
				</li>
			</c:forEach>
		</ul>
	</div>
	<center>
		<div class="container">
			<div class="btn-group" role="group" aria-label="First group">
				<button type="button" class="btn btn-default"><</button>
				<button type="button" class="btn btn-default">1</button>
				<button type="button" class="btn btn-default">2</button>
				<button type="button" class="btn btn-default">3</button>
				<button type="button" class="btn btn-default">4</button>
				<button type="button" class="btn btn-default">5</button>
				<button type="button" class="btn btn-default">></button>
			</div>
		</div>
	</center>
</body>
</html>