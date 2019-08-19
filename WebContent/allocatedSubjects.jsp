<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/allocatedSubjects1.jsp?uid=<%=uid%>" method="POST">

 <hr/>
 <h3 align="center" class="bars">List of Assigned Subjects</h3>
 <table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
 
 <tr>
  <td><select name='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
  
  <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"></td>
  </tr>
</table>	 
 
</form>
</div>
		</div>
	</div>
</div>
<%@include file="footer.html" %>