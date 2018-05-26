<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
<title>MIDAS</title>
</head>
<script>
function add() {
	  // Get the checkbox
	  var checkBox = document.getElementById("list1");
	  var table = document.getElementById("buy");
	  // Get the output text
	  if (checkBox.checked == true){
		  var row = table.insertRow(1);
		  var cell1 = row.insertCell(0);
		  var cell2 = row.insertCell(1);
		  var cell3 = row.insertCell(1);
		  cell1.innerHTML = "NEW CELL1";
		  cell2.innerHTML = "NEW CELL2";
		  cell3.innerHTML = "NEW CELL3";
		  } else {
			  table.deleteRow(1);
		  }
	  // If the checkbox is checked, display the output text
	 
	  
	}
</script>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
	</div>
	 <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	
          <h2 class="sub-header">Menu</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>name</th>
                  <th>image</th>
                  <th>price</th>
                  <th>detail</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><input id="list1" type="checkbox" value="" onclick="add()"></td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                
              </tbody>
            </table>
          </div>
       </div>
       
       <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
       <h2 class="sub-header">구매 내역</h2>
          <div class="table-responsive">
            <table id="buy" class="table table-striped">
              <thead>
                <tr>
                  <th>name</th>
                  <th>price</th>
                  <th>number</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
       </div>
      
	<div class="wrap">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>