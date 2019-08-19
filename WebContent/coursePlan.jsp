
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
 
	function addRow(tableID) {

		var table = document.getElementById(tableID);

		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);

		var cell1 = row.insertCell(0);
		var element1 = document.createElement("input");
		element1.type = "checkbox";
		element1.name="chkbox[]";
		cell1.appendChild(element1);

		var cell2 = row.insertCell(1);
		//cell2.innerHTML = rowCount + 1;
		var element2 = document.createElement("input");
		element2.type = "text";
		element2.name="txtbox1[]";
		element2.value=rowCount+1;
		element2.setAttribute("size",3);
		cell2.appendChild(element2);
		
		var cell3 = row.insertCell(2);
		var element3 = document.createElement("input");
		element3.setAttribute("size",3);
		element3.type = "text";
		element3.name = "txtbox2[]";
		cell3.appendChild(element3);
		
		var cell4 = row.insertCell(3);
		var element4 = document.createElement("input");
		element4.setAttribute("size",15);
		element4.type = "text";
		element4.name = "txtbox3[]";
		element4.setAttribute("placeholder","mm/dd/yyyy");
		cell4.appendChild(element4);
		
		var cell5 = row.insertCell(4);
		var element5 = document.createElement("input");
		element5.type = "text";
		element5.name = "txtbox4[]";
		element5.setAttribute("size",25);
		cell5.appendChild(element5);
		
		var cell6 = row.insertCell(5);
		var element6 = document.createElement("input");
		element6.type = "text";
		element6.name = "txtbox5[]";
		cell6.appendChild(element6);
		element6.setAttribute("size",28);
		
		var cell7 = row.insertCell(6);
		var element7 = document.createElement("input");
		element7.type = "text";
		element7.name = "txtbox6[]";
		cell7.appendChild(element7);
		element7.setAttribute("size",15);
		
		var cell8 = row.insertCell(7);
		var element8 = document.createElement("input");
		element8.type = "text";
		element8.name = "txtbox7[]";
		element8.setAttribute("size",20);
		cell8.appendChild(element8);
		
		var cell9 = row.insertCell(8);
		var element9 = document.createElement("input");
		element9.type = "text";
		element9.name = "txtbox8[]";
		element9.setAttribute("size",3);
		cell9.appendChild(element9);



	}

	function deleteRow(tableID) {
		try {
		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;

		for(var i=0; i<rowCount; i++) {
			var row = table.rows[i];
			var chkbox = row.cells[0].childNodes[0];
			if(null != chkbox && true == chkbox.checked) {
				table.deleteRow(i);
				rowCount--;
				i--;
			}


		}
		}catch(e) {
			alert(e);
		}
	}
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
<form action="cpcs" name="postattendance" method="post">
	<h3 align="center" class="bars">Course Plan</h3><br>
	
	<table align="center" width="80%">	
		<tr>
			<td width="15%">Course Code</td>
			<td width="15%"><input type="date" name="courseCode" class="form-control" size="9"/> </td>
			<td width="8%">Instructor</td>
			<td width="10%" colspan="3">
			<input type="text" name="instructor" value="<%=uid%>" class="form-control" size="20"/>
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
	
	
	
	
	<table width=100%>
	<tr>
			<th width="2%"></th>
			<th width="7%">S.No</th>
			<th  width="10%">Unit</th>
			<th  width="12%">Date</th>
			<th width="24%">Topic to be covered</th>
			<th width="24%">Text/Reference Book</th>
			<th width="18%">Ch.No-PageNo</th>
			<th width="18%">Web Resource</th>
			<th width="5%">CO</th>
			<th width="15%" colspan="2"></th>
		
		</tr>
	
	<tr><td colspan="11">
	<table id="dataTable" width="100%"  align="center"> 
		<TR>
			<TD width="2%"><INPUT type="checkbox" name="chk"/></TD>
			<TD width="5%"><input type="text" value="1" name="txtbox1[]" size="3" class=""/> </TD>
			<td width="8%"> <INPUT type="text" name="txtbox2[]" size="3"/></td>
			<TD width="15%"> <INPUT type="text" name="txtbox3[]" id="datepicker"  placeholder="mm/dd/yyyy" size="15"/> </TD>
			<TD width="18%"> <INPUT type="text" name="txtbox4[]" size="25"/> </TD>
			<TD width="18%"> <INPUT type="text" name="txtbox5[]" size="28"/> </TD>
			<TD width="16%"> <INPUT type="text" name="txtbox6[]" size="15"/> </TD>
			<TD width="13%"> <INPUT type="text" name="txtbox7[]" size="20"/> </TD>
			<td width="5%"> <INPUT type="text" name="txtbox8[]" size="3"/></td>
			<td style="border: none;" width="20%">
				<INPUT type="button" value="Add" onclick="addRow('dataTable')" />
			</td>
			<td>	<INPUT type="button" value="Delete" onclick="deleteRow('dataTable')" />
			</td>
		</tr>
	</TABLE>
	<tr>
	<tr><td colspan="11">
	<table   align="center">	
	 	<tr>
    		<td colspan="5"><input type="reset" value="Clear" class="form-control"> </td>
			<td colspan="5"><input type="submit" value="Store" class="form-control"/></td>
			<td></td>
		</tr>
	</table>
	</tr>
</table>


</form>

		</div>
		
	</div>
		
</div>
<h5 align="center" style="color: red; font-weight:bold;"><marquee >It is best viewed in Mozilla Firefox</marquee></h5>
<%@include file="footer.html" %>
</body>