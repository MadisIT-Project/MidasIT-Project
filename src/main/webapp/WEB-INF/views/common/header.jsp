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
// 	function logout(){
// 		logoutForm.submit();
// 	}
</script>
<body>
<!-- 	<form action="/join/logout" method="post" id="logoutForm"> -->
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
<!-- 	</form> -->
	<div class="nav_bg" id="gnb_depth" style="opacity: 1; display: none;"></div>
	<div class="header">
		<div class="top_area">
			<div class="top_area_wrap">
				<ul class="left">
					<li><a href="?lang=ko">KOREA</a></li>
					<li><a href="?lang=en">ENGLISH</a></li>
				</ul>
				<ul class="right">
					<li><a href="/join/login">login</a></li>
					<li>${email}님 반갑습니다.<a href="/join/logout" onclick="">logout</a></li>
				</ul>
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
				<li class="list02"><a href="#" id="menu3">사업분야</a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li><a href="#">사업소개</a></li>
						<li><a href="#"><span class="nav_span">MIDAS</span> 사업</a></li>
					</ul></li>
				<li class="list03"><a href="#" id="menu2">회사문화</a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li><a href="#"><span class="nav_span">MIDAS</span> 문화</a></li>
						<li><a href="#">경영철학</a></li>
					</ul></li>
				<li class="list04"><a href="#" id="menu4">홍보센터</a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li><a href="#"><span class="nav_span">MIDAS IT News</span></a></li>
						<li><a href="#">홍보동영상</a></li>
					</ul></li>
				<li class="list05"><a href="#" id="menu5">인재채용</a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li><a href="#"><span class="nav_span">MIDAS</span> 인사제도</a></li>
						<li><a href="#">채용안내</a></li>
						<li><a href="#" target="_blank">채용공고</a></li>
					</ul></li>
				<li class="list07"><a href="#" id="menu6">찾아오시는길</a>
					<ul class="nav_depth" style="opacity: 1; display: none;">
						<li><a href="#">찾아오시는길</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</body>
</html>