
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
 
</head>
<!-- <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1><h4 align="right"><a href="index.html">Logout</a></h4> -->

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="sendSMSSP1.jsp" name="sendSMS" method="get">
	<h3 align="center" class="bars">Student/Parent SMS Portal</h3><br>
	
	<table align="center">	
		<tr>
			<td>Category</td>
			<td><select name="category" class="btn btn-default dropdown-toggle">
				<option value="student">Student</option>
				<option value="parent">Parent</option>
				
			</select></td>		
			<td></td>
		</tr>
		<tr>
			<td>Program</td>
			<td><select name="program" class="btn btn-default dropdown-toggle"  >
				<option value="btech">B.Tech</option></select></td>
			<td></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="hidden"  name="uid" value="<%=uid%>" class="form-control"/></td>	
		</tr>
		<tr>
			<td>Branch</td>
			<td><select name="branch" class="btn btn-default dropdown-toggle">
				<option value="cse">CSE</option>
				<option value="ece">ECE</option>
				<option value="eee">EEE</option>
				<option value="it">IT</option>
			</select></td>		
			<td></td>
		</tr>
		<tr><td></td><td></td><td></td></tr>
		
		<tr>
			<td>Year</td>
			<td><select name="year" class="btn btn-default dropdown-toggle" >
				<option value="1">1yr</option>
				<option value="2">2yr</option>
				<option value="3">3yr</option>
				<option value="4">4yr</option>
			</select></td>	
			<td></td>	
		</tr>
		
		<tr>
			<td>Section</td>
			<td><select name="section" onchange="showCustomer()" class="btn btn-default dropdown-toggle">
				<option value="all">ALL</option>
				<option value="A">A</option>
				<option value="B">B</option>
				</select>
			</td>	
			
			<td></td>	
		</tr>
		<tr>
			<td colspan="2"><textarea rows="3" cols="50" name="message" placeholder="Pls type message here" maxlength="180" required="required"></textarea></td>
			<td></td>
		</tr>
		
		<tr>
    		
			<td><input type="reset" value="Clear" class="form-control"> </td>
			<td><input type="submit" value="Send" class="form-control" /></td>
			<td></td>
		</tr>
	</table>

</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>