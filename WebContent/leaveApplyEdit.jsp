<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
   	 $("#datepicker1").datepicker();
 	 });
	$(document).ready(function() {
	   	 $("#datepicker2").datepicker();
	 });
	$(document).ready(function() {
	   	 $("#datepicker3").datepicker();
	 });
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
		element2.name="adjNum[]";
		element2.value=rowCount+1;
		element2.setAttribute("size",1);
		element2.setAttribute("class","form-control");
		cell2.appendChild(element2);
		
		var cell3 = row.insertCell(2);
		var deptValues=["-Select-","cse","ece","eee","it","bsh"];
		var selectHTML="<select name='dept[]' class='btn btn-default dropdown-toggle'>";
		for(var i=0;i<deptValues.length;i++){
			selectHTML+="<option value='"+deptValues[i]+"'>"+deptValues[i]+"</option>";
		}
		selectHTML+="</select>";
		cell3.innerHTML=selectHTML;
		
		var cell4 = row.insertCell(3);
		var semValues=["-Select-","1/4Sem-I","1/4Sem-II","2/4Sem-I","2/4Sem-II","3/4Sem-I","3/4Sem-II","4/4Sem-I","4/4Sem-II"];
		var selectHTML="<select name='sem[]'  class='btn btn-default dropdown-toggle'>";
		for(var i=0;i<semValues.length;i++){
			selectHTML+="<option value='"+semValues[i]+"'>"+semValues[i]+"</option>";
		}
		selectHTML+="</select>";
		cell4.innerHTML=selectHTML;
		
		var cell5 = row.insertCell(4);
		var sectionValues=["-Select-","section1","section2"];
		var selectHTML="<select name='section[]'  class='btn btn-default dropdown-toggle'>";
		for(var i=0;i<sectionValues.length;i++){
			selectHTML+="<option value='"+sectionValues[i]+"'>"+sectionValues[i]+"</option>";
		}
		selectHTML+="</select>";
		cell5.innerHTML=selectHTML;
		
		var cell6 = row.insertCell(5);
		var element3 = document.createElement("input");
		element3.setAttribute("size",15);
		element3.type = "text";
		element3.name = "date[]";
		element3.setAttribute("class","form-control");
		element3.setAttribute("placeholder","mm/dd/yyyy");
		cell6.appendChild(element3);
		
		var cell7= row.insertCell(6);
		var sessionValues=["-Select-","theory","lab","exam"];
		var selectHTML="<select name='session[]'  class='btn btn-default dropdown-toggle'>";
		for(var i=0;i<sessionValues.length;i++){
			selectHTML+="<option value='"+sessionValues[i]+"'>"+sessionValues[i]+"</option>";
		}
		selectHTML+="</select>";
		cell7.innerHTML=selectHTML;
		
		var cell8= row.insertCell(7);
		var periodValues=["-Select-","fn","an","1","2","3","4","5","6","7","8"];
		var selectHTML="<select name='period[]'  class='btn btn-default dropdown-toggle'>";
		for(var i=0;i<periodValues.length;i++){
			selectHTML+="<option value='"+periodValues[i]+"'>"+periodValues[i]+"</option>";
		}
		selectHTML+="</select>";
		cell8.innerHTML=selectHTML;
		
		var cell9= row.insertCell(8);
		  var selectHTML="<select name='faculty[]'  class='btn btn-default dropdown-toggle'><option value='select'>Select</option>";
		  xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function()
		  {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    	var x=document.getElementsByName("faculty[]");
		   		//  var option=document.createElement("option");
		    	var te=this.responseText;
		    	//alert(te);
		    	var a=te.split(",");
		    	
		    	for(var i=0;i<a.length-1;i++){
		    	//	alert(a[i]);
		    
		    	selectHTML+="<option value='"+a[i]+"'>"+a[i]+"</option>";
		   		 }
		    	selectHTML+="</select>";
		    	cell9.innerHTML=selectHTML;
		        }
		    };
		    xhttp.open("GET", "getFacultyWeb.jsp", true);
			  xhttp.send();
			  
		  }
		function getFaculty(){
		xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    var x=document.getElementById("fac");
		 //  alert(x.length);
		  //  var option=document.createElement("option");
		    var te=this.responseText;
		    var a=te.split(",");
		    for(var i=0;i<a.length-1;i++){
		   // alert(a);
		    var option=document.createElement("option");
			option.text=a[i].toString();
		    for(i=0;i<x.length;i++){
				x.add(option);
		    }
		    }
		    }
		  };
		  xhttp.open("GET", "getFacultyWeb.jsp", true);
		  xhttp.send();
		  
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
 
 </script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form method="POST" action="uwsals">
<h3 align="center" class="bars">Leave Application</h3><br>
<%! private DataSource dataSource;%>
	
	<%!
	public void jspInit(){
	   try {
	       // Get DataSource
	       
	       Context initContext  = new InitialContext();
	       Context envContext  = (Context)initContext.lookup("java:/comp/env");
	       dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
	       System.out.println(dataSource);
	   } catch (NamingException e) {
	       e.printStackTrace();
	   }
	}
	%>
	<%
	//response.setContentType("text/html");
	Connection connection=null;
	ResultSet rs=null,rs1=null;
	
	
	connection = dataSource.getConnection();
	
	String lId=request.getParameter("lId");
	//session.setAttribute("uid", uid);

	Statement s=connection.createStatement();
   rs=s.executeQuery("select * from leaves l where l.applicant_id ='"+uid+"' and id='"+lId+"' ");

	  rs.next();
	 
	%>
			
	
  <table align="center">
    
    <tr>
    	
      <td><b>Leave Type:</b></td>
      <td><select name='leaveType' value="<%=rs.getString("l.leave_type")%>">
          <option value="Casual Leave (CL)"  >Casual Leave(CL)</option>
          <option value="Sick Leave (SL)"  >Sick Leave(SL)</option>
          <option  value="Earned Leave (EL)"  >Earned Leave (EL)</option>
          <option  value="Academic Leave (AL)"  >Academic Leave (AL)</option>
          <option value="On Duty (OD)"  >On Duty(OD)</option> 
		  <option  value="Compensatory Casual Leave(CCL)">Compensatory Casual Leave(CCL)</option>
		  <option value="OneHrPerm">One Hour Permission</option> 
		  
        </select></td>
    </tr>
    <tr>
      <td><b>No. of days:</b></td>
      <td><input type='text' name='noOfDays'  value='<%=rs.getString("l.numdays")%>'/></td>
    </tr>
    <tr>
      <td><b>Date:</b></td>
      <td><input type='text' name='fromDate' placeholder="from" value='<%=rs.getString("l.fromDate")%>' id="datepicker1"/><input type='text' name='toDate' placeholder="to" value='<%=rs.getString("l.toDate")%>' id="datepicker2"/></td>
	</tr>
	<tr>
      <td><b>Purpose:</b></td>
      <td>
	  
	  <textarea cols=35 rows=2 name="purpose" ><%=rs.getString("l.purpose")%></textarea>
        <span class="error"></span></td>
    </tr>
	<tr>
		<td></td>
		<td><input type="hidden" name="leaveId" value="<%=lId%>"></td>
	</tr>
		
  </table>
  
  <table align="center" border="1"  width="1000">
    <tr>
    	<th width="1%"></th>
    	<th width="1%"></th>
      	<th width="10%">Department</th>
      	<th width="5%">Sem</th>
      	<th width="10%">Section</th>
      	<th width="8%">Date</th>
      	<th width="7%">Session</th>
      	<th width="8%">Period</th>
      	<th width="10%">Faculty</th>
      	<th width="1%"></th>
      	
    </tr>
    
			
		
	<tr>
		<td colspan="10">
	 		<table id="dataTable" width="100%">
	 		 <%
		rs1=s.executeQuery("select * from  adjust a where a.applicant_id ='"+uid+"' and leaveId='"+lId+"' order by id desc");
		while(rs1.next()){
		%>
	 			<tr>
					 <TD width="2%"><INPUT type="checkbox" name="chk"/></TD>
					<TD width="10%"><select name="dept[]" class="btn btn-default dropdown-toggle">
							 <option value="<%=rs1.getString("a.department")%>"><%=rs1.getString("a.department")%></option>
							<option value="cse">cse</option>
							<option value="ece">ece</option>
							<option value="eee">eee</option>
							<option value="it">it</option>
							<option value="bsh">bsh</option>
							
						</select> 
					</TD>
					<td width="10%">
						<select name="sem[]"  class="btn btn-default dropdown-toggle">
							 <option value="<%=rs1.getString("a.sem")%>"><%=rs1.getString("a.sem")%></option>
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
					<td width="10%">
						<select name="section[]"  class="btn btn-default dropdown-toggle" >
							 <option value="<%=rs1.getString("a.section")%>"><%=rs1.getString("a.section")%></option>
							<option value="section1">Section1</option>
							<option value="section2">Section2</option>
						</select>
					</td>
					<td width="10%"><input type="text" id="datepicker3" name="date[]" value='<%=rs1.getString("a.adj_date")%>' placeholder="mm/dd/yyyy" class="form-control"/></td>	
					
					<td width="10%"> 
						<select  name="session[]"  class="btn btn-default dropdown-toggle">
        				  <option value='<%=rs1.getString("a.session")%>'><%=rs1.getString("a.session")%></option>
          				  <option value="lab">Lab</option>
         				  <option value="theory">Theory</option>
         				  <option value="exam">exam</option>
         				 </select>
     			    </td>
     				 <td width="10%">
     				 	 <select  name="period[]"  class="btn btn-default dropdown-toggle" required>
          					<option value='<%=rs1.getString("a.period")%>'><%=rs1.getString("a.period")%></option>
          					<option value="FN" class="Lab">fn</option>
         					 <option value="AN" class="Lab">an</option>
         					 <option value="1" class="Theory">1</option>
					          <option value="2" class="Theory">2</option>
					          <option value="3" class="Theory">3</option>
					          <option value="4" class="Theory">4</option>
					          <option value="5" class="Theory">5</option>
					          <option value="6" class="Theory">6</option>
					          <option value="7" class="Theory">7</option>
					          <option value="8" class="Theory">8</option>
        				</select>
      				</td>
      				<td width="10%"> 	
      					<select  name="faculty[]"  onclick="getFaculty()" id="fac"  class="btn btn-default dropdown-toggle" required="required">
				          <option value='<%=rs1.getString("a.adj_with_id")%>'><%=rs1.getString("a.adj_with_id")%></option>
				         </select>
      				</td>
					<td width="100%">
						<INPUT type="button" value="Add" onclick="addRow('dataTable')" />
			
						<INPUT type="button" value="Delete" onclick="deleteRow('dataTable')" />
					</td>
				</tr>
				<%  } %>
   			</table>
   		</td>
   	</tr>
	<tr>
      <td></td>
	 
    
      <td colspan="5" align="center"><input type='submit' name='btnUpdate' value='Update'/></td>
	
    </tr> 
    </table>

</form>

		</div>
		
	</div>
		
</div>


</body>
