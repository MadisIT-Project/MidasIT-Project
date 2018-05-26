<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<body>

<!-- 푸터 -->
<div id="footer">
	<ul class="information">
		<li class="pdf_download"><a href="/resources/file/2018_midasit_challenge.pdf" title="MIDAS Challeng PDF 새창열기" target="_blank" style="color:#555;" ><i style="" class="xi-arrow-bottom"></i>MIDAS Challeng 설명서</a>&nbsp;&nbsp;&nbsp;l</li>
		<li><a href="/map" style="color:#555;" >오시는 길</a>&nbsp;&nbsp;&nbsp;</li>
	</ul>
	<div class="totop">
		<a href="#" title="맨위로">▲ <spring:message code="on_top" /></a>
	</div>
	<ul class="midas_info">
		<li class="address"><spring:message code="address" /> <span class="postcode">(13487)</span></li>
		<li class="contact"><spring:message code="contact" /> <span class="tel">031-789-2000</span> /<spring:message code="fax" /><span class="fax">031-789-2001</span> /<spring:message code="email" /> <span class="e-mail"><a href="mailto:webmaster@midasit.com">webmaster@midasit.com</a></span></li>
		<li class="copyright"><span class="copyright">Copyright &copy; SINCE 1989 MIDAS Information Technology Co., Ltd. All rights reserved.</span></li>
	</ul>
	
</div>   
</body>
</html>