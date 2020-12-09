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
	<style>
      .cocontainer {
        width: 400px;
        height: 190px;
        align-content: center;
        padding: 25px 15px 5px;
      }
      .cocontainer:before,
      .cocontainer:after {
        content: "";
        display: table;
        clear: both;
      }
      .cocontainer div {
        float: left;
        width: 50px;
        height: 50px;
      }
    </style>

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
	ResultSet rs=null,rs1=null, rsco=null,rsCOcount=null,rsLabco=null,rsLabCOcount=null;
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
    Statement cos=connection.createStatement();
    
    rs1=s.executeQuery("select distinct faculty from courseendfeedback where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"'");
    if(rs1.next()){
    	faculy=rs1.getString("faculty");
    }
    
    rsco=s.executeQuery("select p1,p2,p3,p4,p5,p6,p7,p8 from courseSurvey where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' ");
    String cop1=null,cop2=null,cop3=null,cop4=null,cop5=null,cop6=null;
    if(rsco.next()){
    	cop1=rsco.getString("p1");
    	cop2=rsco.getString("p2");
    	cop3=rsco.getString("p3");
    	cop4=rsco.getString("p4");
    	cop5=rsco.getString("p5");
    	cop6=rsco.getString("p6");
    }
    
    rsLabco=s.executeQuery("select p1,p2,p3,p4 from courseSurvey where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' ");
    String labcop1=null,labcop2=null,labcop3=null,labcop4=null;
    if(rsLabco.next()){
    	labcop1=rsLabco.getString("p1");
    	labcop2=rsLabco.getString("p2");
    	labcop3=rsLabco.getString("p3");
    	labcop4=rsLabco.getString("p4");
    }
    
    
    rs=s.executeQuery("select count( rollNumber),avg(p1),avg(p2),avg(p3),avg(p4),avg(p5),avg(p6),avg(p7),avg(p8),avg(tlp1),avg(tlp2),avg(tlp3),avg(tlp4),avg(tlp4),avg(tlp5),avg(tlp6),avg(tlp7),avg(tlp8),section from courseendfeedback where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by course,section");
    
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
    	
    %>
 <table align="center"  style="width: 300px;">
<tr><th>Branch</th><th>:</th><td  align=""><%=branch.toUpperCase()%> </td><tr>
<tr><th>Semester</th><th>:</th><td  align=""> <%=sem%> </td></tr>
<tr><th>Section</th><th>:</th><td  align=""> <%=section%></td></tr>
<tr><th>Course</th><th>:</th> <td  align=""> <%=course%> </td></tr>
<tr><th>Faculty Member</th><th>:</th><td  align=""><%=faculy%> </td></tr>
<tr><th>Batch</th><th>:</th> <td  align=""><%=acyear%></td> </tr>
  </table>
   <table align="center" border="" style="width: 700px;">
 <tr><td colspan="3"><h4 align="center" style="color: blue;" ><b>Teaching-Learning</b></h4> </td></tr>
 <tr><td>S.No</td><td>No.of Students given</td><td><%=rs.getInt(1) %></tr>
 <tr><td align="center">1</td><td>Enlighting introduction to the subject and creation of interest</td><td><%=p11 %></td></tr>
 <tr><td align="center">2</td><td>Planning and delivery of the Subject</td><td><%=p12 %></td></tr>
 <tr><td align="center">3</td><td>Lectures are knowledgeable, clear and audible</td><td><%=p13 %></td></tr>
 <tr><td align="center">4</td><td>Usage of the board is Clear and Visible</td><td><%=p14 %></td></tr>
 <tr><td align="center">5</td><td>Quality of Internal Evaluation</td><td><%=p15 %></td></tr>
 <tr><td align="center">6</td><td>Encouragement for Questions and innovative ideas</td><td><%=p16 %></td></tr>
 <tr><td align="center">7</td><td>Maintenance of Regularity and Discipline</td><td><%=p17 %></td></tr>
 <tr><td align="center">8</td><td>Innovative methods for Teaching</td><td><%=p18 %></td></tr>
 <tr><td colspan="2" align="center">Percentage</td><td><%=(p11+p12+p13+p14+p15+p16+p17+p18)*20/8 %></td></tr>
 
 <%
 if(course.contains("LAB")){
 %>
 
<tr><td colspan="3"><h4 align="center" style="color: blue;" ><b>Course OutComes</b></h4> </td></tr>
<tr><td colspan="2">CO1-<%=labcop1%></td><td><%=p1 %></td></tr>
<tr><td colspan="2">CO2-<%=labcop2%></td><td><%=p2 %></td></tr>
<tr><td colspan="2">CO3-<%=labcop3%></td><td><%=p3 %></td></tr>
<tr><td colspan="2">CO4-<%=labcop4%></td><td><%=p4 %></td></tr>
<tr><td colspan="2" align="center">Percentage</td><td><%=(p1+p2+p3+p4)*20/4 %></td></tr>
 </table>
 <table align="center"> <tr><td>
 <div class="cocontainer" align="center">
    <div id="" align="center">
 <%
   rsLabCOcount=cos.executeQuery("SELECT p1,count(p1) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p1 order by p1 desc ");
   out.println("<b><u>CO1</u></b>");
   	while(rsLabCOcount.next()){
 %>
 		<% out.println(rsLabCOcount.getInt(1)+"-"+rsLabCOcount.getInt(2)); %> 
 <br>
<% 	 
   	}
%>   
  </div>
  
 <div id=""> 
 <%
 rsLabCOcount=cos.executeQuery("SELECT p2,count(p2) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p2 order by p2 desc ");
   out.println("<b><u>CO2</u></b>");
   	while(rsLabCOcount.next()){
 %>
 		<% out.println(rsLabCOcount.getInt(1)+"-"+rsLabCOcount.getInt(2)); %> 
 <br>
<% 	 
   	}
%>   
</div> 

 <div id="">
 <%
 rsLabCOcount=cos.executeQuery("SELECT p3,count(p3) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p3 order by p3 desc ");
   out.println("<b><u>CO3</u></b>");
   	while(rsLabCOcount.next()){
 %>
 		<% out.println(rsLabCOcount.getInt(1)+"-"+rsLabCOcount.getInt(2)); %>  
 <br>
<% 	 
   	}
%> 
</div>  

<div id="">
<%
rsLabCOcount=cos.executeQuery("SELECT p4,count(p4) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p4 order by p4 desc ");
   out.println("<b><u>CO4</u></b>");
   	while(rsLabCOcount.next()){
 %>
 		<% out.println(rsLabCOcount.getInt(1)+"-"+rsLabCOcount.getInt(2)); %>  
 <br>
<% 	 
   	}
%>
</div>
</div>
 </td>
 </tr>
 </table>
 
 
<% 
 }else{
%>

<tr><td colspan="3"><h4 align="center" style="color: blue;" ><b>Course OutComes</b></h4> </td></tr>
<tr><td colspan="2"><b>CO1</b>-<%=cop1 %> </td><td><%=p1 %></td></tr>
<tr><td colspan="2"><b>CO2</b>-<%=cop2 %> </td><td><%=p2 %></td></tr>
<tr><td colspan="2"><b>CO3</b>-<%=cop3 %> </td><td><%=p3 %></td></tr>
<tr><td colspan="2"><b>CO4</b>-<%=cop4 %> </td><td><%=p4 %></td></tr>
<tr><td colspan="2"><b>CO5</b>-<%=cop5 %> </td><td><%=p5 %></td></tr>
<tr><td colspan="2"><b>CO6</b>-<%=cop6 %> </td><td><%=p6 %></td></tr>

<tr><td colspan="2" align="center">Percentage</td><td><%=(p1+p2+p3+p4+p5+p6)*20/6 %></td>
</table>
 <table align="center"> <tr><td>
 <div class="cocontainer" align="center">
    <div id="" align="center">
 <%
   rsCOcount=cos.executeQuery("SELECT p1,count(p1) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p1 order by p1 desc ");
   out.println("<b><u>CO1</u></b>");
   	while(rsCOcount.next()){
 %>
 		<% out.println(rsCOcount.getInt(1)+"-"+rsCOcount.getInt(2)); %> 
 <br>
<% 	 
   	}
%>   
  </div>
  
 <div id=""> 
 <%
   rsCOcount=cos.executeQuery("SELECT p2,count(p2) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p2 order by p2 desc ");
   out.println("<b><u>CO2</u></b>");
   	while(rsCOcount.next()){
 %>
 		<% out.println(rsCOcount.getInt(1)+"-"+rsCOcount.getInt(2)); %> 
 <br>
<% 	 
   	}
%>   
</div> 

 <div id="">
 <%
   rsCOcount=cos.executeQuery("SELECT p3,count(p3) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p3 order by p3 desc ");
   out.println("<b><u>CO3</u></b>");
   	while(rsCOcount.next()){
 %>
 		<% out.println(rsCOcount.getInt(1)+"-"+rsCOcount.getInt(2)); %>  
 <br>
<% 	 
   	}
%> 
</div>  

<div id="">
<%
   rsCOcount=cos.executeQuery("SELECT p4,count(p4) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p4 order by p4 desc ");
   out.println("<b><u>CO4</u></b>");
   	while(rsCOcount.next()){
 %>
 		<% out.println(rsCOcount.getInt(1)+"-"+rsCOcount.getInt(2)); %>  
 <br>
<% 	 
   	}
%>
</div>

<div id="">
<%
   rsCOcount=cos.executeQuery("SELECT p5,count(p5) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p5 order by p5 desc ");
   out.println("<b><u>CO5</u></b>");
   	while(rsCOcount.next()){
 %>
 		<% out.println(rsCOcount.getInt(1)+"-"+rsCOcount.getInt(2)); %>  
 <br>
<% 	 
   	}
%> 
</div>

<div id="">
<%
   rsCOcount=cos.executeQuery("SELECT p6,count(p6) FROM courseendfeedback WHERE branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' and acyear='"+acyear+"' group by p6 order by p6 desc ");
   out.println("<b><u>CO6</u></b>");
   	while(rsCOcount.next()){
 %>
 		<% out.println(rsCOcount.getInt(1)+"-"+rsCOcount.getInt(2)); %>  
 <br>
<% 	 
   	}
%>
</div>
 </div>
 </td></tr></table>
 
<%   
 } //else	
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