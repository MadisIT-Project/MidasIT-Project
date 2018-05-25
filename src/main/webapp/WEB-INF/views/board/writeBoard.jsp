<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 

<sec:authentication var="user" property="principal" />

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
	<title>MIDAS</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" href="/resources/css/common.css" />
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script>
	window.onload = function() {
		
		if (${board.index} != 0){
			$('#btn').html('글수정');
			fo.action = "${board.index}/update";
		}
		
		var markupStr = 'hello world';
		
	};
	
	$(document).ready(function() {
		$('#summernote').summernote({
			lang: 'ko-KR',
			placeholder: '내용을 입력해주세요.',
			height: 300,                 // set editor height
			minHeight: null,             // set minimum height of editor
			maxHeight: null,             // set maximum height of editor
			focus: true                  // set focus to editable area after initializing summernote
		});
		
		$('#btn-write').on("click", function(){
			var markupStr = $('#summernote').summernote('code');
			$('#summernote').value = markupStr;
		});
	});
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
					<textarea id="summernote" name="content"></textarea>
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
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-10">
					<button type="submit" id="btn-write" class="btn btn-default">글쓰기</button>
				</div>
			</div>
		</form>
		
		<hr>

	</div>
	
	<div class="wrap">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>