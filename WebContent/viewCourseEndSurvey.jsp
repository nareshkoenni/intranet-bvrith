<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
   <script type="text/javascript">
  	function dateValid(){
  		var date=postattendance.date.value;
  		if(date=="click here" || date==""){
  			alert("Please Choose date");
  			postattendanceDisplay.date.focus();
  	  	}
  		return false;
  	}
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
<!-- <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1> -->

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewCourseEndSurvey1.jsp?uid=<%=uid%>" name="postattendance" method="post">
	<h3 class="bars" align="center"> View Course End Survey</h3>
	<table align="center">	
		<tr>
			<td>Program</td>
			<td><select name="program" class="btn btn-default dropdown-toggle">
				<option value="btech">B.Tech</option>
				</select>
		</tr>
		<tr>
			<td>Batch</td>
			<td><select name="acyear" class="btn btn-default dropdown-toggle">
				<option value="AY.2019-23">2019-23</option>
				<option value="AY.2018-22">2018-22</option>
				<option value="AY.2017-21">2017-21</option>
				<option value="AY.2016-20">2016-20</option>
				<option value="AY.2015-19">2015-19</option>
				<option value="AY.2014-18">2014-18</option>
				
				</select>
			</td>		
		</tr>
		<tr>
			<td>Semester</td>
			<td><select name="sem" class="btn btn-default dropdown-toggle">
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
			<td>Dept</td>
			<td><select name="branch" class="btn btn-default dropdown-toggle">
				<option value="ece">ECE</option>
				<option value="cse">CSE</option>
				<option value="eee">EEE</option>
				<option value="it">IT</option>
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section" onchange="showCustomer()" class="btn btn-default dropdown-toggle">
				<option value="select">Select</option>
				<option value="section1">Section1</option>
				<option value="section2">Section2</option>
				<option value="section3">Section3</option>
				
				</select>
			</td>		
		</tr>
		<tr>
			<td>Course</td>
			<td><select id="txtHint" name="course" required="required" class="btn btn-default dropdown-toggle">
			</select></td>
		</tr>
		<tr>
    		<td><input type="submit" value="View" class="form-control"/></td>
			<td><input type="reset" value="Clear" class="form-control"> </td>
		</tr>
</table>
</form>
</div>
</div>
</div>
<%@include file="footer.html" %>