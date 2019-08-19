
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
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
 
</head>
<!-- <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1><h4 align="right"><a href="index.html">Logout</a></h4> -->

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/postNoticeboard.jsp?uid=<%=uid%>" name="postattendance" method="post">
	<h3 align="center" class="bars">Notice Board</h3><br>
	
	<table align="center">	
		<tr>
			<td><textarea  name="message" placeholder="message" class="form-control" required="required"/></textarea></td>		
			<td>&nbsp;</td>
			<td> <input type="submit" value="Post" class="form-control" /></td>
		</tr>
	</table>



</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>