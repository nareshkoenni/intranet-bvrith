<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<h3 align="center" class="bars">SMS Portal</h3>
<form action="smsTPOExcel1.jsp" method="post" enctype="multipart/form-data">
	<table align="center">	
	
<tr>
<td>Upload Excel</td>
<td> <input type="file" name="fname" required="required" /></td>
</tr>
<tr>
<td align="center"> <input type="reset" value="Clear" /></td>
<td align="center"> <input type="submit" value="Send" /></td>
</tr>

</table>
<br>
<p align="center" style="color: red;">Excel Format: First Column should be mobile numbers and second column should be the message </p>
<p align="center" style="color: red;">Note: Internet Connection is mandatory to send SMS</p>
</form>
</div>
		
	</div>
		
</div>
<%@include file="footer.html" %>