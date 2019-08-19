<form action="ass" method="POST">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500 height="95"></h1>
 <hr/>
 <h2  align="center" ><font style="color: green;">Add Subject</font></h2>
 <table align="center" style="border-style: dashed; background: silver; height: 150px; width: 300px;">
 <tr>
 <td>Subject ID</td><td><input type="text" name="subjectId" value="ex. WT-A50312 "/></td>
 </tr>
 <tr>
 <td>Subject Name</td><td><input type="text" name="subjectName"/></td>
 </tr>
 <tr>
 <td>Branch</td>
  <td><select name='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> 
  </select></td>
</tr>
<tr>
	<td>Sem</td>
  
 <td>
  	<select name="sem" >
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
  </tr>
  <tr>
  	<td>Branch</td>
  
  		<td><select name="section">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>	
 </tr>
 <tr>
<tr>
 <td>Regulation</td>
  <td><select name='regulation'><option value=''>Select Regulation</option><option value='r13'>R13</option><option value='r09'>R09</option> </select></td>
</tr>
<tr>
<td align="center"><a href="adminHome.jsp">Back</a></td>
<td align="center"><input type="submit" value="Add" /></td>
</tr>
</table>	 
 
</form>
