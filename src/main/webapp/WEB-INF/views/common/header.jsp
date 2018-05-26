<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<!-- <link rel="stylesheet" -->
<!-- 	href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" /> -->
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(function() {
		$(".nav").mouseenter(function() {
			$(".nav_depth").fadeIn(300);
			$(".nav_bg").fadeIn(300);
		}).mouseleave(function() {
			$('.nav_depth').stop();
			$(".nav_depth").fadeOut(300);
			$('.nav_bg').stop();
			$(".nav_bg").fadeOut(300);
		});
	});

	function logout() {
		console.log("logout");
		logoutForm.submit();
	}
</script>
<body>

	<div class="nav_bg" id="gnb_depth" style="opacity: 1; display: none;"></div>
	<div class="header">
		<div class="top_area">
			<div class="top_area_wrap">
				<ul class="left">
					<li><a href="?lang=ko">KOREA</a></li>
					<li><a href="?lang=en">ENGLISH</a></li>
				</ul>
				<form action="/join/logout" method="post" id="logoutForm">
					<ul class="right">
						<sec:authorize access="isAnonymous()">
							<li><a href="/join/login">login</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication var="user" property="principal" />
							<li>${user.username}님반갑습니다.&nbsp;<a href="#" onclick="logout()">Logout</a>&nbsp;
							</li>
							<li><a href="/mypage/profile">MyPage</a></li>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</sec:authorize>
					</ul>
				</form>
			</div>
		</div>
		<div class="header_wrap">
			<p class="logo">
				<a href="/"><img src="/resources/image/common/logo.gif" alt="마이다스아이티"></a>
			</p>
			<ul class="nav" id="nav">
				<li class="list00"><a href="#" id="menu0">광고배너</a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li class="nav_promotion">
							<!--<img src="/main_code/images/nav_promotion.png">-->
						</li>
					</ul></li>

				<li class="list01"><a href="/board" id="menu1"><spring:message code="post.title" /></a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li><a href="#">회사개요</a></li>
						<li><a href="#">회사비전</a></li>
					</ul></li>

				<%-- 				<sec:authorize ifAnyGranted="ROLE_ADMIN"> --%>
				<!-- 					<li class="list05"><a href="#" id="menu5">인재채용</a> -->
				<!-- 						<ul class="nav_depth" style="opacity: 1; display: none;"> -->
				<!-- 							<li><a href="#"><span class="nav_span">MIDAS</span> 인사제도</a></li> -->
				<!-- 							<li><a href="#">채용안내</a></li> -->
				<!-- 							<li><a href="#" target="_blank">채용공고</a></li> -->
				<!-- 						</ul> -->
				<!-- 					</li> -->
				<%-- 				</sec:authorize> --%>
				<%-- 				<sec:authorize ifAnyGranted="ROLE_USER"> --%>
				<!-- 					<li class="list07"><a href="#" id="menu6">찾아오시는길</a> -->
				<!-- 						<ul class="nav_depth" style="opacity: 1; display: none;"> -->
				<!-- 							<li><a href="#">찾아오시는길</a></li> -->
				<!-- 						</ul></li> -->
				<%-- 				</sec:authorize> --%>

				<li class="list02"><a href="/menu/menuInfo" id="menu2">메뉴</a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li><a href="/menu/menuInfo">조회</a></li>
					</ul></li>
					<!-- 사용자 -->
<%-- 				<sec:authorize ifAnyGranted="ROLE_USER"> --%>

					<li class="list03"><a href="/user/reservation/reserveInfo" id="menu3">예약 현황</a>
						<ul class="nav_depth" style="opacity: 1; display: none;">
							<li><a href="/user/reservation/reserveInfo">예약 현황</a></li>
						</ul></li>
					<li class="list04"><a href="/user/statistic/statisticInfo" id="menu4">구매 내역</a>
						<ul class="nav_depth" style="opacity: 1; display: none;">
							<li><a href="/user/statistic/statisticInfo">구매 내역</a></li>
						</ul></li>
<%-- 				</sec:authorize> --%>
					<!--  관리자  -->
<%-- 				<sec:authorize ifAnyGranted="ROLE_ADMIN"> --%>
					<li class="list05"><a href="/admin/menu/menuManage" id="menu5">관리</a>
						<ul class="nav_depth" style="opacity: 1; display: none;">
							<li><a href="/admin/menu/menuManage">메뉴 관리</a></li>
							<li><a href="/admin/manage/memberManage">회원 관리</a></li>
							<li><a href="/admin/reservation/reservManage">예약 관리</a></li>
						</ul></li>
<%-- 				</sec:authorize> --%>
			</ul>
		</div>
	</div>
</body>
</html>