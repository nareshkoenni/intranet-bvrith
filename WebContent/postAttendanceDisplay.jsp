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
  	function periodValid(){
  		var period=postattendance.period.value;
  		if(period=="choose"){
  			alert("Please Choose Period");
  			postattendance.period.focus();
  			return false;
  	  	}
  		
  	}
  </script>

<style type="text/css">

.serviceBox1{
    float:left;
    width:30%;
    } 
.serviceBox2{
    float:left;
    width:70%;
}
</style>

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
	  xhttp.open("GET", "getcustomer.jsp?branch="+branch+"&sem="+sem+"&section="+section, true);
	  xhttp.send();
	}

	function toggle(source) {
	  checkboxes = document.getElementsByName('absenties');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}

</script>

</head>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<h3 class="bars" align="center">Post Attendance</h3>  <h5 align="right" style="font: bold;">Note: Check absentees only &nbsp;&nbsp;&nbsp;<input type="checkbox" onClick="toggle(this)" /> Check All </h5>
<%
String subject=request.getParameter("course");
if(subject.equals("choose")){
	out.println("<script>alert('Course can not be Empty');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/postAttendance.jsp?uid="+uid+"'</script>"); 
}
%>
<form action="pas" name="postattendance" method="post">

    <div class="serviceBox1">	
	<div class="col-md-6" align="right" >
<table class="table table-bordered" >
	
		<tr>
			<td>Date</td>
			<td><input type="text" name="date" value="<%=request.getParameter("date")%>" class="form-control" /></td>		
		</tr>
		<tr>
			<td>Program</td>
			<td><select name="program" class="btn btn-default dropdown-toggle">
				<option value="btech">B.Tech</option>
				</select>
		</tr>
		<tr>
			<td>Semester</td>
			<td><select name="sem" class="btn btn-default dropdown-toggle">
				<option value="<%=request.getParameter("sem")%>"><%=request.getParameter("sem")%></option>
				
			
			
			</select></td>		
		</tr>
		<tr>
			<td>Branch</td>
			<td><select name="branch" class="btn btn-default dropdown-toggle">
				<option value="<%=request.getParameter("branch")%>"><%=request.getParameter("branch")%></option>
				
			</select></td>		
		</tr>
		<tr>
			<td>Section</td>
			<td><select name="section" class="btn btn-default dropdown-toggle">
				<option value="<%=request.getParameter("section")%>"><%=request.getParameter("section")%></option>
				
				</select>
			</td>		
		</tr>
		<tr>
			<td>Course</td>
			<td><select  name="course" class="btn btn-default dropdown-toggle">
				<option value="<%=request.getParameter("course")%>"><%=request.getParameter("course")%></option>
			</select></td>
		</tr>
	
		<tr>
			<td>Period</td>
			<td><select name="period" class="btn btn-default dropdown-toggle">
				<option value="choose">Choose</option>
				
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="FN - LAB">FN-LAB</option>
				<option value="AN - LAB">AN-LAB</option>
				
			
			</select></td>		
		</tr>
</table>
</div>
</div>



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
    System.out.println("got connection from postAttendanceDisplay \t"+connection.getClass());
    Statement s=connection.createStatement();
    
    String branch=request.getParameter("branch");
    String sem1=request.getParameter("sem");
    String section=request.getParameter("section");
    String year=null;
	String sem=null;
	if(sem1.equals("1/4Sem-I"))
	{
		year="1";
		sem="1";
	}else if(sem1.equals("1/4Sem-II")){
		year="1";
		sem="2";
	}else if(sem1.equals("2/4Sem-I")){
		year="2";
		sem="1";
	}else if(sem1.equals("2/4Sem-II")){
		year="2";
		sem="2";
	}else if(sem1.equals("3/4Sem-I")){
		year="3";
		sem="1";
	}else if(sem1.equals("3/4Sem-II")){
		year="3";
		sem="2";
	}else if(sem1.equals("4/4Sem-I")){
		year="4";
		sem="1";
	}else if(sem1.equals("4/4Sem-II")){
		year="4";
		sem="2";
	}
	String role=null;
	if(section.equals("section1")){
		role="a";
	}else{
		role="b";
	}
	 rs=s.executeQuery("select Username from logindetails where categeory='Student' and Year='"+year+"' and sem='"+sem+"' and Role='"+role+"' and Dept='"+branch+"' ");
	  	
    System.out.println(branch);
    
%>

 <%
 List rollList=new ArrayList();
 int count=4;
 while(rs.next()){
	 rollList.add(rs.getString("Username")); 
 if(count==4){	
	// out.println("if count2");
 %>
 <div class="serviceBox2">
 	<div class="col-md-6" align="right" >
 		<table class="table table-bordered">
 		    
 			<tr>
 				<td><%=rs.getString("Username") %></td>
 				<td><input type="checkbox" name="absenties" style="font-weight: bolder;" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				<td>&nbsp;&nbsp;</td>
 				<%
 					count=3;
 }else if(count==3){
	 //out.println("else count2");
	count=2; 
	
 %>
				<td><%=rs.getString("Username") %></td>
 				<td><input type="checkbox" name="absenties" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				<td>&nbsp;&nbsp;</td>
 <% 
 }
 else if(count==2){
	 //out.println("else count2");
	count=1; 
%>
				 <td><%=rs.getString("Username") %></td>
 				 <td><input type="checkbox" name="absenties" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				 <td>&nbsp;&nbsp;</td>
 <% 
 }else{
	 //out.println("else count2");
	count=4; 
%>
				 <td><%=rs.getString("Username") %></td>
 				 <td><input type="checkbox" name="absenties" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				  <td>&nbsp;&nbsp;</td>
 				 </tr>
 <% 
 }
  
 }
 	session.setAttribute("rollList",rollList);
	 
 %>
 </table>	
 <table>
 
 	<tr>
		<td>Unit & Topic</td>
		<td><input type="text" name="topic" placeholder="Unit - Topic" class="form-control" required="required"/></td><td>&nbsp;</td>		
		<td align="center"><input type="submit" value="Post" class="form-control"  /></td>
 	</tr>
  	
 </table>
			 
 	</div>
 </div>

 
<%
connection.close();
System.out.println("connection closed");
%>
</form>
	</div>
	</div>
</div>

<%@include file="footer.html" %>
</body>
