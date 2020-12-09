<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
   
  
 <script type="text/javascript">
 function showCustomer() {
	   //alert("Hi");
	  var xhttp; 
	  var branch=postattendance.branch.value;
	  var sem=postattendance.sem.value;
	  var section=postattendance.section.value;
	 // alert(branch);
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    //	alert(this.responseText);
	  //  document.getElementById("txtHint").value = this.responseText;
	    var x=document.getElementById("txtHint");
	  //  var option=document.createElement("option");
	    var te=this.responseText;
	    var a=te.split(",");
	    for(i=0;i<a.length-1;i++){
	  //  alert(a);
	    var option=document.createElement("option");
	    	    
	option.text=a[i].toString();
	    x.add(option);
	    }
	    }
	  };
	  xhttp.open("GET", "getSurveyCourses.jsp?branch="+branch+"&sem="+sem+"&section="+section, true);
	  xhttp.send();
	}

</script>
</head>


<body style="background-color: silver;">
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/cess1" name="postattendance" method="post">
	<h3 align="center" class="bars">Course End Survey</h3>
	<table align="center">	
	<!--  	<tr>
			<td>Date</td>
			<td><input type="text" id="datepicker" name="date" value="click here" /></td>		
		</tr>
		<tr>
			<td>Program</td>
			<td><select name="program">
				<option value="btech">B.Tech</option>
				</select>
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
				<option value="ece" >ECE</option>
				<option value="cse" >CSE</option>
				<option value="eee" >EEE</option>
				<option value="it">IT</option>
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section" onchange="showCustomer()">
				<option value="select">Select</option>
				<option value="section1">Section1</option>
				<option value="section2">Section2</option>
				</select>
			</td>		
		</tr>
		<tr>
			<td>Course</td>
			<td><select id="txtHint" name="course">
				<option>Choose</option>
			</select></td>
		</tr>
	
		
	
	<tr>
			<td>Date</td>
			<td><input type="text" name="date" value=" " /></td>		
		</tr> -->
		<tr>
			<td>Program</td>
			<td><select name="program">
				<option value="btech">B.Tech</option>
				</select>
		</tr>
		<tr>
			<td>Semester</td>
			<td><select name="sem" >
				<option value="<%=request.getParameter("sem")%>"><%=request.getParameter("sem")%></option>
				
			
			
			</select></td>		
		</tr>
		<tr>
			<td>Branch</td>
			<td><select name="branch">
				<option value="<%=request.getParameter("branch")%>"><%=request.getParameter("branch")%></option>
				
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section">
				<option value="<%=request.getParameter("section")%>"><%=request.getParameter("section")%></option>
				
				</select>
			</td>		
		</tr>
		<tr>
			<td>Course</td>
			<td><select  name="course">
				<option value="<%=request.getParameter("course")%>"><%=request.getParameter("course")%></option>
			</select></td>
		</tr>
	



<%! private DataSource dataSource;

 %>
 
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
	ResultSet rs=null;
	connection = dataSource.getConnection();
   // System.out.println("got connection from postAttendanceDispla \t"+connection.getClass());
    Statement s=connection.createStatement();
    
    String branch=request.getParameter("branch");
    String sem=request.getParameter("sem");
    String section=request.getParameter("section");
    String course=request.getParameter("course");
    
    
    rs=s.executeQuery("select p1,p2,p3,p4,p5,p6,p7,p8 from courseSurvey where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' ");
    rs.next();
%>
	<tr>
 		<td>CO1</td>
 		<td><textarea  name="p1" rows="4" cols="40"><%=rs.getString("p1") %> </textarea></td>
 	</tr>
 	<tr>
 		<td>CO2</td>
 		<td><textarea  name="p2" rows="4" cols="40"><%=rs.getString("p2") %> </textarea></td>
 	</tr>
 	<tr>
 		<td>CO3</td>
 		<td><textarea  name="p3" rows="4" cols="40"><%=rs.getString("p3") %> </textarea></td>
 	</tr>
 	<tr>
 		<td>CO4</td>
 		<td><textarea  name="p4" rows="4" cols="40"><%=rs.getString("p4") %> </textarea></td>
 	</tr>
 	<tr>
 		<td>CO5</td>
 		<td><textarea  name="p5" rows="4" cols="40"><%=rs.getString("p5") %> </textarea></td>
 	</tr>
 	<tr>
 		<td>CO6</td>
 		<td><textarea  name="p6" rows="4" cols="40"><%=rs.getString("p6") %> </textarea></td>
 	</tr>
 	<tr>
 		<td>CO7</td>
 		<td><textarea  name="p7" rows="4" cols="40"><%=rs.getString("p7") %> </textarea></td>
 	</tr>
 	<tr>
 		<td>CO8</td>
 		<td><textarea  name="p8" rows="4" cols="40"><%=rs.getString("p8") %> </textarea></td>
 	</tr>
 	
 	<tr>
    	<td><input type="submit" value="Update"/></td>
		<td><input type="reset" value="Clear"> </td>
		
	</tr>
</table>	 
 
<%
connection.close();
System.out.println("connection closed");
%>
</form>
</div>
		</div>
	</div>
<%@include file="footer.html" %>

