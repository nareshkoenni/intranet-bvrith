<html>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
$(document).ready(function() {
  	 $("#datepicker").datepicker();
	 });
	$(document).ready(function() {
	   	 $("#datepicker1").datepicker();
	 });
  
function showReturns() {
	var from=tr.from.value;
	var to=tr.to.value;
	var lt=tr.leaveType.value;

        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("bookInfo").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","trackLeaveInfo.jsp?from="+from+"&to="+to+"&lt="+lt,true);
        xmlhttp.send();
    
}
</script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		<h3 align="center" class="bars">Track Leaves </h3><br>
<!-- <form action="searchBookProcess.jsp" name='bookReturn'>  -->
<form action="#" name='tr'>
<table align="center">
<tr>
	<td><input type="text" id="datepicker" name="from" placeholder="from" class="form-control"/></td><td>&nbsp;</td>

	<td><input type="text" id="datepicker1" name="to" placeholder="to" class="form-control"/></td><td>&nbsp;</td>
	<td><select name='leaveType' class="btn btn-default dropdown-toggle">
          <option value="Casual Leave (CL)">Casual Leave(CL)</option>
          <option value="Sick Leave (SL)">Sick Leave(SL)</option>
          <option  value="Earned Leave (EL)">Earned Leave (EL)</option>
          <option  value="Academic Leave (AL)">Academic Leave (AL)</option>
          <option value="On Duty (OD)">On Duty(OD)</option> 
		  <option  value="Compensatory Casual Leave(CCL)">Compensatory Casual Leave(CCL)</option>
		  <option value="OneHrPerm">One Hour Permission</option> 
		  <option value="vacation">Vacation</option> 
	     </select></td>
	<td><input type="button" value='Show' onclick="showReturns()"/></td>
<tr>

</table>
<br>
<div id="bookInfo" align="center"><b>Leaves info will be displayed here...</b></div>
</form>

</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>