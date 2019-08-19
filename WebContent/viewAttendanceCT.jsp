<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#date").datepicker().datepicker("setDate", new Date());;
  });
  $(document).ready(function() {
	    $("#date1").datepicker().datepicker("setDate", new Date());;
  });
	  
 
  
  
  </script>
  
  
</head>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form name="attendance" action="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewAttendanceCT1.jsp?uid=<%=uid%>" method="post">
<!--  <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1>-->
<br>
 <h3 align="center" class="bars">Class Attendance</h3>
 <br>
 <table align="center" >
 <tr>
  <td><input type="text" id="date" name="from" placeholder="mm/dd/yyyy" class="form-control" required="required"/></td>	<td>&nbsp;</td>	
 <!--   <td><input type="text" id="date1" name="to" value="to"/></td>		-->
  <td><select name='branch' id='branch' class="btn btn-default dropdown-toggle"><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td><td>&nbsp;</td>
  
  <td>
  	<select name="sem" id='sem' class="btn btn-default dropdown-toggle">
				<option value="1/4Sem-I">1/4Sem-I</option>
				<option value="1/4Sem-II">1/4Sem-II</option>
				<option value="2/4Sem-I">2/4Sem-I</option>
				<option value="2/4Sem-II">2/4Sem-II</option>
				<option value="3/4Sem-I">3/4Sem-I</option>
				<option value="3/4Sem-II">3/4Sem-II</option>
				<option value="4/4Sem-I">4/4Sem-I</option>
				<option value="4/4Sem-II">4/4Sem-II</option>
			
			
			</select> </td><td>&nbsp;</td>
  
  		<td><select name="section" id='section' class="btn btn-default dropdown-toggle">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>	<td>&nbsp;</td>
 
  <td align="center"><input type="submit" value="View"   class="form-control"/></td><td>&nbsp;</td>
  
  <td></td><td align="center">  </td>
  </tr>
</table>	 
 
</form>

<div id="txtHint">Absentees will be printed here...</div>
		</div>
	</div>
</div>
<%@include file="footer.html" %>