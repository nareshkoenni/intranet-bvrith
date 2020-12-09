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
	    $("#datepicker").datepicker().datepicker("setDate", new Date());
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
 
</head>
<body>
<%@include file="studentHeader.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/fbonfacility" name="feedbackff" method="post">
<br>
	<h3 align="center" class="bars">Feedback on Facilities</h3>
	<br>
	<table align="center">	
		<tr>
			<td>&nbsp;</td>
			<td colspan="2"><input type="text" id="datepicker" name="date" placeholder="date(mm/dd/yyyy)" class="form-control" required="required"/></td>		
		    <td colspan="2"><input type="text" value="<%=(String)session.getAttribute("rollnumber")%>" name="rollNumber" required="required" class="form-control"/></td>	 		
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			 <td colspan="2"><input type="text" placeholder="email ID" value="<%=(String)session.getAttribute("rollnumber")%>@bvrithyderabad.edu.in" name="mailId" required="required" class="form-control"/></td>	 		
			 <td colspan="2"><input type="text"  name="contactNumber" placeholder="Contact Number" required="required" class="form-control"/></td>	 		
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
			<td colspan="2">
				<select name="sem" required="required" class="btn btn-default dropdown-toggle">
					<option value="">Select</option>
					<option value="1/4Sem-I">1/4Sem-I</option>
					<option value="1/4Sem-II">1/4Sem-II</option>
					<option value="2/4Sem-I">2/4Sem-I</option>
					<option value="2/4Sem-II">2/4Sem-II</option>
					<option value="3/4Sem-I">3/4Sem-I</option>
					<option value="3/4Sem-II">3/4Sem-II</option>
					<option value="4/4Sem-I">4/4Sem-I</option>
					<option value="4/4Sem-II">4/4Sem-II</option>
				</select>
			</td>		
			<td colspan="2"><select name="branch" required="required" class="btn btn-default dropdown-toggle">
				<option value="">Select</option>
				<option value="it">IT</option>
				<option value="ece">ECE</option>
				<option value="cse">CSE</option>
				<option value="eee">EEE</option>
			</select></td>	
			<td>&nbsp;</td>
		</tr>
		<tr>
		    <td>&nbsp;</td> 
			<td colspan="2">
				<select name="section" onchange="showCustomer()" required="required" class="btn btn-default dropdown-toggle">
					<option value="">Select</option>
					<option value="section1">Section1</option>
					<option value="section2">Section2</option>
					<option value="section3">Section3</option>
					
				</select>
			</td>		
			<td colspan="2">
				<select name="acyear" required="required" class="btn btn-default dropdown-toggle">
					<option value="">Select</option>
					<option value="AY.2016-20">AY.2016-20</option>
					<option value="AY.2017-21">AY.2017-21</option>
					<option value="AY.2018-22">AY.2018-22</option>
					<option value="AY.2019-23">AY.2019-23</option>
					
				</select>
			</td>	
			<td>&nbsp;</td>	
		</tr>
		<tr>
			<td colspan="6">&nbsp;</td>
		</tr>
	<tr>
		<td colspan="6">Your frank and unbiased evaluation of the Facility helps the Institution to improve the standard of Facilities.</td>
	</tr>
	<tr><td colspan="6" align="center">Please rate according to the rating metric provided below   <br>Poor:1, Below Average:2, Average:3, Good:4, Excellent:5</td></tr>
    <tr><td colspan="6" align="center">  </td></tr>
</table>
<table align="center" border="1" style="width:80%;">
    
    
	<tr>
		<th>S.No</th>
		<th>Evaluation Criteria</th>
		<th>Poor</th>
		<th>Below Average</th>
		<th>Average</th>
		<th>Good</th>
		<th>Excellent</th>
	</tr>
	<tr>
		<td align="center">1</td>
		<td>Teaching</td>
		<td align="center"><input type="radio" name="teaching" value="1" /> </td>
		<td align="center"><input type="radio" name="teaching" value="2" /> </td>
		<td align="center"><input type="radio" name="teaching" value="3" /> </td>
		<td align="center"><input type="radio" name="teaching" value="4" /> </td>
		<td align="center"><input type="radio" name="teaching" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">2</td>
		<td>Laboratories & Class Rooms</td>
		<td align="center"><input type="radio" name="labs-cr" value="1"/> </td>
		<td align="center"><input type="radio" name="labs-cr" value="2"/> </td>
		<td align="center"><input type="radio" name="labs-cr" value="3"/> </td>
		<td align="center"><input type="radio" name="labs-cr" value="4"/> </td>
		<td align="center"><input type="radio" name="labs-cr" value="5" required="required"/> </td>
		</tr>
	<tr>
		<td align="center">3</td>
		<td>Library </td>
		<td align="center"><input type="radio" name="library" value="1"/> </td>
		<td align="center"><input type="radio" name="library" value="2"/> </td>
		<td align="center"><input type="radio" name="library" value="3"/> </td>
		<td align="center"><input type="radio" name="library" value="4"/> </td>
		<td align="center"><input type="radio" name="library" value="5" required="required"/> </td>
		</tr>
	
	<tr>
		<td align="center">4</td>
		<td>Computing Facilities & Internet</td>
		<td align="center"><input type="radio" name="internet" value="1"/> </td>
		<td align="center"><input type="radio" name="internet" value="2"/> </td>
		<td align="center"><input type="radio" name="internet" value="3"/> </td>
		<td align="center"><input type="radio" name="internet" value="4"/> </td>
		<td align="center"><input type="radio" name="internet" value="5" required="required"/> </td>
		</tr>
	<tr>
		<td align="center">5</td>
		<td>Training & Placement Cell</td>
		<td align="center"><input type="radio" name="tpc" value="1"> </td>
		<td align="center"><input type="radio" name="tpc" value="2"> </td>
		<td align="center"><input type="radio" name="tpc" value="3"> </td>
		<td align="center"><input type="radio" name="tpc" value="4"> </td>
		<td align="center"><input type="radio" name="tpc" value="5" required="required"> </td>
	</tr>
	<tr>
		<td align="center">6</td>
		<td>Administration Department</td>
		<td align="center"><input type="radio" name="admin" value="1"/> </td>
		<td align="center"><input type="radio" name="admin" value="2"/> </td>
		<td align="center"><input type="radio" name="admin" value="3"/> </td>
		<td align="center"><input type="radio" name="admin" value="4"/> </td>
		<td align="center"><input type="radio" name="admin" value="5" required="required"/> </td>
	</tr>
	
	<tr>
		<td align="center">7</td>
		<td>Medical </td>
		<td align="center"><input type="radio" name="medical" value="1"/> </td>
		<td align="center"><input type="radio" name="medical" value="2"/> </td>
		<td align="center"><input type="radio" name="medical" value="3"/> </td>
		<td align="center"><input type="radio" name="medical" value="4"/> </td>
		<td align="center"><input type="radio" name="medical" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">8</td>
		<td>Canteen</td>
		<td align="center"><input type="radio" name="canteen" value="1"/> </td>
		<td align="center"><input type="radio" name="canteen" value="2"/> </td>
		<td align="center"><input type="radio" name="canteen" value="3"/> </td>
		<td align="center"><input type="radio" name="canteen" value="4"/> </td>	
		<td align="center"><input type="radio" name="canteen" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">9</td>
		<td>Transport/Hostel</td>
		<td align="center"><input type="radio" name="transp-hostel" value="1"/> </td>
		<td align="center"><input type="radio" name="transp-hostel" value="2"/> </td>
		<td align="center"><input type="radio" name="transp-hostel" value="3"/> </td>
		<td align="center"><input type="radio" name="transp-hostel" value="4"/> </td>	
		<td align="center"><input type="radio" name="transp-hostel" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">10</td>
		<td>Sports</td>
		<td align="center"><input type="radio" name="sports" value="1"/> </td>
		<td align="center"><input type="radio" name="sports" value="2"/> </td>
		<td align="center"><input type="radio" name="sports" value="3"/> </td>
		<td align="center"><input type="radio" name="sports" value="4"/> </td>	
		<td align="center"><input type="radio" name="sports" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">11</td>
		<td>Extracurricular Activities</td>
		<td align="center"><input type="radio" name="extra-act" value="1"/> </td>
		<td align="center"><input type="radio" name="extra-act" value="2"/> </td>
		<td align="center"><input type="radio" name="extra-act" value="3"/> </td>
		<td align="center"><input type="radio" name="extra-act" value="4"/> </td>	
		<td align="center"><input type="radio" name="extra-act" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">12</td>
		<td>Ambience</td>
		<td align="center"><input type="radio" name="ambience" value="1"/> </td>
		<td align="center"><input type="radio" name="ambience" value="2"/> </td>
		<td align="center"><input type="radio" name="ambience" value="3"/> </td>
		<td align="center"><input type="radio" name="ambience" value="4"/> </td>	
		<td align="center"><input type="radio" name="ambience" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">13</td>
		<td>Security</td>
		<td align="center"><input type="radio" name="security" value="1"/> </td>
		<td align="center"><input type="radio" name="security" value="2"/> </td>
		<td align="center"><input type="radio" name="security" value="3"/> </td>
		<td align="center"><input type="radio" name="security" value="4"/> </td>	
		<td align="center"><input type="radio" name="security" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">14</td>
		<td>Counseling System</td>
		<td align="center"><input type="radio" name="counselling" value="1"/> </td>
		<td align="center"><input type="radio" name="counselling" value="2"/> </td>
		<td align="center"><input type="radio" name="counselling" value="3"/> </td>
		<td align="center"><input type="radio" name="counselling" value="4"/> </td>	
		<td align="center"><input type="radio" name="counselling" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">15</td>
		<td>Aminities</td>
		<td align="center"><input type="radio" name="aminities" value="1"/> </td>
		<td align="center"><input type="radio" name="aminities" value="2"/> </td>
		<td align="center"><input type="radio" name="aminities" value="3"/> </td>
		<td align="center"><input type="radio" name="aminities" value="4"/> </td>	
		<td align="center"><input type="radio" name="aminities" value="5" required="required"/> </td>
	</tr>
	<tr>
		<td align="center">16</td>
		<td>Overall Rating</td>
		<td align="center"><input type="radio" name="overall" value="1"/> </td>
		<td align="center"><input type="radio" name="overall" value="2"/> </td>
		<td align="center"><input type="radio" name="overall" value="3"/> </td>
		<td align="center"><input type="radio" name="overall" value="4"/> </td>	
		<td align="center"><input type="radio" name="overall" value="5" required="required"/> </td>
	</tr>
	
	
		
</table>
 <table align="center">
 	<tr>
 		<td colspan="6">&nbsp;</td>
 	</tr>
 	<tr>
    		<td colspan="3"><input type="submit" value="Submit" class="form-control"/></td>
			<td colspan="3"><input type="reset" value="Clear" class="form-control"> </td>
	</tr>
 </table>
</form>
	
		</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>