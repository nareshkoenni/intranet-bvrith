<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
 


 
 <script>
 $(document).ready(function() {
	    $("#datepicker").datepicker();
	  });


</script>
 
 

<body>
<%@include file="header.jsp"%> 
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="#" name="postattendance" method="post">
	<h3 align="center" class="bars">Course Plan</h3><br>
	
	<table align="center" width="80%">	
		<tr>
			<td width="15%">Course Code</td>
			<td width="15%"><!--  <input type="text" name="courseCode" value="<%=request.getParameter("courseCode")%> " class="form-control" size="9"/> --></td>
			<td width="8%">Instructor</td>
			<td width="10%" colspan="3">
			<input type="text" name="instructor" value="<%=request.getParameter("instructor")%>" class="form-control" size="20"/>
			</td>
			<td width="10%">Academic Year</td>
			<td width="5%">
				<input type="text" name="acyear" value="<%=request.getParameter("acyear")%>" class="form-control" size="9">
			</td>
					
		</tr>
	
		<tr>
			<td colspan="8" height="5%">&nbsp;</td>
		</tr>
		
		<tr>
			<td>Semester</td>
			<td>
					<input type="text" name="sem" value="<%=request.getParameter("sem")%> " class="form-control" size="9">
			
			</td>		
			
			<td>Branch</td>
			<td>
					<input type="text" name="branch" value="<%=request.getParameter("branch")%> " class="form-control" size="9">
			</td>
				
			<td>Section</td>
			<td>
					<input type="text" name="section" value="<%=request.getParameter("section")%> " class="form-control" size="9">
			</td>		
					
			<td>Course Name</td>
			<td>
					<input type="text" name="course" value="<%=request.getParameter("course")%> " class="form-control" size="9">
			</td>
		</tr>
	</table>
	
	<br/><br/>
	
	
	
	
	<table width=100%>
	<tr>
			<th width="2%"></th>
			<th width="7%">S.No</th>
			<th  width="10%">Unit</th>
			<th  width="12%">Date</th>
			<th width="24%">Topic to be covered</th>
			<th width="24%">Text/Reference Book</th>
			<th width="18%">Ch.No-PageNo</th>
			<th width="18%">Web Resource</th>
			<th width="5%">CO</th>
			<th width="15%" colspan="2"></th>
		
		</tr>
	
	<tr><td colspan="11">
		<table id="dataTable" width="100%"  align="center">
	<%! private DataSource dataSource;%>
	
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
		ResultSet rs=null;
		
		
		connection = dataSource.getConnection();
		String branch=request.getParameter("branch");
		String section=request.getParameter("section");
		String sem=request.getParameter("sem");
		String instructor=request.getParameter("instructor");
		String acyear=request.getParameter("acyear");
		//String courseCode=request.getParameter("courseCode");
		String course=request.getParameter("course");
		
	
		Statement s=connection.createStatement();
	   rs=s.executeQuery("select *from coursePlan where instructor='"+instructor+"' and coursename='"+course+"'  and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' order by unit ");
	   while(rs.next()){
	  
	%> 
	
			<TR>
				<TD width="2%"></TD>
				<TD width="5%"><input type="text" value="<%=rs.getString("sessionNumber")%>" name="txtbox1[]" size="3"/> </TD>
				<td width="8%"> <INPUT type="text" value="<%=rs.getString("unit")%>" name="txtbox2[]" size="3"/></td>
				<TD width="15%"> <INPUT type="text" value="<%=rs.getString("date")%>" name="txtbox3[]" id="datepicker"  placeholder="mm/dd/yyyy" size="15"/> </TD>
				<TD width="18%"> <INPUT type="text" value="<%=rs.getString("topic")%>" name="txtbox4[]" size="25"/> </TD>
				<TD width="18%"> <INPUT type="text" value="<%=rs.getString("textbook")%>" name="txtbox5[]" size="28"/> </TD>
				<TD width="16%"> <INPUT type="text" value="<%=rs.getString("chapterno")%>" name="txtbox6[]" size="15"/> </TD>
				<TD width="13%"> <INPUT type="text" value="<%=rs.getString("webresource")%>" name="txtbox7[]" size="20"/> </TD>
				<td width="5%"> <INPUT type="text" value="<%=rs.getString("co")%>" name="txtbox8[]" size="3"/></td>
				<td style="border: none;" width="20%"></td>
				<td>	</td>
				
			</tr>
		<%} %>
		</TABLE>
	
	
	
</table>


</form>

		</div>
		
	</div>
		
</div>
<%connection.close(); %>
<h5 align="center" style="color: red; font-weight:bold;"><marquee >It is best viewed in Mozilla Firefox</marquee></h5>
<%@include file="footer.html" %>
</body>