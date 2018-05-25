<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 

<sec:authentication var="user" property="principal" />

<!DOCTYPE html>
<html>
<head>
<title>MIDAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />

<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.css" />
<script src="/webjars/jquery/3.3.1/jquery.js"></script>
<script src="/webjars/bootstrap/3.3.5/js/bootstrap.js"></script>

<script>

	$(document).ready(function(){
		
		$(".btn-delete").on("click", function(){
			$.ajax({
	            url: "/board/${board.index}/delete",
	            type: 'GET',
	            data: null,
	            success: function(){
	            		history.back();
	            },
	            error: function(error){
	                console.log(error);
	            }
	        });
		});
		
		$("#comment-insert").on("click", function(){
			$.ajax({
	            url: "/board/${board.index}/comment/insert",
	            type: 'POST',
	            data: {content : $("#comment").val(), p_id : $("#p_id").val()},
	            beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
	            success: function(){
	            		history.go();
	            },
	            error: function(error){
	                console.log(error);
	            }
	        });

		});
		
		$(".comment-delete").on("click", function(){
			$.ajax({
	            url: "/board/${board.index}/comment/delete",
	            type: 'POST',
	            data: {index : $(this).val()},
	            beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
	            success: function(){
	            		history.go();
	            },
	            error: function(error){
	                console.log(error);
	            }
	        });

		});
	
	    $(".btn-edit").on("click", function(){
	    		
	    		/*
	    		$.ajax({
	            url: '/get_info',
	            type: 'POST',
	            data: {date : date, site : site, cate : cate, param : JSON.stringify(param), info : "initial"},
	            dataType: 'json',
	            success: function(response){
	                var obj = JSON.parse(response);
	                $('.inner').append(obj.html);
	                param = obj.param
	            },
	            error: function(error){
	                console.log(error);
	            }
	        });
	    		*/
	    	
	    		tag = $(this).parents("div").parents("div").prev();
	    		
	    		tag.innerHTML("aa");
            //(".date").removeClass("on");
            //$(this).addClass("on");
            
	        alert("aa");
	        refresh();
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
			<div class="col-lg-8">
				<h1 style="display: inline">게시판</h1>
			</div>
			<!-- BUTTON -->
			<div class="col-lg-4">
				
				<div class="btn-group" role="group" aria-label="First group">
					<button type="button" class="btn btn-default"
						onclick="window.location.href='http://localhost:8080/board'">글목록</button>
					<button type="button" class="btn btn-default"
						onclick="window.location.href='http://localhost:8080/board/write'">글쓰기</button>
						
					<c:if test="${isWriter eq true}">
						<button type="button" class="btn btn-default"
							onclick="window.location.href='http://localhost:8080/board/write?index=${board.index}'">글수정</button>
						<button type="button" class="btn btn-default btn-delete">글삭제</button>
					</c:if>
				</div>
			</div>
		</div>

		<p />
		<hr>
		<p />

		<div class="panel panel-default">
			<div class="panel-heading">
				<h2>${board.title}</h2>
			</div>
			<div class="panel-body" style="height: 500px">${board.content}</div>
		</div>

		<div class="panel panel-default">

			<div class="panel-heading">댓글</div>

			<!-- List group -->
			<ul class="list-group">
				<c:forEach items="${CommentList}" var="comment" varStatus="status">
					<li class="list-group-item">
						<div class="container">
							<div class ="col-sm-10 comment">
								${comment.content} created by ${CommentUserList.get(status.index)}
							</div>
							<c:if test="${CommentIsWriterList.get(status.index) eq true}">
								<div class ="col-sm-2">
									<div class="btn-group" role="group" aria-label="First group">
										<button type="button" class="btn btn-default btn-edit"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></button>
										<button type="button" class="btn btn-default comment-delete" id="comment-delete" value='${comment.index}'><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
									</div>
								</div>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>

			<!-- Default panel contents -->
			<div class="panel-body">
				<div class="form-group col-sm-11">
					<textarea class="form-control" id="comment" name="content" rows="2" placeholder="댓글을 입력하세요."></textarea>
				</div>
				<input type="text" id="p_id" name="p_id" class="hidden" value='${board.index}'>
				<div class="col-sm-1">
					<button type="submit" id="comment-insert" class="btn btn-default">댓글 달기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="wrap">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>