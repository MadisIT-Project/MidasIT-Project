<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/map.css" /> 
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<script async defer type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhGHFO9pQBtVbE4YBzAxn-78HUiozJwpg&callback=initMap"></script>
<script>
var map;
var midas = {lat:37.400872, lng: 127.101356};

function initMap() {
    var cen ={lat:37.400872, lng: 127.101356};
	map = new google.maps.Map(document.getElementById('googlemap'), {
		center : cen,
		zoom: 17
	});
	marker = new google.maps.Marker({
		position : cen,
		map: map
	});
}</script>
<style>
#googlemap{
	margin-left: 20%;
	width: 66.66666667%;
	height: 500px;
	margin-top:20px;
	margin-bottom:20px;
}
</style>
<title>Insert title here</title>
</head>
<body><div class="wrap">
		<jsp:include page="common/header.jsp"></jsp:include>
	</div>
	<div id="googlemap" ></div>
	<div class="wrap">
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>