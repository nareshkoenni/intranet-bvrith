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
    String fbnum=request.getParameter("fbnum");
    System.out.println("in tlf1 fbnum"+fbnum);
    java.util.Date d=new java.util.Date();
    int month=d.getMonth();
    
    //  Statement s=connection.createStatement();
  	Statement s=connection.createStatement();
    rs=s.executeQuery("select rollNumber,nt,month from tlfeedback where sem='"+sem+"' and branch='"+branch+"' and rollNumber='"+rollNumber+"' and course='"+course+"' ");
    if(rs.next()){
    	if(rs.getInt("nt")==1 && rs.getInt("month")==month){
    	//RequestDispatcher rd=request.getRequestDispatcher("courseEndFeedback.jsp");
		//rd.include(request, response);
		//out.println("<h4 align='center' style='color:red;'>\t"+course+ "</h4>");
		 	out.println("<script>alert('You already have given feedback to \t"+course+ " in this month');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/tlfeedback.jsp'</script>");
    	}
    }else{
	    session.setAttribute("branch",branch);
	    session.setAttribute("sem",sem);
	    session.setAttribute("section",section);
	    session.setAttribute("course",course);
	    session.setAttribute("rollNumber",rollNumber);
	    session.setAttribute("date",request.getParameter("date"));
	    session.setAttribute("faculty",faculty);
	    session.setAttribute("acyear",acyear); 
	    session.setAttribute("fbnum",fbnum); 
	    
    }
%>
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/tlfs" name="postattendance" method="post">
	<h3 align="center" class="bars">Teaching-Learning Feedback</h3>
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
<th>Batch</th>
<td><%=acyear%></td>
</tr>
<tr>
<th>Feedback Number</th>
<td><%=fbnum%></td>
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
	<td colspan="7" align="center"><textarea rows="" cols="100" name="comments">Please give your Comments or Suggestions</textarea></td>
</tr>
<tr>
<td colspan="2" align="center"><a href="tlfeedback.jsp">Back</a></td>
<th colspan="5" align="center"><input type="submit"  style=" background-color: red;" value="Submit"/></th>

</tr>
</table>
</form>

