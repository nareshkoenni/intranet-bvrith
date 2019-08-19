<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#date").datepicker();
  });
  
 
  
  function showCustomer() {
	 // alert("hi");
	  var date=document.getElementById("date");
	  var branch=document.getElementById("branch");
	  var sem=document.getElementById("sem");
	  var section=document.getElementById("section");
	  
	  
	/*  var date=attendance.date.value;
	  var branch=attendance.brnach.value;
	  var sem=attendance.sem.value;
	  var section=attendance.section.value; */
	  
	  
	  var xhttp; 
	  if (date == "" || branch=="" || sem=="" || section=="") {
	    document.getElementById("txtHint").innerHTML = "Jaffa";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    alert('In Function');
		 if (this.readyState == 4 && this.status == 200) {
			 alert('kalyan');
			 document.getElementById("txtHint").innerHTML = this.responseText;
	    }
		 else {
			 alert(this.readyState +" "+this.status);
		 }
	  };
	  xhttp.open("GET", "va1.jsp?date="+date+"&branch="+branch+"&sem="+sem+"&section="+section, true);
	  xhttp.send();
	}
  </script>
  
  <style type="text/css">
	#serviceBox
	{
    width:100%;
    margin: 0 auto;
    margin-top:75px;
    height:250px;
    border:;
    
	}
	.serviceBox1, .serviceBox2, .serviceBox3{
    float:left;
    width:10%;
    height: 250px; 
    background-color: ;
	}
</style>
</head>
<form name="attendance">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1>
 <hr/>
 <h2  align="center" ><font style="color: green;">Class Attendance</font></h2>
 <table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
 <tr>
  <td><input type="text" id="date" name="date" value="Click here for date"/></td>		
  <td><select name='branch' id='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
  <td>&nbsp;</td>
  <td>
  	<select name="sem" id='sem'>
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
  		<td><select name="section" id='section'>
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>	
 
  <td align="center"><input type="submit" value="Go"   onclick="showCustomer(this.value)"/></td>
  
  <td></td><td align="center"><a href="teacherHome.jsp">Home</a>  </td>
  </tr>
</table>	 
 
</form>
<div id="txtHint">Text will be printed here...</div>

