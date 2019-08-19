
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(function() {
	    $( "#datepicker" ).datepicker({dateFormat: "dd/mm/yy"});
   });
  </script>
  <script type="text/javascript">
  	function courseValid(){
  		var course=postattendance.course.value;
  		if(course=="choose"){
  			alert("Please Choose Course");
  			//postattendance.course.focus();
  			//return true;  
  		}
  		
  	}
  </script>
<script>

function showReport(str) {
	var branch=postattendance.branch.value;
	var sem=postattendance.sem.value;
	var section=postattendance.section.value;
	var ay=postattendance.acyear.value;
	
	  
    if (str == "") {
        document.getElementById("tlfReport").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("tlfReport").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","http://intranet.bvrithyderabad.edu.in:9000/intranet/ffReport.jsp?branch="+branch+"&sem="+sem+"&section="+section+"&ay="+ay,true);
        xmlhttp.send();
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
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/sendASMS1.jsp?uid=<%=uid%>" name="postattendance" method="post">
	<br>
	<h3 align="center" class="bars">Facilities Feedback Report </h3><br>
		<table align="center">	
		
		<tr>
			<td>Semester</td>
			<td><select name="sem" required="required" class="btn btn-default dropdown-toggle">
				<option value="1/4Sem-I">1/4Sem-I</option>
				<option value="1/4Sem-II">1/4Sem-II</option>
				<option value="2/4Sem-I">2/4Sem-I</option>
				<option value="2/4Sem-II">2/4Sem-II</option>
				<option value="3/4Sem-I">3/4Sem-I</option>
				<option value="3/4Sem-II">3/4Sem-II</option>
				<option value="4/4Sem-I">4/4Sem-I</option>
				<option value="4/4Sem-II">4/4Sem-II</option>
			
			
			</select></td>		
		</tr>
		<tr>
			<td>Branch</td>
			<td><select name="branch" required="required" class="btn btn-default dropdown-toggle">
				
				<option value="it">IT</option>
				<option value="ece">ECE</option>
				<option value="cse">CSE</option>
				<option value="eee">EEE</option>
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section"  required="required" class="btn btn-default dropdown-toggle">
				<option value="select">Select</option>
				<option value="section1">Section1</option>
				<option value="section2">Section2</option>
				</select>
			</td>	
		</tr>
		
		<tr>
			<td>Batch</td>
			<td><select name="acyear" required="required" class="btn btn-default dropdown-toggle">
				<option value="AY.2014-18">B.2014-18</option>
				<option value="AY.2015-19">B.2015-19</option>
				<option value="AY.2016-20">B.2016-20</option>
				<option value="AY.2017-21">B.2017-21</option>
				<option value="AY.2018-22">B.2018-22</option>
				<option value="AY.2014-18">B.2013-17</option>
				<option value="AY.2014-18">B.2012-16</option>
				
				</select>
			</td>		
		</tr>
		
		<tr>
    		<td><input type="button" value="Show" onclick="showReport()" class="form-control"/></td>
			<td><input type="reset" value="Clear" class="form-control"> </td>
		</tr>
	</table>
<br>
<br>
<div id="tlfReport" align="center"><b>Report will be displayed here...</b></div>

</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>