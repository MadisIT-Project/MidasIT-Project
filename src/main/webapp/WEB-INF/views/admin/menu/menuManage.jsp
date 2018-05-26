<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
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
	display : inline;
	display :none;
}
#minusbtn{
	float:right;
	display : inline;
	display :none;
}
#add{
float: right;
display :none;
}
</style>

<script>

function menu(){
	$("#plus").hide();
	$("#add").hide();
	$("#plusbtn").hide();
	$("#minusbtn").hide();
	$("#info").show();
	
	
}
function plus(){
	$("#info").hide();
	$("#add").show();
	$("#plusbtn").show();
	$("#minusbtn").show();
	$("#plus").show();
	
	
}

function plusmenu() {
		var table = document.getElementById("plusmenu");
	  // Get the output text
	  var len=table.rows.length;
		var row = table.insertRow(len);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);

		cell1.innerHTML = "<input name='name' class='name' value='name' placeholder='name'  class='form-control' />";
		cell2.innerHTML = "<input name='price' class='price' value='price' placeholder='price'  class='form-control' />";
		cell3.innerHTML = "<input name='detail' type='textarea' class='detail' value='detail' placeholder='detail'  class='form-control' />";
		cell4.innerHTML = '<form id="profile_frm" class="columns js-uploadable-container js-upload-avatar-image is-default" action="/mypage/upload?${_csrf.parameterName}=${_csrf.token}" encType="multipart/form-data" method="post"><div class=""><input class="attachment" name="attachment" type="file" class=""></div></form>';
}
function minusmenu() {
	var table = document.getElementById("plusmenu");
  // Get the output text
  var len=table.rows.length;
  table.deleteRow(len-1);
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
	    <li id="plusbtn"><button onclick="plusmenu()"  value="plus">+</button></li>
	    <li id="minusbtn"><button onclick="minusmenu()"  value="minus">-</button></li>  
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
                  
                  <td><input name="name" class="name" value='name' placeholder="name"  class="form-control" /></td>
                  <td><input name="price" class="price" value='price' placeholder="price"  class="form-control" /></td>
                  <td><input name="detail" type="textarea" class="detail" value='detail' placeholder="detail"  class="form-control" /></td>
                  <td><form id="profile_frm" class="columns js-uploadable-container js-upload-avatar-image is-default" action="/mypage/upload?${_csrf.parameterName}=${_csrf.token}" encType="multipart/form-data" method="post">
                 		<div class="">
							<input class="attachment" name="attachment" type="file" class="">
						</div>
						</form>
				</td>
                  
               
                </tr>
              </tbody>
            </table>
          </div>
          <button id="add"  value="add">add</button>
	 </div>
	


	<div class="wrap">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>