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

<title>MIDAS</title>
<style type="text/css">
.image-upload{
	width:50;
	}
#plus{
 display : none;
}
#plusbtn{
	float:right;
	display :none;
}
</style>

<script>
function menu(){
	$("#plus").hide();
	$("#plusbtn").hide();
	$("#info").show();
	
	
}
function plus(){
	$("#info").hide();
	$("#plusbtn").show();
	$("#plus").show();
	
	
}
function plusmenu() {
		var table = document.getElementById("plusmenu");
	  // Get the output text
	  
		  var row = table.insertRow(1);
		  var cell1 = row.insertCell(0);
		  var cell2 = row.insertCell(1);
		  var cell3 = row.insertCell(1);
		  cell1.innerHTML = "NEW CELL1";
		  cell2.innerHTML = "NEW CELL2";
		  cell3.innerHTML = "NEW CELL3";
		  
		  }


</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../../common/header.jsp"></jsp:include>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container">
	  <h3>메뉴 관리</h3>
	  <ul class="list-inline">
	    <li><a href="#" onclick="menu()">조회</a></li>
	    <li><a href="#" onclick="plus()">추가</a></li>
	    <li id="plusbtn"><button  onclick="plusmenu()" value="plus">+</button></li>  
	  </ul>
	 </div>
	 
	 <div id="info" class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  
                  <th>name</th>
                  <th>price</th>
                  <th>detail</th>
				  <th>image</th>
				  <th>#</th>
              </thead>
              <tbody>
                <tr>
                  
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                  <td><button id="list1"  value="Modified">Modified</button></td>
                  <td><button id="list2"  value="Remove">Remove</button></td>
                </tr>
                
              </tbody>
            </table>
          </div>
           <div id="plus" class="table-responsive" >
            <table id="plusmenu" class="table table-striped">
              <thead>
                <tr>
                  
                  <th>name</th>
                  <th>price</th>
                  <th>detail</th>
				  <th>image</th>
				  <th>#</th>
              </thead>
              <tbody>
               
                 <tr>
                  
                  <td><input name="name" id="name" value='name' placeholder="name"  class="form-control" /></td>
                  <td><input name="price" id="price" value='price' placeholder="price"  class="form-control" /></td>
                  <td><input name="detail" type="textarea" id="detail" value='detail' placeholder="detail"  class="form-control" /></td>
                  <td><form id="profile_frm" class="columns js-uploadable-container js-upload-avatar-image is-default" action="/mypage/upload?${_csrf.parameterName}=${_csrf.token}" encType="multipart/form-data" method="post">
                 		<div class="">
							<input id="attachment1" name="attachment1" type="file" class="">
						</div>
						</form>
				</td>
                  
               
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