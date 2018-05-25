<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style type="text/css">
.form-horizontal .control-label {
	text-align: left;
}

.panel-body {
	padding-bottom: 0px;
}
</style>
<script type="text/javascript">
	function isValidation(check) {
		var regex= /^[a-z0-9_]{8,16}$/; 
		if (!check) {
			alert("이메일 중복체크를 하지 않았습니다.");
			return false;
		}

		if ($("#name").val() == "") {
			alert("name에 값이 없습니다.");
			return false;
		}

		if ($("#age").val() == "") {
			alert("age에 값이 없습니다.");
			return false;
		}

		if ($("#password").val() == "") {
			alert("password에 값이 없습니다.")
			return false;
		}
		if(!regex.test($("#password").val())){
			alert("비밀번호는 8-16자로 넣어주세요");
		      return false
		}
		if ($("#passwordCheck").val() == "") {
			alert("passwordCheck에 값이 없습니다.")
			return false;
		}

		if ($("#password").val() != $("#passwordCheck").val()) {
			alert("password와 passwordCheck가 일치하지 않습니다.");
			return false;
		}

		return true;
	}

	function login() {
		console.log("login function");
		loginform.submit();
	}

	$(function() {
		var check = false;
		$("#btn-duplicatedCheck").click(function() {
			var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var email=$("#email").val();
			if(!regex.test(email)){
				alert("이메일 형식에 맞춰서 입력해주세요");
			      return false
			}
			else{
			
			$.ajax({
				type : "GET",
				url : "/join/checkValidation",
				dataType : "json",
				data : {
					"email" : $("#email").val()
				},
				success : function(result) {
					
					if (result.data.email == 1) {
						alert("이미 존재하는 이메일입니다. 다시 확인해 주세요.");
					} else {
						if (confirm("사용가능한 이메일 입니다. 사용하시겠습니까? ")) {
							check = true;
							$("#email").attr("readonly", true);
							$("#btn-duplicatedCheck").attr("disabled", true);
						}
					}

						
						
				},
				complete : function(result) {
					console.log("complete");

				},
				error : function(xhr, status, error) {
					console.log("error");
				}
			
			});
			}
		});

		$("#btn-signup").click(
				function() {
					if (!isValidation(check)) {
						return false;
					}

					console.log($("#email").val());
					console.log($("#name").val());
					console.log($("#age").val());
					console.log($("#password").val());

					$.ajax({
						type : "POST",
						url : "/join/register",
						dataType : "json",
						data : {
							"email" : $("#email").val(),
							"name" : $("#name").val(),
							"age" : $("#age").val(),
							"password" : $("#password").val()
						},
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(result) {
							console.log(result);
							console.log("success");
							if (result.result == 1000) {
								alert("회원가입이 완료되었습니다.");
								location.replace('/');
							}
						},
						complete : function(result) {
							console.log("complete");

						},
						error : function(xhr, status, error) {
							console.log("error");
						}
					});
				});
	});
	
function checkEmail() {
       

}
function checkpasswd() {
    

}

</script>
<body>
	<div class="container">
		<div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<spring:message code="join.login" />
					</div>
					<div style="float: right; font-size: 80%; position: relative; top: -10px">
						<a href="#"><spring:message code="join.forget.password" /></a>
					</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">
					<div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
					<form id="loginform" name="loginform" class="form-horizontal" role="form" action="/join/loginProcess" method="post">

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> <input id="login-username" type="text" class="form-control" name="username" placeholder="email">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> <input id="login-password" type="password" class="form-control" name="password" placeholder="password">
						</div>

						<!-- 						<div class="input-group"> -->
						<!-- 							<div class="checkbox"> -->
						<!-- 								<label> <input id="login-remember" type="checkbox" -->
						<!-- 									name="remember" value="1"> Remember me -->
						<!-- 								</label> -->
						<!-- 							</div> -->
						<!-- 						</div> -->

						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

							<div class="col-sm-12 controls">
								<a id="btn-login" href="#" class="btn btn-success" onclick="login()">Login</a>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

						<div class="form-group">
							<div class="col-md-12 control">
								<div style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									<spring:message code="join.do.not.account" />
									<a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()"> Sign Up Here </a>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
		<div id="signupbox" style="display: none; margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<spring:message code="join.sign.up" />
					</div>
					<div style="float: right; font-size: 85%; position: relative; top: -10px">
						<a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()"> <spring:message code="join.login" /></a>
					</div>
				</div>
				<div class="panel-body">
					<form id="signupform" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="email" class="col-md-3 control-label"><spring:message code="join.email" /></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email Address">
							</div>
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="col-md-offset-3 col-md-9">
								<button id="btn-duplicatedCheck" type="button" class="btn btn-success" >
									<spring:message code="join.duplicated" />
								</button>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-md-3 control-label"><spring:message code="join.name" /></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="name" name="name" placeholder="name">
							</div>
						</div>
						<div class="form-group">
							<label for="age" class="col-md-3 control-label"><spring:message code="join.age" /></label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="age" name="age" placeholder="age">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-3 control-label"><spring:message code="join.password" /></label>
							<div class="col-md-9">
								<input type="password" class="form-control" id="password" name="password" placeholder="Password">
							</div>
							
						</div>
						<div class="form-group">
							<label for="passwordCheck" class="col-md-3 control-label"><spring:message code="join.password.check" /></label>
							<div class="col-md-9">
								<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="Password Check">
							</div>
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="col-md-12 control">
								<div style="border-top: 1px solid #888; padding-top: 15px;">
									<div style="text-align: right;">
										<button id="btn-signup" type="button" class="btn btn-info">
											<spring:message code="join.register" />
										</button>
									</div>
								</div>
							</div>
						</div>
						<%-- 						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>