<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#date").datepicker();
  });
  $(document).ready(function() {
	    $("#date1").datepicker();
  });
	  
  </script>
  
  		
  	
 
  
  <style type="text/css">
	#serviceBox
	{
    width:100%;
    margin: 0 auto;
    margin-top:75px;
    height:250px;
    border:;
    
	}
	.serviceBox1, .serviceBox2, .serviceBox3{
    float:left;
    width:10%;
    height: 250px; 
    background-color: ;
	}
</style>
</head>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form name="attendance" action="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewFortAttendance11.jsp?uid=<%=uid%>" method="post">

 <h3 align="center" class="bars"> FortNight Attendance</h3>
 <table align="center" >
 <tr>
 <td><input type="text" id="date" name="from" placeholder="from"  required="required" class="form-control"/></td>		
  <td><input type="text" id="date1" name="to" placeholder="to" required="required" class="form-control"/></td>		
   <td><select name='branch' class="btn btn-default dropdown-toggle"><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
  <td>&nbsp;</td>
  <td>
  	<select name="sem" class="btn btn-default dropdown-toggle">
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
  		<td><select name="section" class="btn btn-default dropdown-toggle">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>	
 
  <td align="center"><input type="submit" value="Go" /></td>
  
  
  </tr>
</table>	 
 
</form>
<div id="txtHint">Presentees will be printed here...</div>
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>