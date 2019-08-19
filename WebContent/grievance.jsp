
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
  		var course=grievance.category.value;
  		//var course=postattendance.course.value;
  		
  		if(course=="category"){
  			alert("Please Choose Category");
  			//postattendance.course.focus();
  			//return true;  
  		}
  		
  	}
  </script>
 
</head>
<!-- <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1><h4 align="right"><a href="index.html">Logout</a></h4> -->

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		<br>
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/gcs?uid=<%=uid%>" name="grievance" method="post" >
	<h3 align="center" class="bars">Grievance System</h3><br>
	<p align="center" style="font-style:italic; font-family: fantasy;">Your frank suggestion or complaint helps the college to improve the Process. </p>
	<br>
	<table align="center">	
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><input type="text" placeholder="mail ID"  name="mailID" class="form-control" required="required"/></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><input type="hidden"  name="uid" value="<%=uid%>" class="form-control"/></td>	
		</tr>
		
		<tr>
			<td><select name="category" class="btn btn-default dropdown-toggle" required="required">
				<option value="category">Choose Category</option>
				<option value="academics">Academics</option>
				<option value="admissions">Admissions</option>
				<option value="examination">Examination Branch</option>
				<option value="internet">Internet</option>
				<option value="laboratories">Laboratories</option>
				<option value="classroom">Classroom</option>
				<option value="tpc">Training&Placement Cell</option>
				<option value="medical">Medical</option>
				<option value="canteen">Canteen</option>
				<option value="transport">Transport</option>
				<option value="hostel">Hostel</option>
				<option value="sports">Sports</option>
				<option value="security">Security</option>
				<option value="library">Library</option>
				<option value="others">Others</option>
				
			</select></td>		
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><textarea  name="message" placeholder="complaint or suggestion" rows="3" cols="40" class="form-control" required="required"></textarea></td>	
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><select name="status" class="btn btn-default dropdown-toggle" required="required">
				<option value="raised">Raised</option>
				<option value="inprogress">In Progress</option>
				<option value="pending">Pending</option>
				<option value="fixed">Fixed</option>
			</select></td>		
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
    		<td align="center"><input type="submit" value="Submit" class="form-control" /></td>
		</tr>
	</table>



</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>