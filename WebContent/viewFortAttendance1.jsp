<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>


<body style="background: silver;">
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#date").datepicker();
  });
  $(document).ready(function() {
	    $("#date1").datepicker();
  });
  
  $(document).ready(function(){
	    $("select.sem").change(function(){
	        var selectedSem = $(".sem option:selected").val();
	        
	    });
	});
  </script>
  
  <style type="text/css">
	#serviceBox
{
    width:100%;
    margin: 0 auto;
    margin-top:75px;
    height:250px;
    border:;
    
}
.serviceBox1, .serviceBox2, .serviceBox3{
    float:left;
    width:10%;
    height: 250px; 
    background-color: ;
}
</style>
</head>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewFortAttendance1.jsp?uid=<%=uid%>" method="POST" name="attendance1">
 <h3 align="center" class="bars">Class Fort Attendance</h3>
<table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
 <tr>
 <td><input type="text" id="date" name="from" placeholder="from"  required="required" class="form-control"/></td>		
  <td><input type="text" id="date1" name="to" placeholder="to" required="required" class="form-control"/></td>		
   <td><select name='branch' class="btn btn-default dropdown-toggle"><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
  <td>&nbsp;</td>
  <td>
  	<select name="sem" class="btn btn-default dropdown-toggle">
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
  		<td><select name="section" class="btn btn-default dropdown-toggle">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>	
 
  <td align="center"><input type="submit" value="Go" /></td>
  
  
  </tr>
</table>	 
 
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
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
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
	String branch=request.getParameter("branch").toUpperCase();
	String section=request.getParameter("section");
	String sem=request.getParameter("sem");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	Statement statement=connection.createStatement();
	rs=statement.executeQuery("select distinct subject, rollNumber from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and attendance=1");
%>
<div id="serviceBox" align="center"> 

	<table align="center" border="2" style="border-style: dashed; background:gray;">
		<tr>
			<th><%= branch%> - <%= sem%> - <%= section%> - <%=from %> - <%=to %></th>
		</tr>
	</table>	
	<!-- <table align="center" border="2" style="border-style: dashed; background:gray;"> -->
		
<%
	ArrayList rollList=new ArrayList();
	ArrayList subjectList=new ArrayList();

	while(rs.next()){
		subjectList.add(rs.getString("subject"));
		rollList.add(rs.getString("rollNumber") );
	}
	//AttendanceProcess ap=new AttendanceProcess();
	//ap.getAttendance(subjectList, rollList);
%>
<div class="serviceBox1">
<% 
	for(int r=0;r<rollList.size();r++){	
		for(int s=0;s<subjectList.size();s++){
		rs1=statement.executeQuery("select subject, sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and attendance=1 and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(s)+"' group by subject");
		
		while(rs1.next()){
			
			out.println(rs1.getString("subject") +"-"+rs1.getString("sum(attendance)"));
	
		}
		}
		%></div><%
	}
%>


</div>

		</div>
		
	</div>
		
</div>
<%connection.close(); %>
<%@include file="footer.html" %>