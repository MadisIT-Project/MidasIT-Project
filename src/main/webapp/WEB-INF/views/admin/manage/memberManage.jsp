<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function changeadminSelect(){
	var langSelect = document.getElementById("admin");
	                 
	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	             
	              
	var selectText = langSelect.options[langSelect.selectedIndex].text;
	}
</script>
<title>MIDAS</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	
          <h2 class="sub-header">회원 관리</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>no</th>
                  <th>id</th>
                  <th>name</th>
                  <th>email</th>
                  <th>admin</th>
                  <th>date</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td><select id="admin" name="admin" onchange="changeadminSelect()">
					        <option value="1">1</option>
					        <option value="2">2</option>
				</select></td>
				<td>dolor</td>
				<td><button>x</button></td>
                </tr>
                
              </tbody>
            </table>
          </div>
       </div>
       
	<div class="wrap">
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>