<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
 
<script type="text/javascript">
function getStudentDetails() {
	var rollno=document.getElementById("user").value;
	  if (rollno === "") {
        document.getElementById("studentInfo").innerHTML = "";
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
                
            	document.getElementById("studentInfo").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","getMarks.jsp?rollnumber="+rollno,true);
        xmlhttp.send();
    }
}
function userValid(){
	var rollno=scirc.rollNo.value;
	if(rollno == ""){
		alert("Please enter Rollnumber");
	}
}
</script>

</head>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<h3 align="center" class="bars">Student Marks</h3><br>

	<form name = "scirc" method="post" align="center">
		<table  align='center' >
			<tr>
    			<td>  <input type="text" class="form-control" placeholder="Roll Number" id="user" name='rollNo' />
			  <td>&nbsp;</td>
			  <td><input type="button" class="form-control" value="Show Marks" onclick="getStudentDetails()"/> </td>
  			</tr>
  		</table>	
	</form>
<br/>
		<div id="studentInfo" align="center"><b>Student Marks will be displayed here...</b></div>
	

</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>