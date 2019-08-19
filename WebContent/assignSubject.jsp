<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/subjectAllocation.jsp?uid=<%=uid%>" method="POST">
<!--  <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1>-->

 <h3 align="center" class="bars">Subject Allocation</h3>
 <table align="center">
 
 <tr>
  <td><select name='branch' class="btn btn-default dropdown-toggle"><option value='select'>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
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
  <td>&nbsp;</td>
  <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"> </td>
  </tr>
</table>	 
 
</form>
</div>
		
	</div>
		
</div>
<%@include file="footer.html" %>