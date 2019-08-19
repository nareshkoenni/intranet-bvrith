<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  

  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
  
  <script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
  $http.get("one.json").then(function (response) {
      $scope.myData = response.data.subjects;
  });
});
</script>
 <script type="text/javascript">
 function showCustomer() {
	   //alert("Hi");
	  var xhttp; 
	  var branch=postattendance.branch.value;
	  var sem=postattendance.sem.value;
	  var section=postattendance.section.value;
	 // alert(branch);
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    //	alert(this.responseText);
	  //  document.getElementById("txtHint").value = this.responseText;
	    var x=document.getElementById("txtHint");
	  //  var option=document.createElement("option");
	    var te=this.responseText;
	    var a=te.split(",");
	    for(i=0;i<a.length-1;i++){
	  //  alert(a);
	    var option=document.createElement("option");
	    	    
	option.text=a[i].toString();
	    x.add(option);
	    }
	    }
	  };
	  xhttp.open("GET", "getSurveyCourses.jsp?branch="+branch+"&sem="+sem+"&section="+section, true);
	  xhttp.send();
	}
</script>
</head>

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/courseEndSurvey1.jsp?uid=<%=uid%>" name="postattendance" method="post">
	<h3 align="center" class="bars">Course End Survey</h3>
	<table align="center">	
		<tr>
			<td>Date</td>
			<td><input type="text" id="datepicker" name="date" placeholder="mm/dd/yyyy" required="required"/></td>		
		</tr>
		<tr>
			<td>Program</td>
			<td><select name="program">
				<option value="btech">B.Tech</option>
				</select>
		</tr>
		<tr>
			<td>Semester</td>
			<td><select name="sem" required="required">
				<option value="">Select</option>
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
			<td><select name="branch" required="required">
				<option value="" >Select</option>
				<option value="ece" >ECE</option>
				<option value="cse" >CSE</option>
				<option value="eee" >EEE</option>
				<option value="it">IT</option>
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section" onchange="showCustomer()" required="required">
				<option value="">Select</option>
				<option value="section1">Section1</option>
				<option value="section2">Section2</option>
				</select>
			</td>		
		</tr>
		<tr>
			<td>Course</td>
			<td><select id="txtHint" name="course" required="required">
				<option value="">Choose</option>
			</select></td>
		</tr>
		<tr>
    		<td><input type="submit" value="Show"/></td>
			<td><input type="reset" value="Clear"> </td>
		</tr>
</table>
</form>
</div>
		</div>
	</div>
<%@include file="footer.html" %>
</body>