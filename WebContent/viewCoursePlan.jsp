
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
 
	
 function showCustomer() {
	 //  	alert("Hi");
	  var xhttp; 
	  var branch=postattendance.branch.value;
	  var sem=postattendance.sem.value;
	  var section=postattendance.section.value;
	  var acyear=postattendance.acyear.value;
	  var instructor=postattendance.instructor.value;
	  if(sem=="select"){
		  alert("choose sem");
	  }else if(branch=="select"){
		  alert("choose branch");
	  }
	 
	 // alert(branch+"\t"+sem+"\t"+section+"\t"+acyear+"\t"+instructor);
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    var x=document.getElementById("txtHint");
	  //  var option=document.createElement("option");
	    var te=this.responseText;
	    var a=te.split(",");
	    for(var i=0;i<a.length-1;i++){
	   // alert(a);
	    var option=document.createElement("option");
		option.text=a[i].toString();
	    x.add(option);
	    }
	    }
	  };
	  xhttp.open("GET", "getCoursesWeb.jsp?branch="+branch+"&sem="+sem+"&section="+section+"&acyear="+acyear+"&instructor="+instructor, true);
	  xhttp.send();
	}
 function checkFields(){
	 var branch=postattendance.branch.value;
	  var sem=postattendance.sem.value;
	  var section=postattendance.section.value;
	  if(sem=="select"){
		  alert("Please select Semester first!");
	  }else if(branch=="select"){
		  alert("Please select Branch first!");
	  }else if(section== "select"){
		  alert("Please select Section first!");
	  }
	 
 }
 </script>
</head>

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewCoursePlan1.jsp?uid=<%=uid%>" name="postattendance" method="post">
	<h3 align="center" class="bars">Course Plan</h3><br>
	
	<table align="center" width="80%">	
		<tr>
			<td width="15%">Course Code</td>
			<td width="15%"></td>
			<td width="8%">Instructor</td>
			<td width="10%" colspan="3">
			<input type="text" name="instructor" value="<%=session.getAttribute("uid")%>" class="form-control" size="20"/>
			</td>
			<td width="10%">Academic Year</td>
			<td width="5%">
				<select name="acyear" class="btn btn-default dropdown-toggle">
					<option value="AY.2017-18">AY.2017-18</option>
				<!--  <option value="AY.2018-19">AY.2018-19</option> -->	
				</select>
			</td>
					
		</tr>
	
		<tr>
			<td colspan="8" height="5%">&nbsp;</td>
		</tr>
		
		<tr>
			<td>Semester</td>
			<td>
				<select name="sem" class="btn btn-default dropdown-toggle">
					<option value="select">Select</option>
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
			
			<td>Branch</td>
			<td>
				<select name="branch" class="btn btn-default dropdown-toggle" >
					<option value="select">Select</option>
					<option value="cse">CSE</option>
					<option value="ece">ECE</option>
					<option value="eee">EEE</option>
					<option value="it">IT</option>
				</select>
			</td>
				
			<td>Section</td>
			<td>
				<select name="section" onchange="showCustomer()" class="btn btn-default dropdown-toggle" >
					<option value="select">Select</option>
					<option value="section1">Section1</option>
					<option value="section2">Section2</option>
				</select>
			</td>		
					
			<td>Course Name</td>
			<td>
				<select id="txtHint" name="course" class="btn btn-default dropdown-toggle" onclick="checkFields()">
					<option>Choose</option>
				</select>
			</td>
		</tr>
	</table>
	
	<br/><br/>
	
	
	
	<table   align="center">	
	 	<tr>
    		<td colspan="4"><input type="reset" value="Clear" class="form-control"> </td><td>&nbsp;</td>
			<td colspan="5"><input type="submit" value="View" class="form-control"/></td>
			<td></td>
		</tr>
	</table>
	

</form>

		</div>
		
	</div>
		
</div>
<h5 align="center" style="color: red; font-weight:bold;"><marquee >It is best viewed in Mozilla Firefox</marquee></h5>

<%@include file="footer.html" %>
</body>