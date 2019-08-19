
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker().datepicker("setDate", new Date());
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
	var rollNum=report.rollNumber.value;
	
    if (str == "") {
        document.getElementById("smsReport").innerHTML = "";
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
                document.getElementById("smsReport").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","smsReport1.jsp?rollNumber="+rollNum,true);
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
		<br>
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/sendASMS1.jsp?uid=<%=uid%>" name="report" method="post">
	<h3 align="center" class="bars">SMS Delivery Report </h3><br>
	
	<table align="center">	
		
		<tr>
			<td><input type="text"  name="rollNumber" placeholder="Roll Number" class="form-control"/></td>	
			<td><input type="button" value='Show' onclick="showReport()" class="form-control"/></td>
		</tr> 
	</table>
<br>
<div id="smsReport" align="center"><b>Report will be displayed here...</b></div>

</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>