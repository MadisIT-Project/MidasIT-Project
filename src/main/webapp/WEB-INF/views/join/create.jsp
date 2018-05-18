<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		console.log("test");
	});

	$('#checkIdBtn').click(function() {
		console.log("id click");
	});

	function myFunction() {
		console.log("myFunction test");
		// 		console.log($("#checkId"));
		$.ajax({
			type : "POST",
			url : "/join/checkValidation",
			dataType : "json",
			success : function(result) {
				var data = JSON.parse(result);
				console.log(data);
				console.log("success");
			},
			complete : function(result) {
				console.log("complete");

			},
			error : function(xhr, status, error) {
				console.log("error");
			}
		});
	}

	$("input[name=checkIdBtn]").bind('click', function() {
		console.log("btn click");
		// 				jQuery.ajax({
		// 						type:"GET",
		// 						url:"/join/checkValidation",
		// 						dataType:"JSON",
		// 						success: function(data){
		// 							console.log("success");
		// 						},
		// 					complete: function(data){
		// 						console.log("complete");

		// 					},
		// 					error: function(xhr, status, error){
		// 						console.log("error");
		// 					}
		// 				});
		// 				$.get('<spring:url value="/join/checkValidation" />', {
		// 					"checkId" : $("#checkId").val()
		// 				}, function(result) {
		// 					console.log(result);
		// 				});
	});
</script>
<body>
	create User
	<!-- 	<form id="joinForm"> -->
	<table>
		<tr>
			<td>id</td>
			<td><input type="text" name="checkId" id="checkId" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="checkIdBtn"
				name="checkIdBtn" value="submit" onclick="myFunction()" /></td>
		</tr>
	</table>
	<!-- 	</form> -->
</body>
</html>