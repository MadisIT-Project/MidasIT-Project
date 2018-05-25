<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
</head>
<style type="text/css">
.container {
	width: 980px;
	margin-right: auto;
	margin-left: auto;
}

.Subhead {
	display: flex;
	padding-bottom: 8px;
	margin-bottom: 16px;
	border-bottom: 1px #e1e4e8 solid;
	flex-flow: row wrap;
}

.mb-0 {
	margin-bottom: 0 !important;
}

.mt-0 {
	margin-top: 0 !important;
}

.Subhead-heading {
	font-size: 24px;
	font-weight: normal;
	flex: 1 1 auto;
}

.float-right {
	float: right !important;
}

.form-group {
	margin: 15px 0;
}

.two-thirds {
	width: 66%;
}

.column {
	float: left;
	padding-right: 10px;
	padding-left: 10px;
}

label {
	font-weight: 600;
	font-size: 14px;
}

.edit-profile-avatar .manual-file-chooser {
	position: absolute;
	top: 0;
	left: 0;
	height: 34px;
	padding: 0;
	cursor: pointer;
}

.width-full {
	width: 100% !important;
}

.manual-file-chooser {
	opacity: 0.0001;
}

.mt-3 {
	margin-top: 16px !important;
}

input {
	font-family: inherit;
	font-size: inherit;
}

.btn {
	color: #24292e;
	background-color: #eff3f6;
	background-image: linear-gradient(-180deg, #fafbfc 0%, #eff3f6 90%);
	position: relative;
	display: inline-block;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 600;
	line-height: 20px;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-repeat: repeat-x;
	background-position: -1px -1px;
	background-size: 110% 110%;
	border: 1px solid rgba(27, 31, 35, 0.2);
	border-radius: 0.25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.btn-primary {
	color: #fff;
	background-color: #28a745;
	background-image: linear-gradient(-180deg, #34d058 0%, #28a745 90%);
}
</style>
<script type="text/javascript">
$(function() {
// 	<img src=\"<spring:url value="/file/download/"/>" + product.IMG_PATH1 + "\" width='90px' height='80px'>

});
</script>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>

		<div class="container">
			<!-- Public Profile -->
			<div class="Subhead mt-0 mb-0">
				<h2 class="Subhead-heading">Profile</h2>
			</div>
			<form id="profile_frm" class="columns js-uploadable-container js-upload-avatar-image is-default" action="/mypage/upload?${_csrf.parameterName}=${_csrf.token}" encType="multipart/form-data" method="post">
				<dl class="form-group edit-profile-avatar mr-4 float-right">
					<dt>
						<label for="upload-profile-picture">Profile picture</label>
					</dt>
					<dd class="avatar-upload-container clearfix">
						<sec:authentication var="user" property="principal" />
						<img class="avatar rounded-2" src="/file/download/${user.index}.jpg" width="200" height="200">
						<div class="avatar-upload">
							<label class="position-relative btn button-change-avatar mt-3 width-full text-center"> Upload new picture <input id="attachment1" name="attachment1" type="file" class="manual-file-chooser width-full height-full ml-0 js-manual-file-chooser">
							</label>
						</div>
						<!-- /.avatar-upload -->
					</dd>
				</dl>

				<sec:authentication var="user" property="principal" />
				<input type="hidden" name="userId" value="${user.index}" />
				<div class="column two-thirds">
					<dl class="form-group">
						<dt>
							<label for="user_profile_name">Name</label>
						</dt>
						<dd>
							<input class="form-control" type="text" name="name" id="name" value="${user.name}">
						</dd>
					</dl>
					<dl class="form-group">
						<dt>
							<label for="user_profile_age">Age</label>
						</dt>
						<dd>
							<input class="form-control" type="text" name="age" id="age" value="${user.age}">
						</dd>
					</dl>
					<p>
						<button type="submit" class="btn btn-primary">Update profile</button>
					</p>
				</div>
			</form>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>