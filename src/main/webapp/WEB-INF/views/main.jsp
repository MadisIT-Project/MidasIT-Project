<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet"
	href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/css/flexslider.css"
	type="text/css" media="screen" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')
</script>

<!-- FlexSlider -->
<script defer src="/resources/js/jquery.flexslider.js"></script>

<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.all();
	});
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});
	});
</script>
<style>
.entry-title {
	margin-left: 20%;
}

#content1 {
	float: left;
	margin-top: 10px;
	margin-left: 15%;
	display: inline;
	margin-right: 50px;
}

#content2 {
	margin-top: 10px;
	float: left;
	display: inline;
	margin-left: 50px;
}
</style>
<title>MIDAS</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="common/header.jsp"></jsp:include>

		<div id="main" role="main" style="height:800px;">
			<section class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li><img src="/resources/image/cafe/cafeimage1.jpg" /></li>
					<li><img src="/resources/image/cafe/cafeimage2.jpg" /></li>
					<li><img src="/resources/image/cafe/cafeimage3.jpg" /></li>

				</ul>
			</div>
			</section>
			<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2">
				<h1 class="entry-title">
					<a href="#">Strawberries
						&#038; Matcha Smoothie</a>
				</h1>
				<div id="content1" class="entry-content">
					<p>
						<a
							href="#"><img
							src="/resources/image/cafe/cafemoca.png"
							alt="3月20日" width="300" height="240"
							class="alignnone size-medium wp-image-194" /></a>
					</p>
				</div>
				<div id="content2" class="entry-content">
	
					<p>
						<strong>A perfect drink to celebrate spring ♪</strong><br />
						Strawberries blended with honey &#038; matcha!
					</p>
					<p>
						<em>Ingredients for one serving:</em><br /> 15 small sized
						strawberries<br /> 150ml almond milk<br /> 3g matcha<br /> 1
						teaspoon honey
					</p>
					<p>
						<em>Directions:</em><br /> ①Cut strawberries and place in electric
						blender.<br /> ②Add almond milk, matcha and honey.<br /> ③Blend
						until smooth and enjoy!
					</p>
					<p>
						<strong>Garnish with mint leaves for decoration★ </strong>
					</p>
				</div>
			</div>
			<!-- .entry-content -->
		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>
</body>
</html>