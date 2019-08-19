<meta charset="ISO-8859-1">
<title>MRECW-ADMIN</title>
</head>
<body style="background-color: silver;">
<table align="center" style="border:none"  width="500">
<tr valign=top>
<td style="border:none"><img src="images/clg.png" width="500" height="95" ></td>
 
</tr>

</table><hr>
<form action="asts" method="post">
<h2 align="center" style="color: blue;">Add Student</h2>
	<table align="center">	
	<tr>
			<td>Course</td>
			<td><select name="course">
				<option value="btech">B.Tech</option>
		</tr>
		<tr>
			<td>Semester</td>
			<td><select name="sem" >
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
			<td><select name="branch">
				<option value="cse" selected="selected">CSE</option>
				<option value="ece" selected="selected">ECE</option>
				<option value="eee" selected="selected">EEE</option>
				<option value="it" selected="selected">IT</option>
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>		
		</tr>
<tr>
<td>Upload Excel</td>
<td> <input type="file" name="fname" /></td>
</tr>
<tr>

<td align="center"> <a href="adminHome.jsp">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Upload" /></td>
</tr>
</table>
</form>