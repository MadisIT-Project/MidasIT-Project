<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			$.ajax({
	            url: "/user/statistic/getMonth",
	            type: 'POST',
	            data: {user_id : 1 , month : "2018-06-03" },
	            beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
	            success: function(response){
	            		var static_list = response.static_list;
	            		var menu_list = response.menu_list;
	            		console.log(static_list);
	            		console.log(menu_list);
	            		
	            		// 구글 그래프 가져오기
	            		google.charts.load('current', {'packages':['corechart']});
	            	      google.charts.setOnLoadCallback(drawChart1);
	            	      google.charts.setOnLoadCallback(drawChart2);
	
	            	      function drawChart1() {
						console.log(menu_list[0].name);
						console.log(menu_list.name);
	            	        
	            	         var temp = [];
	            	         temp.push(['Task', 'Hours per Day']);
	            		console.log(static_list.length);
            	          for (i=0 ; i < static_list.length; i++){
            	        	  	console.log("i : " + i);
            	        	 	console.log(menu_list[i]);
            	        	  	var t = [];
            	        	  	t.push(menu_list[i].name);
            	        	  	t.push(static_list[i].b);
            	          	temp.push(t);
            	          }
            	          
            	          console.log(temp);
	
            	          var data = google.visualization.arrayToDataTable(temp);
	            	        var options = {
	            	          title: 'My Daily Activities'
	            	        };
	
	            	        var chart = new google.visualization.PieChart(document.getElementById('chart1_div'));
	
	            	        chart.draw(data, options);
	            	      }
	            	      
	            	      function drawChart2() {
	            	    		
		            	        var data = google.visualization.arrayToDataTable([
		            	        	
		            	          ['Task', 'Hours per Day'],
		            	          ['Work',     11],
		            	          ['Eat',      2],
		            	          ['Commute',  2],
		            	          ['Watch TV', 2],
		            	          ['Sleep',    7]
		            	        ]);
		
		            	        var options = {
		            	          title: 'My Daily Activities'
		            	        };
		
		            	        var chart = new google.visualization.PieChart(document.getElementById('chart2_div'));
		
		            	        chart.draw(data, options);
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


	// 그래프 가져오기	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	// Draw charts when Charts is loaded.
	google.charts.setOnLoadCallback(drawchart1);
	google.charts.setOnLoadCallback(drawchart2);
	function drawchart1() {
		var data = google.visualization.arrayToDataTable([
			[ 'Year', 'Sales', 'Expenses' ],
			[ '2004', 1000, 400 ],
			[ '2005', 1170, 460 ],
			[ '2006', 660, 1120 ],
			[ '2007', 1030, 540 ]
		]);
		var options = {
			title : 'Company Performance',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};
		var chart = new google.visualization.LineChart(document.getElementById('chart1_div'));
		chart.draw(data, options);
	}
	
	function drawchart2() {
		var data = google.visualization.arrayToDataTable([
			[ 'Year', 'Sales', 'Expenses' ],
			[ '2004', 1000, 400 ],
			[ '2005', 1170, 460 ],
			[ '2006', 660, 1120 ],
			[ '2007', 1030, 540 ]
		]);
		var options = {
			title : 'Company Performance',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};
		var chart = new google.visualization.LineChart(document.getElementById('chart2_div'));
		chart.draw(data, options);
	}
	
	function changetermSelect() {
		var langSelect = document.getElementById("term");

		var selectValue = langSelect.options[langSelect.selectedIndex].value;


		var selectText = langSelect.options[langSelect.selectedIndex].text;
	}
</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<select id="term" name="term" onchange="changetermSelect()">
			<option value="" selected disabled>월/기간</option>
			<option value="month">월</option>
			<option value="during">기간</option>
		</select>
	</div>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<button id="month-btn" type="button" class="btn btn-default">월별 버튼</button>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<button id="between-btn" type="button" class="btn btn-default">사이 버튼</button>
	</div>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">Dashboard</h1>

		<div class="row placeholders">
			<div class="col-xs-6 col-sm-3 placeholder">
				<span class="text-muted""width: 50%"><div id="chart1_div"></div></span>
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<span class="text-muted""width: 50%"><div id="chart2_div"></div></span>
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">Something else</span>
			</div>
		</div>

		<h2 class="sub-header">Section title</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Header</th>
						<th>Header</th>
						<th>Header</th>
						<th>Header</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1,001</td>
						<td>Lorem</td>
						<td>ipsum</td>
						<td>dolor</td>
						<td>sit</td>
					</tr>

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
