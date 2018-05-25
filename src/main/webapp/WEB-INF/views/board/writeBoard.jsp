<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
<script>
	window.onload = function() {
		
		if (${board.index} != 0){
			$('#btn').html('글수정');
			fo.action = "${board.index}/update";
		}
	};
</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-11">
				<h1 style="display: inline">글쓰기</h1>
			</div>
		</div>

		<hr>

		<form action="insert" id = fo method="post" class="form-horizontal" accept-charset="UTF-8">
			<div class="form-group">
				<label for="title" class="col-sm-1 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력하세요." value='${board.title}'>
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-1 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="content" name="content" rows="15" placeholder="내용을 입력하세요.">${board.content}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="file" class="col-sm-1 control-label">파일 업로드</label>
				<div class="col-sm-10">
					<input type="file" id="file">
				</div>
			</div>
			<input type="text" name="index" class="hidden" value='${board.index}'>
			<input type="text" name="b_index" class="hidden" value=2>
			<input type="text" name="u_index" class="hidden" value=2>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-10">
					<button type="submit" id="btn" class="btn btn-default">글쓰기</button>
				</div>
			</div>
		</form>
		
		<hr>

	</div>
</body>
</html>