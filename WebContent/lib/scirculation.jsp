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
        xmlhttp.open("GET","getStudentDetails.jsp?rollno="+rollno,true);
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
<script>
  $(document).ready(function() {
    $("#datepicker").datepicker().datepicker("setDate", new Date());
  });
  </script>
</head>
<%@include file="/header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<h3 align="center" class="bars">Student Circulation</h3><br>

	<form name = "scirc" method="post" align="center" action="scircProcess.jsp">
		<table  style=" background: silver; height: 150px; width: 200px; font-family: fantasy; font: bold;" align='center' >
			
   			<tr>
    			<td>Student</td>
        		<td>  <input type="text"  id="user" name='rollNo' class="form-control"/>
				  <td><input type="button" value="Get Details" onclick="getStudentDetails()" class="form-control"/> </td>
  			</tr>
  			<tr>
    			<td>AccNo</td>
        		<td>  <input type="text"  name="accno" required="required" class="form-control">
				          
				  </td>
				  <td><!-- <input type="text" id="datepicker" name="date" placeholder="mm/dd/yyyy" class="form-control" required="required"/> --></td>		
		
  			</tr>
  			<tr>
    			<td><input type="submit"  name="type" value='issue' onclick="userValid()" class="form-control"></td>
        		<td> <input type="submit"  name="type" value='renewal' class="form-control"></td>
				<td> <input type="submit"  name="type" value='return' class="form-control"></td>
				          
				  
  			</tr>
  
  			
		</table>	
	</form>
<br/>
		<div id="studentInfo" align="center"><b>Student info will be displayed here...</b></div>
	

</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>