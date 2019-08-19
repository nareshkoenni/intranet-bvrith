
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
<form action="sendSMST1.jsp" name="sendSMS" method="post">
	<h3 align="center" class="bars">Staff SMS Portal</h3><br>
	
	<table align="center">	
		<tr>
    		<td colspan="2"><input type="radio" name="category" value="T"/>Teaching
			<input type="radio" name="category" value="NT"/>NonTeaching
			<input type="radio" name="category" value="ALL"/>All</td>
		</tr>
		<tr>
			<td colspan="2"><textarea rows="3" cols="50" name="message" placeholder="Pls type message here" maxlength="180" required="required"></textarea></td>
			
		</tr>
		<tr>
			<td>Branch</td>
			<td><select name="branch" class="btn btn-default dropdown-toggle">
				<option value="ALL">ALL</option>
				<option value="CSE">CSE</option>
				<option value="ECE">ECE</option>
				<option value="EEE">EEE</option>
				<option value="IT">IT</option>
				<option value="HBS">HBS</option>
				<option value="admin">Admin</option>
				
			</select></td>		
		</tr>
		<tr>
    		<td><input type="reset" value="Clear" class="form-control"> </td>
			<td><input type="submit" value="Post" class="form-control" /></td>
			<td></td>
		</tr>
	</table>

<br>
<p align="center" style="color: red;">Note: Internet Connection is mandatory to send SMS</p>
<p align="center" style="color: red;">Note: SMS Delivery Report can be seen immediately after sending</p>

</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>