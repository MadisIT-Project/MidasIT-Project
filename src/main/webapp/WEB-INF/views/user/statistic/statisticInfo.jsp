<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<sec:authentication var="user" property="principal" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MIDAS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet"
	href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>


<!-- google graph -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!-- star rating -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

<!-- 라이브러리 로드 순서는 아래와 같다. cdnjs 저장소에서 라이브러리를 로드하였다. -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
	// 검색
	$(document).ready(function() {

		$('#month-btn').on("click", function() {
			var yearSelect = document.getElementById("year");
			var year = yearSelect.options[yearSelect.selectedIndex].value;
			var monthSelect = document.getElementById("month");
			var month = monthSelect.options[monthSelect.selectedIndex].value;
			$.ajax({
	            url: "/user/statistic/getMonth",
	            type: 'POST',
	            data: {user_id : ${user.index} , month : year+"-"+month+"-01" },
	            beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
	            success: function(response){
	            		var static_list = response.static_list;
	            		var menu_list = response.menu_list;
	            		console.log(static_list);
	            		console.log(menu_list);
	            		console.log(response.isdata);
	            		
	            		if (response.isdata == 1){
	            			
	            			for (i=0 ; i < static_list.length; i++){
		            			$("#put").append("<tr><td>" + menu_list[i].name + "</td><td>" + static_list[i].count +"</td><td>" + static_list[i].price*menu_list[i].price + "</td></tr>");
		            		}
	            			
	            			console.log("getin");
	            			
	            		// 구글 그래프 가져오기
	            		google.charts.load('current', {'packages':['corechart']});
	            	      google.charts.setOnLoadCallback(drawChart1);
	            	      google.charts.setOnLoadCallback(drawChart2);
	
	            	      function drawChart1() {
						console.log(menu_list[0].name);
						console.log(menu_list.name);
	            	        
	            	         var temp = [];
	            	         var end = 5;
	            	         if (end > static_list.length){
	            	        	 	end = static_list.length
	            	         }
	            	         temp.push(['Task', 'Hours per Day']);
	            		console.log(static_list.length);
            	          for (i=0 ; i < end; i++){
            	        	  	console.log("end :" + end + " i : " + i);
            	        	 	console.log(menu_list[i]);
            	        	  	var t = [];
            	        	  	t.push(menu_list[i].name);
            	        	  	t.push(static_list[i].count);
            	          	temp.push(t);
            	          }
            	          
            	          console.log(temp);
	
            	          var data = google.visualization.arrayToDataTable(temp);
	            	        var options = {
	            	          title: 'My Daily Activities',
	            	          width: 600,
          	    	        	height: 400
	            	        };
	            	        var chart = new google.visualization.PieChart(document.getElementById('chart1_div'));
	
	            	        chart.draw(data, options);
	            	      }
	            	      
	            	      function drawChart2() {
	            	    	  
	            	    	  var temp = [];
	            	    	  var color = ["#b87333", "silver","gold", "color: #e5e4e2","#b87333"  ];
		            	         var end = 5;
		            	         if (end > static_list.length){
		            	        	 	end = static_list.length
		            	         }
		            	         temp.push(["Element", "Density", { role: "style" } ]);
		            		console.log(static_list.length);
	            	          for (i=0 ; i < end; i++){
	            	        	  	console.log("end :" + end + " i : " + i);
	            	        	 	console.log(menu_list[i]);
	            	        	  	var t = [];
	            	        	  	t.push(menu_list[i].name);
	            	        	  	t.push(static_list[i].price * menu_list[i].price);
	            	        	  	t.push(color[i]);
	            	          	temp.push(t);
	            	          }
	            	    	  
	            	    		
	            	    	  var data = google.visualization.arrayToDataTable(temp);

	            	    	      var view = new google.visualization.DataView(data);
	            	    	      /*
	            	    	      view.setColumns([0, 1,
	            	    	                       { calc: "stringify",
	            	    	                         sourceColumn: 1,
	            	    	                         type: "string",
	            	    	                         role: "annotation" },
	            	    	                       2,3]);
						*/
	            	    	      var options = {
	            	    	        title: "Density of Precious Metals, in g/cm^3",
	            	    	        width: 600,
	            	    	        height: 400,
	            	    	        bar: {groupWidth: "95%"},
	            	    	        legend: { position: "none" },
	            	    	      };
	            	    	      var chart = new google.visualization.ColumnChart(document.getElementById("chart2_div"));
	            	    	      chart.draw(view, options);
		            	      }
	            		}
	            		else{
	            			$("#put").html('');
	            			$("#section").html("출력이 되지 않습니다.");
	            		}
	            },
	            error: function(error){
	                console.log(error);
	            }
	        });
		});

		$('#between-btn').on("click", function() {
			
			$.ajax({
	            url: "/user/reservation/insert",
	            type: 'POST',
	            data: {user_id : $("#comment").val(), menu_id : $("#p_id").val(), num : 123 },
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
	});

	window.onload = function () {
		var yearSelect = document.getElementById("year");
		
		var today = new Date();
		console.log(today);
		console.log(today.getMonth()+1);
		
		var monthSelect = document.getElementById("month");
		monthSelect.options[today.getMonth()+1].selected = true;
		
		month = monthSelect.options[monthSelect.selectedIndex].value;
		console.log(month);
		
		var yearSelect = document.getElementById("year");
		var year = yearSelect.options[yearSelect.selectedIndex].value;
		var monthSelect = document.getElementById("month");
		var month = monthSelect.options[monthSelect.selectedIndex].value;
		$.ajax({
            url: "/user/statistic/getMonth",
            type: 'POST',
            data: {user_id : ${user.index} , month : year+"-"+month+"-01" },
            beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
            success: function(response){
            		var static_list = response.static_list;
            		var menu_list = response.menu_list;
            		console.log(static_list);
            		console.log(menu_list);
            		console.log(response.isdata);
            		
            		if (response.isdata == 1){
            			
            			for (i=0 ; i < static_list.length; i++){
	            			$("#put").append("<tr><td>" + menu_list[i].name + "</td><td>" + static_list[i].count +"</td><td>" + static_list[i].price*menu_list[i].price + "</td></tr>");
	            		}
            			
            			console.log("getin");
            			
            		// 구글 그래프 가져오기
            		google.charts.load('current', {'packages':['corechart']});
            	      google.charts.setOnLoadCallback(drawChart1);
            	      google.charts.setOnLoadCallback(drawChart2);

            	      function drawChart1() {
					console.log(menu_list[0].name);
					console.log(menu_list.name);
            	        
            	         var temp = [];
            	         var end = 5;
            	         if (end > static_list.length){
            	        	 	end = static_list.length
            	         }
            	         temp.push(['Task', 'Hours per Day']);
            		console.log(static_list.length);
        	          for (i=0 ; i < end; i++){
        	        	  	console.log("end :" + end + " i : " + i);
        	        	 	console.log(menu_list[i]);
        	        	  	var t = [];
        	        	  	t.push(menu_list[i].name);
        	        	  	t.push(static_list[i].count);
        	          	temp.push(t);
        	          }
        	          
        	          console.log(temp);

        	          var data = google.visualization.arrayToDataTable(temp);
            	        var options = {
            	          width: 600,
      	    	        	height: 400
            	        };
            	        var chart = new google.visualization.PieChart(document.getElementById('chart1_div'));

            	        chart.draw(data, options);
            	      }
            	      
            	      function drawChart2() {
            	    	  
            	    	  var temp = [];
            	    	  var color = ["#b87333", "silver","gold", "color: #e5e4e2","#b87333"  ];
	            	         var end = 5;
	            	         if (end > static_list.length){
	            	        	 	end = static_list.length
	            	         }
	            	         temp.push(["Element", "Density", { role: "style" } ]);
	            		console.log(static_list.length);
            	          for (i=0 ; i < end; i++){
            	        	  	console.log("end :" + end + " i : " + i);
            	        	 	console.log(menu_list[i]);
            	        	  	var t = [];
            	        	  	t.push(menu_list[i].name);
            	        	  	t.push(static_list[i].price * menu_list[i].price);
            	        	  	t.push(color[i]);
            	          	temp.push(t);
            	          }
            	    	  
            	    		
            	    	  var data = google.visualization.arrayToDataTable(temp);

            	    	      var view = new google.visualization.DataView(data);
            	    	      /*
            	    	      view.setColumns([0, 1,
            	    	                       { calc: "stringify",
            	    	                         sourceColumn: 1,
            	    	                         type: "string",
            	    	                         role: "annotation" },
            	    	                       2,3]);
					*/
            	    	      var options = {
            	    	        width: 600,
            	    	        height: 400,
            	    	        bar: {groupWidth: "95%"},
            	    	        legend: { position: "none" },
            	    	      };
            	    	      var chart = new google.visualization.ColumnChart(document.getElementById("chart2_div"));
            	    	      chart.draw(view, options);
	            	      }
            		}
            		else{
            			$("#put").html('정보가 없습니다.');
            			$("#section").html("정보가 없습니다.");
            		}
            },
            error: function(error){
                console.log(error);
            }
        });
	}
	
	function changetermSelect() {
		var langSelect = document.getElementById("term");

		var selectValue = langSelect.options[langSelect.selectedIndex].value;


		var selectText = langSelect.options[langSelect.selectedIndex].text;
	}
</script>
<style>
#selected {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>

	<div id="selected"
		class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<select id="year" name="term">
			<option value="2018">2018</option>
			<option value="2017">2017</option>
			<option value="2016">2016</option>
			<option value="2015">2015</option>
		</select> <span>년 </span> <select id="month" name="term1">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>

		</select> <span>월 </span>
		<button id="month-btn" type="button" class="btn btn-default">월별
			버튼</button>
	</div>


	<div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-2 main">
		<h1 class="page-header">Dashboard</h1>

		<div class="row placeholders" id="section">
			<div class="col-xs-4 col-sm-3 placeholder">
				<h4> 월별 상품 BEST 5</h4>
				<span class="text-muted""width: 50%"><div id="chart1_div"></div></span>
				<span class="text-muted">월별로 가장 많이 쓴 상품 5개를 보여준다.</span>
			</div>
			<div class="col-xs-offset-3 col-xs-4 col-sm-3 placeholder">
				<h4> 월별 소비 내역 BEST 5</h4>
				<span class="text-muted""width: 50%"><div id="chart2_div"></div></span>
				<span class="text-muted">월별로 가장 많이 소비한 상품 5개 보여준다.</span>
			</div>
		</div>

		<h2 class="sub-header">월별 구매내역</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>menu</th>
						<th>num</th>
						<th>price</th>
					</tr>
				</thead>
				<tbody id="put">
				</tbody>
			</table>
		</div>
	</div>
	</div>
	</div>
	<div class="wrap">
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>
