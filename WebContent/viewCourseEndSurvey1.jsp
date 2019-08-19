<%@page import="java.math.BigDecimal"%>
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
  	function dateValid(){
  		var date=postattendance.date.value;
  		if(date=="click here" || date==""){
  			alert("Please Choose date");
  			postattendanceDisplay.date.focus();
  	  	}
  		return false;
  	}
  </script>
  <script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
  $http.get("one.json").then(function (response) {
      $scope.myData = response.data.subjects;
  });
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
<!--  <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1> -->

<body >
<%@include file="header.jsp"%>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewCourseEndSurvey1.jsp?uid=<%=uid%>" name="postattendance" method="post">
	<h3 align="center" class="bars">Course End Survey</h3>
	
</form>
<hr/>

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
	ResultSet rs=null,rs1=null;
	connection = dataSource.getConnection();
	String branch=request.getParameter("branch");
	String section=request.getParameter("section");
	String sem=request.getParameter("sem");
	String course=request.getParameter("course");
	String acyear=request.getParameter("acyear");
	String faculy=null;
	System.out.println(branch+"\t"+section);
	
    System.out.println("got connection from viewfeedback2 \t"+connection.getClass());
    Statement s=connection.createStatement();
    rs1=s.executeQuery("select distinct faculty from courseendfeedback where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"'");
    if(rs1.next()){
    	faculy=rs1.getString("faculty");
    }
    rs=s.executeQuery("select count(distinct rollNumber),avg(p1),avg(p2),avg(p3),avg(p4),avg(p5),avg(p6),avg(p7),avg(p8),avg(tlp1),avg(tlp2),avg(tlp3),avg(tlp4),avg(tlp4),avg(tlp5),avg(tlp6),avg(tlp7),avg(tlp8),section from courseendfeedback where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by course,section");
    
    if(rs.next()){
    	double p1=rs.getDouble(2);
    	double p2=rs.getDouble(3);
    	double p3=rs.getDouble(4);
    	double p4=rs.getDouble(5);
    	double p5=rs.getDouble(6);
    	double p6=rs.getDouble(7);
    	double p7=rs.getDouble(8);
    	double p8=rs.getDouble(9);
    	double p11=rs.getDouble(10);
    	double p12=rs.getDouble(11);
    	double p13=rs.getDouble(12);
    	double p14=rs.getDouble(13);
    	double p15=rs.getDouble(14);
    	double p16=rs.getDouble(15);
    	double p17=rs.getDouble(16);
    	double p18=rs.getDouble(17);

  //  	System.out.println(p1+"\t"+p2);
    	if(course.contains("LAB")){
    %>
 <table align="center"  style="width: 300px;">
<tr><th>Branch</th><th>:</th><td  align=""><%=branch.toUpperCase()%> </td><tr>
<tr><th>Semester</th><th>:</th><td  align=""> <%=sem%> </td></tr>
<tr><th>Section</th><th>:</th><td  align=""> <%=section%></td></tr>
<tr><th>Course</th><th>:</th> <td  align=""> <%=course%> </td></tr>
<tr><th>Faculty Member</th><th>:</th><td  align=""><%=faculy%> </td></tr>
<tr><th>Academic Year</th><th>:</th> <td  align=""><%=acyear%></td> </tr>
  </table>
   <table align="center" border="" style="width: 500px;">
 <tr><td colspan="3"><h4 align="center" style="color: blue;" >Teaching-Learning</h4> </td></tr>
 <tr><td>S.No</td><td>No.of Students given</td><td><%=rs.getInt(1) %></tr>
 <tr><td>1</td><td>Enlighting introduction to the subject and creation of interest</td><td><%=p11 %></td></tr>
 <tr><td>2</td><td>Planning and delivery of the Subject</td><td><%=p12 %></td></tr>
 <tr><td>3</td><td>Lectures are knowledgeable, clear and audible</td><td><%=p13 %></td></tr>
 <tr><td>4</td><td>Usage of the board is Clear and Visible</td><td><%=p14 %></td></tr>
 <tr><td>5</td><td>Quality of Internal Evaluation</td><td><%=p15 %></td></tr>
 <tr><td>6</td><td>Encouragement for Questions and innovative ideas</td><td><%=p16 %></td></tr>
 <tr><td>7</td><td>Maintenance of Regularity and Discipline</td><td><%=p17 %></td></tr>
 <tr><td>8</td><td>Innovative methods for Teaching</td><td><%=p18 %></td></tr>
 <tr><td colspan="2" align="center">Percentage</td><td><%=(p11+p12+p13+p14+p15+p16+p17+p18)*20/8 %></td></tr>
 
 
 
<tr><td colspan="3"><h4 align="center" style="color: blue;" >Course OutComes</h4> </td></tr>
<tr><td>1</td><td>CO1</td><td><%=p1 %></td></tr>
<tr><td>2</td><td>CO2</td><td><%=p2 %></td></tr>
<tr><td>3</td><td>CO3</td><td><%=p3 %></td></tr>
<tr><td>4</td><td>CO4</td><td><%=p4 %></td></tr>
<tr><td colspan="2" align="center">Percentage</td><td><%=(p1+p2+p3+p4)*20/4 %></td>
 </table>
<% 
 }else{
%>
	<table align="center"  style="width: 300px;">
<tr><th>Branch</th><th>:</th><td  align=""><%=branch.toUpperCase()%> </td><tr>
<tr><th>Semester</th><th>:</th><td  align=""> <%=sem%> </td></tr>
<tr><th>Section</th><th>:</th><td  align=""> <%=section%></td></tr>
<tr><th>Course</th><th>:</th> <td  align=""> <%=course%> </td></tr>
<tr><th>Faculty Member</th><th>:</th><td  align=""><%=faculy%> </td></tr>
<tr><th>Academic Year</th><th>:</th> <td  align=""><%=acyear%></td> </tr>
  </table>
   <table align="center" border="" style="width: 600px;">
 <tr><td colspan="3"><h4 align="center" style="color: blue;" >Teaching-Learning</h4> </td></tr>
 <tr><td>S.No</td><td>No.of Students given</td><td><%=rs.getInt(1) %></tr>
 <tr><td>1</td><td>Enlighting introduction to the subject and creation of interest</td><td><%=p11 %></td></tr>
 <tr><td>2</td><td>Planning and delivery of the Subject</td><td><%=p12 %></td></tr>
 <tr><td>3</td><td>Lectures are knowledgeable, clear and audible</td><td><%=p13 %></td></tr>
 <tr><td>4</td><td>Usage of the board is Clear and Visible</td><td><%=p14 %></td></tr>
 <tr><td>5</td><td>Quality of Internal Evaluation</td><td><%=p15 %></td></tr>
 <tr><td>6</td><td>Encouragement for Questions and innovative ideas</td><td><%=p16 %></td></tr>
 <tr><td>7</td><td>Maintenance of Regularity and Discipline</td><td><%=p17 %></td></tr>
 <tr><td>8</td><td>Innovative methods for Teaching</td><td><%=p18 %></td></tr>
 <tr><td colspan="2" align="center">Percentage</td><td><%=(p11+p12+p13+p14+p15+p16+p17+p18)*20/8 %></td></tr>
 
 
 
<tr><td colspan="3"><h4 align="center" style="color: blue;" >Course OutComes</h4> </td></tr>
<tr><td>1</td><td>CO1</td><td><%=p1 %></td></tr>
<tr><td>2</td><td>CO2</td><td><%=p2 %></td></tr>
<tr><td>3</td><td>CO3</td><td><%=p3 %></td></tr>
<tr><td>4</td><td>CO4</td><td><%=p4 %></td></tr>
<tr><td>5</td><td>CO5</td><td><%=p5 %></td></tr>
<tr><td>6</td><td>CO6</td><td><%=p6 %></td></tr>

<tr><td colspan="2" align="center">Percentage</td><td><%=(p1+p2+p3+p4+p5+p6)*20/6 %></td>
 </table>
<% 	 
 }
 }else{
	 out.println("<script>alert('No Feedback was given. Pls Choose another one');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/viewCourseEndSurvey.jsp'</script>");
     
 }
connection.close();
System.out.println("connection closed");
%>

 
 </div>
 </div>
 </div>
<%@include file="footer.html" %>
</body>