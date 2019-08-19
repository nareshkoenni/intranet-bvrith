
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker().datepicker("setDate", new Date());
  });
  </script>
  <script type="text/javascript">
  	function courseValid(){
  		var course=postattendance.course.value;
  		if(course=="choose"){
  			alert("Please Choose Course");
  			//postattendance.course.focus();
  			//return true;  
  		}
  		
  	}
  </script>
 <script type="text/javascript">
 
 function showCustomer() {
	   //alert("Hi");
	  var xhttp; 
	  var branch=postattendance.branch.value;
	  var sem=postattendance.sem.value;
	  var section=postattendance.section.value;
	  var uid=postattendance.uid.value;
	 // alert(branch);
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
		  
	    if (this.readyState == 4 && this.status == 200) {
	    var x=document.getElementById("txtHint");
	  //  var option=document.createElement("option");
	    var te=this.responseText;
	    var a=te.split(",");
	    for(var i=0;i<a.length-1;i++){
	  //  alert(a);
	    var option=document.createElement("option");
		option.text=a[i].toString();
	    x.add(option);
	    }
	    }
	  };
	  xhttp.open("GET", "getcustomer.jsp?branch="+branch+"&sem="+sem+"&section="+section+"&uid="+uid, true);
	  xhttp.send();
	}
 </script>
</head>
<!-- <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1><h4 align="right"><a href="index.html">Logout</a></h4> -->

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/postAttendanceDisplay.jsp?uid=<%=uid%>" name="postattendance" method="post">
	<h3 align="center" class="bars">Post Attendance</h3><br>
	
	<table align="center">	
		<tr>
			<td>Date</td>
			<td><input type="text" id="datepicker" name="date" placeholder="mm/dd/yyyy" class="form-control" required="required"/></td>		
		
		</tr>
		<tr>
			<td>Program</td>
			<td><select name="program" class="btn btn-default dropdown-toggle"  >
				<option value="btech">B.Tech</option></select></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="hidden"  name="uid" value="<%=uid%>" class="form-control"/></td>	
		</tr>
		<tr>
			<td>Semester</td>
			<td><select name="sem" class="btn btn-default dropdown-toggle" >
				<option value="1/4Sem-I">1/4Sem-I</option>
				<option value="1/4Sem-II">1/4Sem-II</option>
				<option value="2/4Sem-I">2/4Sem-I</option>
				<option value="2/4Sem-II">2/4Sem-II</option>
				<option value="3/4Sem-I">3/4Sem-I</option>
				<option value="3/4Sem-II">3/4Sem-II</option>
				<option value="4/4Sem-I">4/4Sem-I</option>
				<option value="4/4Sem-II">4/4Sem-II</option>
			
			
			</select></td>		
		</tr>
		<tr>
			<td>Branch</td>
			<td><select name="branch" class="btn btn-default dropdown-toggle">
				<option value="cse">CSE</option>
				<option value="ece">ECE</option>
				<option value="eee">EEE</option>
				<option value="it">IT</option>
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section"  class="btn btn-default dropdown-toggle">
				<option value="select">Select</option>
				<option value="section1">Section1</option>
				<option value="section2">Section2</option>
				</select>
				
			<input type="button" value="Get Course" onclick="showCustomer()" ></td>	
		</tr>
		<tr>
			<td>Course</td>
			<td><select id="txtHint" name="course" class="btn btn-default dropdown-toggle" onblur="courseValid()">
				<!-- <option value="choose">Choose</option> -->
			</select></td>
		</tr>
		<tr>
    		
			<td><input type="reset" value="Clear" class="form-control"> </td>
			<td><input type="submit" value="Show" class="form-control" /></td>
		</tr>
	</table>



</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>