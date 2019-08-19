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
	    var a=te.split(" ");
	    for(i=0;i<a.length-1;i++){
	  //  alert(a);
	    var option=document.createElement("option");
	    	    
	option.text=a[i].toString();
	    x.add(option);
	    }
	    }
	  };
	  xhttp.open("GET", "/getcustomer.jsp?branch="+branch+"&sem="+sem+"&section="+section, true);
	  xhttp.send();
	}

</script>

</head>
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1>

<body style="background-color: silver;">


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
   // System.out.println("got connection from postAttendanceDispla \t"+connection.getClass());
    
    String branch=request.getParameter("branch");
    String sem=request.getParameter("sem");
    String section=request.getParameter("section");
    String course=request.getParameter("course");
    String rollNumber=request.getParameter("rollNumber").toUpperCase();
    String faculty=request.getParameter("faculty");
    String acyear=request.getParameter("acyear");
    
    //  Statement s=connection.createStatement();
  	Statement s=connection.createStatement();
    
    rs=s.executeQuery("select * from courseEndFeedback where sem='"+sem+"' and branch='"+branch+"' and rollNumber='"+rollNumber+"' and nt=1 and course='"+course+"' ");
    if(rs.next()){
    	//RequestDispatcher rd=request.getRequestDispatcher("courseEndFeedback.jsp");
		//rd.include(request, response);
		//out.println("<h4 align='center' style='color:red;'>\t"+course+ "</h4>");
		 out.println("<script>alert('You already have given feedback to \t"+course+ "');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/courseEndFeedback.jsp'</script>");

    }else{
    session.setAttribute("branch",branch);
    session.setAttribute("sem",sem);
    session.setAttribute("section",section);
    session.setAttribute("course",course);
    session.setAttribute("rollNumber",rollNumber);
    session.setAttribute("date",request.getParameter("date"));
    session.setAttribute("faculty",faculty);
    session.setAttribute("acyear",acyear);
      
    Statement s1=connection.createStatement();
    
    rs1=s1.executeQuery("select p1,p2,p3,p4,p5,p6,p7,p8 from courseSurvey where branch='"+branch+"' and section='"+section+"' and sem='"+sem+"' and course='"+course+"' ");
    if(rs1.next()){
%>
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/cefs" name="postattendance" method="post">
	<h3 align="center" class="bars">Course End Feedback</h3>
	<table align="center" border="2">	

<tr>
<th>RollNumber</th>
<td colspan="6"><%=rollNumber%></td>
</tr>
<tr>
<th>Branch</th>
<td colspan="6"><%=branch%></td>
</tr>
<tr>

<th>Semester</th>
<td><%=sem%> </td>
<td colspan="5"><font color="red">Note: All Fields are Mandatory to fill</font></td>
</tr>
<tr>
<th>Course</th>
<td><%=course%></td>
</tr>
<tr>
<th>Faculty</th>
<td><%=faculty%></td>
</tr>
<tr>
<th>Academic year</th>
<td><%=acyear%></td>
</tr>
<tr>
<th>&nbsp;</th>
<td colspan="6">Your frank and unbiased evaluation of the Course helps the Teacher as well as the Department to improve Teaching-Learning Process. <b>You are requested to select only the registered Courses.</b> </td>
</tr>
<tr>
<th colspan="7" style="color: blue;">Evaluation of Teaching-Learning Process  </th>
</tr>
<tr>
<th>S.No</th>
<th>Evaluation Criteria</th>
<th>Poor</th>
<th>Below Average</th>
<th>Average</th>
<th>Good</th>
<th>Very Good</th>
</tr>
<tr>
<td align="center">1</td>
<td>Enlighting introduction to the subject and creation of interest</td>
<td align="center"><input type="radio" name="tlp1" value="1" /> </td>
<td align="center"><input type="radio" name="tlp1" value="2" /> </td>
<td align="center"><input type="radio" name="tlp1" value="3" /> </td>
<td align="center"><input type="radio" name="tlp1" value="4" /> </td>
<td align="center"><input type="radio" name="tlp1" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">2</td>
<td>Planning and delivery of the Subject</td>
<td align="center"><input type="radio" name="tlp2" value="1"/> </td>
<td align="center"><input type="radio" name="tlp2" value="2"/> </td>
<td align="center"><input type="radio" name="tlp2" value="3"/> </td>
<td align="center"><input type="radio" name="tlp2" value="4"/> </td>
<td align="center"><input type="radio" name="tlp2" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">3</td>
<td>Lectures are knowledgeable, clear and audible </td>
<td align="center"><input type="radio" name="tlp3" value="1"/> </td>
<td align="center"><input type="radio" name="tlp3" value="2"/> </td>
<td align="center"><input type="radio" name="tlp3" value="3"/> </td>
<td align="center"><input type="radio" name="tlp3" value="4"/> </td>
<td align="center"><input type="radio" name="tlp3" value="5" required="required"/> </td>
</tr>

<tr>
<td align="center">4</td>
<td>Usage of the board is Clear and Visible</td>
<td align="center"><input type="radio" name="tlp4" value="1"/> </td>
<td align="center"><input type="radio" name="tlp4" value="2"/> </td>
<td align="center"><input type="radio" name="tlp4" value="3"/> </td>
<td align="center"><input type="radio" name="tlp4" value="4"/> </td>
<td align="center"><input type="radio" name="tlp4" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">5</td>
<td>Quality of Internal Evaluation</td>
<td align="center"><input type="radio" name="tlp5" value="1"> </td>
<td align="center"><input type="radio" name="tlp5" value="2"> </td>
<td align="center"><input type="radio" name="tlp5" value="3"> </td>
<td align="center"><input type="radio" name="tlp5" value="4"> </td>
<td align="center"><input type="radio" name="tlp5" value="5" required="required"> </td>
</tr>
<tr>
<td align="center">6</td>
<td>Encouragement for Questions and innovative ideas</td>
<td align="center"><input type="radio" name="tlp6" value="1"/> </td>
<td align="center"><input type="radio" name="tlp6" value="2"/> </td>
<td align="center"><input type="radio" name="tlp6" value="3"/> </td>
<td align="center"><input type="radio" name="tlp6" value="4"/> </td>
<td align="center"><input type="radio" name="tlp6" value="5" required="required"/> </td>
</tr>

<tr>
<td align="center">7</td>
<td>Maintenance of Regularity and Discipline</td>
<td align="center"><input type="radio" name="tlp7" value="1"/> </td>
<td align="center"><input type="radio" name="tlp7" value="2"/> </td>
<td align="center"><input type="radio" name="tlp7" value="3"/> </td>
<td align="center"><input type="radio" name="tlp7" value="4"/> </td>
<td align="center"><input type="radio" name="tlp7" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">8</td>
<td>Innovative methods for Teaching</td>
<td align="center"><input type="radio" name="tlp8" value="1"/> </td>
<td align="center"><input type="radio" name="tlp8" value="2"/> </td>
<td align="center"><input type="radio" name="tlp8" value="3"/> </td>
<td align="center"><input type="radio" name="tlp8" value="4"/> </td>	
<td align="center"><input type="radio" name="tlp8" value="5" required="required"/> </td>
</tr>
<tr>
<th colspan="7" style="color: blue;">Evaluation of Course Outcomes</th>
</tr>
<tr>
<th>O.No</th>
<th>Outcomes</th>
<th>Strongly Disagree</th>
<th>Disagree</th>
<th>Neutral</th>
<th>Agree</th>
<th>Strongly Agree</th>
</tr>
<tr>
<td align="center">1</td>
<td><%=rs1.getString("p1") %></td>
<td align="center"><input type="radio" name="p1" value="1" /> </td>
<td align="center"><input type="radio" name="p1" value="2" /> </td>
<td align="center"><input type="radio" name="p1" value="3" /> </td>
<td align="center"><input type="radio" name="p1" value="4" /> </td>
<td align="center"><input type="radio" name="p1" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">2</td>
<td><%=rs1.getString("p2") %></td>
<td align="center"><input type="radio" name="p2" value="1"/> </td>
<td align="center"><input type="radio" name="p2" value="2"/> </td>
<td align="center"><input type="radio" name="p2" value="3"/> </td>
<td align="center"><input type="radio" name="p2" value="4"/> </td>
<td align="center"><input type="radio" name="p2" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">3</td>
<td><%=rs1.getString("p3") %></td>
<td align="center"><input type="radio" name="p3" value="1"/> </td>
<td align="center"><input type="radio" name="p3" value="2"/> </td>
<td align="center"><input type="radio" name="p3" value="3"/> </td>
<td align="center"><input type="radio" name="p3" value="4"/> </td>
<td align="center"><input type="radio" name="p3" value="5" required="required"/> </td>
</tr>

<tr>
<td align="center">4</td>
<td><%=rs1.getString("p4") %></td>
<td align="center"><input type="radio" name="p4" value="1"/> </td>
<td align="center"><input type="radio" name="p4" value="2"/> </td>
<td align="center"><input type="radio" name="p4" value="3"/> </td>
<td align="center"><input type="radio" name="p4" value="4"/> </td>
<td align="center"><input type="radio" name="p4" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">5</td>
<td><%=rs1.getString("p5") %></td>
<td align="center"><input type="radio" name="p5" value="1"/> </td>
<td align="center"><input type="radio" name="p5" value="2"/> </td>
<td align="center"><input type="radio" name="p5" value="3"/> </td>
<td align="center"><input type="radio" name="p5" value="4"/> </td>
<td align="center"><input type="radio" name="p5" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">6</td>
<td><%=rs1.getString("p6") %></td>
<td align="center"><input type="radio" name="p6" value="1"/> </td>
<td align="center"><input type="radio" name="p6" value="2"/> </td>
<td align="center"><input type="radio" name="p6" value="3"/> </td>
<td align="center"><input type="radio" name="p6" value="4"/> </td>
<td align="center"><input type="radio" name="p6" value="5" required="required"/> </td>
</tr>

<tr>
<td align="center">7</td>
<td><%=rs1.getString("p7") %></td>
<td align="center"><input type="radio" name="p7" value="1"/> </td>
<td align="center"><input type="radio" name="p7" value="2"/> </td>
<td align="center"><input type="radio" name="p7" value="3"/> </td>
<td align="center"><input type="radio" name="p7" value="4"/> </td>
<td align="center"><input type="radio" name="p7" value="5" required="required"/> </td>
</tr>
<tr>
<td align="center">8</td>
<td><%=rs1.getString("p8") %></td>
<td align="center"><input type="radio" name="p8" value="1"/> </td>
<td align="center"><input type="radio" name="p8" value="2"/> </td>
<td align="center"><input type="radio" name="p8" value="3"/> </td>
<td align="center"><input type="radio" name="p8" value="4"/> </td>	
<td align="center"><input type="radio" name="p8" value="5" required="required"/> </td>
</tr>
<tr>
	<td colspan="7" align="center"><textarea rows="" cols="100" name="comments" >Please give your Comments or Suggestions</textarea></td>
</tr>
<tr>
<td colspan="2" align="center"><a href="courseEndFeedback.jsp">Back</a></td>
<th colspan="5" align="center"><input type="submit"  style=" background-color: red;" value="Submit"/></th>

</tr>
</table>
</form>
<%
    }else{
	//out.println("<h4 align='center' style='color:red;'>Outcomes are not yet assigned for \t"+course+ "</h4>");
	 out.println("<script>alert('Outcomes are not yet assigned for \t"+course+ "');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/courseEndFeedback.jsp'</script>");
	  
}
 }
    
    
 %>
