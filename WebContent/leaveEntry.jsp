<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
   	 $("#datepicker1").datepicker();
 	 });
	$(document).ready(function() {
	   	 $("#datepicker2").datepicker();
	 });
	$(document).ready(function() {
	   	 $("#datepicker3").datepicker();
	 });
	function getFaculty(){
		xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    var x=document.getElementById("fac");
		 //  alert(x.length);
		  //  var option=document.createElement("option");
		    var te=this.responseText;
		    var a=te.split(",");
		    for(var i=0;i<a.length-1;i++){
		   // alert(a);
		    var option=document.createElement("option");
			option.text=a[i].toString();
		    for(i=0;i<x.length;i++){
				x.add(option);
		    }
		    }
		    }
		  };
		  xhttp.open("GET", "getFacultyWeb.jsp", true);
		  xhttp.send();
		  
	} 
	
 </script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form method="POST" action="ils">
<h3 align="center" class="bars">Leave Setting</h3><br>
  <table align="center">
   <tr>
      	<th>Name</th> 
   		<td>
   		<select  name="faculty" onclick="getFaculty()" id="fac"  class="btn btn-default dropdown-toggle" required="required">
			<option>-Select-</option>
	    </select>
	    </td>
   </tr>
     <tr>
      <th>Earned Leave (EL)</th>
       	<td><input type="text" name="elCredit" placeholder="Credit" class="form-control"/></td>
    	<td><input type="text" name="elDebit" placeholder="Debit" class="form-control"/></td>
    	<td><input type="text" name="elBal" placeholder="Balance" class="form-control"/></td>
   
    </tr>
  
    <tr>
      	<th>Casual Leave(CL)</th>
    	<td><input type="text" name="clCredit" placeholder="Credit" class="form-control"/></td>
    	<td><input type="text" name="clDebit" placeholder="Debit" class="form-control"/></td>
    	<td><input type="text" name="clBal" placeholder="Balance" class="form-control"/></td>
    </tr>
    <tr>  
    	<th>Sick Leave(SL)</th>
    	<td><input type="text" name="slCredit" placeholder="Credit" class="form-control"/></td>
    	<td><input type="text" name="slDebit" placeholder="Debit" class="form-control"/></td>
    	<td><input type="text" name="slBal" placeholder="Balance" class="form-control"/></td>
   
    </tr>
    <tr>
      <th>Academic Leave (AL)</th>
   	  <td><input type="text" name="alCredit" placeholder="Credit" class="form-control"/></td>
      <td><input type="text" name="alDebit" placeholder="Debit" class="form-control"/></td>
      <td><input type="text" name="alBal" placeholder="Balance" class="form-control"/></td>
     </tr>
    <tr>
	 	<th>CCL</th>
	    <td><input type="text" name="cclCredit" placeholder="Credit" class="form-control"/></td>
        <td><input type="text" name="cclDebit" placeholder="Debit" class="form-control"/></td>
        <td><input type="text" name="cclBal" placeholder="Balance" class="form-control"/></td>
   </tr>
   
    <tr>
	  <th>Vacation<th>
	  <td colspan="" align="left"><input type="text"  name="vacation" class="form-control"/></td>
    </tr>
	<tr>
    	<td><input type="reset" value="Clear" class="form-control"/> </td>
		<td><input type="submit" value="Submit" class="form-control" /></td>
	</tr>
    
 </table>
  
  
</form>

		</div>
		
	</div>
		
</div>

<%@include file="footer.html" %>
</body>
