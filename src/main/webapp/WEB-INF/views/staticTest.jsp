<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.madis.www.model.dto.StaticInfo"%>
<%@ page import="java.util.*"%>
<% 
    
  	String start = (String)request.getAttribute("start");
	String end = (String)request.getAttribute("end");
	String searchFood = (String)request.getAttribute("searchFood");
	ArrayList<StaticInfo> list = (ArrayList<StaticInfo>)request.getAttribute("staticList");
	ArrayList<StaticInfo> list2 = (ArrayList<StaticInfo>)request.getAttribute("searchList");
	
	System.out.println("start : "+start+" end : "+ end);
	System.out.println("searchFood : "+searchFood);

	/*
	for (StaticInfo si : list2) {
		System.out.println(si.getFood());
	}
	*/
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<head>
		<title>Bootstrap datepicker demo</title>
		
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		
		<link rel="stylesheet" href="/css/jquery-ui.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
		
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
		
		<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
		
		<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
		
		<!-- google graph -->
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		
		<!-- star rating -->
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
		
		<script type='text/javascript'>
			window.onload = function() {
				var startDateFields = document.getElementById("start");
				var endDateFields = document.getElementById("end");
				
				startDateFields.value = '<%=start%>';
				endDateFields.value = '<%=end%>';
			};
		    
			$(function(){
			    $('.input-group.date').datepicker({
			        calendarWeeks: false,
			        todayHighlight: true,
			        autoclose: true,
			        format: "yyyy-mm-dd",
			        language: "kr"
			    });
			});
			    
			//Make sure that the dom is ready
			$(function () {
			 
			  $("#rateYo").rateYo({
			    rating: 3.6,
			    starWidth: "40px"
			  });
			 
			});
			
			$.fn.datepicker.dates['kr'] = {
				days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
				daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
				daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			};
			
			// chart!!
			
			// Load Charts and the corechart package.
			google.charts.load('current', {'packages':['corechart']});
			
			// Draw charts when Charts is loaded.
			google.charts.setOnLoadCallback(drawchart1);
			google.charts.setOnLoadCallback(drawchart2);
			google.charts.setOnLoadCallback(drawchart3);
			google.charts.setOnLoadCallback(drawchart4);
			
			// Callback that draws the pie chart for Sarah's pizza.
			function drawchart1() {
				var data = google.visualization.arrayToDataTable([
			          ['Year', 'Sales', 'Expenses'],
			          ['2004',  1000,      400],
			          ['2005',  1170,      460],
			          ['2006',  660,       1120],
			          ['2007',  1030,      540]
			        ]);
		
			    var options = {
			      title: 'Company Performance',
			      curveType: 'function',
			      legend: { position: 'bottom' }
			    };
			
			    var chart = new google.visualization.LineChart(document.getElementById('chart1_div'));
			
			    chart.draw(data, options);
			}
			
			// Callback that draws the pie chart for Anthony's pizza.
			function drawchart2() {
				
				var data = google.visualization.arrayToDataTable([
					["음식", "별점", { role: "style" } ],
					<% for (StaticInfo si : list) { %>
			        	['<%=si.getFood()%>',<%=si.getStar()%>,"gold"],
			        <% } %>
			      ]);
			
			    var view = new google.visualization.DataView(data);
			    view.setColumns([0, 1,
			                     { calc: "stringify",
			                       sourceColumn: 1,
			                       type: "string",
			                       role: "annotation" },
			                     2]);
			
			    var options = {
			      title: "음식들의 별점 상위권",
			      bar: {groupWidth: "95%"},
			      legend: { position: "none" },
			    };
			    var chart = new google.visualization.ColumnChart(document.getElementById("chart2_div"));
			    chart.draw(view, options);
			}
			
			// Callback that draws the pie chart for Anthony's pizza.
			function drawchart3() {
		
				var data = google.visualization.arrayToDataTable([
			        ['식', '별점'],
			        ['김치', 3.4],
			        ['맛탕', 4],
			        ['제육', 5],
			        ['초코', 2.2],
			        ['아이스크림', 3],
			        ['메추리알', 1],
			        ['연어', 3],
			        ['초밥', 5],
			        ['라면', 1],
			        ['불닭볶음면', 3.7],
			        ['햇반', 4],
			        ['달걀후라이', 2],
			        ['소세지', 1],
			        ['핫도그', 3]
			    ]);
		
		        var options = {
		          title: '식단 만족도 histogram',
		          legend: { position: 'none' },
		          hAxis: {
		          	ticks: [1, 2, 3, 4, 5]
		          },
		        };
		
		        var chart = new google.visualization.Histogram(document.getElementById('chart3_div'));
		        chart.draw(data, options);
			}
			
			// Callback that draws the pie chart for Anthony's pizza.
			function drawchart4() {
				
				// Create the data table for Anthony's pizza.
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'Topping');
				data.addColumn('number', 'Slices');
				data.addRows([
					['Mushrooms', 2],
					['Onions', 2],
					['Olives', 2],
					['Zucchini', 0],
					['Pepperoni', 3]
				]);
				
				// Set options for Anthony's pie chart.
				var options = {title:'How Much Pizza Anthony Ate Last Night'};
				
				// Instantiate and draw the chart for Anthony's pizza.
				var chart = new google.visualization.PieChart(document.getElementById('chart4_div'));
				chart.draw(data, options);
			}
			
			// 좋아요 기능을 위한 코드

			$(document).ready(function(){
			
				$(".btn").on("click", function(){
				    $(".btn").removeClass("btn-primary");
				    $(this).addClass("btn-primary");
				    refresh();
				});
			});
			    
		</script>
	</head>
	<body>
		<div class="container">
			<h1>Bootstrap datepicker (start : <%=start %> - end : <%= end %>)</h1>
			<form action="staticTest" method="get" class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">시작날짜</label>
					<div class="input-group date">
						<input type="text" class="form-control" name="start" id="start"><span
							class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail2">종료날짜</label>
					<div class="input-group date">
						<input type="text" class="form-control" name="end" id="end"><span
							class="input-group-addon"><i
							class="glyphicon glyphicon-calendar"></i></span>
					</div>
				</div>
				<button type="submit" class="btn btn-default">전송</button>
			</form>
		</div>
		<div style="height: 50px;"></div>
		<div class="container">
			<table class="table table-bordered">
				<tr>
					<td style="width: 50%"><div id="chart1_div"></div></td>
					<td style="width: 50%"><div id="chart2_div"></div></td>
				</tr>
				<tr>
					<td style="width: 50%"><div id="chart3_div"></div></td>
					<td style="width: 50%"><div id="chart4_div"></div></td>
				</tr>
			</table>
		</div>
		<div style="height: 50px;"></div>
		<div class="container">
			<form action="staticTest" method="get" class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">음식 검색</label>
					<div class="input-group">
						<input type="text" class="form-control" name="searchFood" id="searchFood">
					</div>
					<button type="submit" class="btn btn-primary">검색</button>
				</div>
			</form>
			<div style="height: 50px;"></div>
			<table class="table table-bordered">
				<tr>
					<td style="width: 100%">"<%=searchFood %>"로 검색하였습니다.</td>
				</tr>
				<% for (StaticInfo si : list2) { %>
				<tr>
					<td style="width: 100%"><%= si.getFood() %></td>
				</tr>
				<% } %>
			</table>
		</div>
		<div style="height: 50px;"></div>
		<div class="container">
			<button type="button" class="btn btn-default btn-lg">
			  <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 좋아요!
			</button>
			<button type="button" class="btn btn-default btn-lg">
			  <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span> 싫어요!
			</button>
		</div>
	</body>
</html>


