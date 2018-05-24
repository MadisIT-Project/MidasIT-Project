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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
			<div class="col-lg-8">
				<h1 style="display: inline">게시판</h1>
			</div>
			<!-- BUTTON -->
			<div class="col-lg-4">
				<div class="btn-group" role="group" aria-label="First group">
					<button type="button" class="btn btn-default" onclick="window.location.href='http://localhost:8080/board/getBoardList'">글목록</button>
					<button type="button" class="btn btn-default" onclick="window.location.href='http://localhost:8080/board/writeBoard'">글쓰기</button>
					<button type="button" class="btn btn-default" onclick="window.location.href='http://localhost:8080/board/writeBoard?index=${board.index}'">글수정</button>
					<button type="button" class="btn btn-default" onclick="window.location.href='http://localhost:8080/board/deleteBoard?index=${board.index}'">글삭제</button>
				</div>
			</div>
		</div>

		<p />
		<hr>
		<p />

		<div class="panel panel-default">
			<div class="panel-heading"><h2>${board.title}</h2></div>
			<div class="panel-body" style="height:500px">${board.content}</div>
		</div>
	</div>
</body>
</html>