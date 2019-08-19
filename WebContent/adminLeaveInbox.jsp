<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<h3 align="center" class="bars">Admin Leave Inbox</h3>
<table   align="center" border="1">

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
		
		//String uid=request.getParameter("uid");
		//session.setAttribute("uid", uid);
	
		Statement s=connection.createStatement();
	   rs=s.executeQuery("select * from leaves   order by id desc");
	%>
	<tr>
		<th>Leave ID</th>
		<th>Applicant Faculty</th>
		<th>Department</th>
		<th>Leave Type</th>
		<th>Num of Days</th>
		<th>Date</th>
		<th>Purpose</th>
		<th>Principal Status</th>
		<th></th>
	</tr>   
	   
	<% 
	  while(rs.next()){
	%> 
	
			<TR>
				<TD ><%=rs.getString("id")%> </TD>
				<TD ><%=rs.getString("applicant_id")%> </TD>
				<TD ><%=rs.getString("applicant_dept")%> </TD>
				<TD ><%=rs.getString("leave_type")%> </TD>
				<td > <%=rs.getString("numdays")%></td>
				<TD ><%=rs.getString("fromDate")%> To <%=rs.getString("toDate")%>  </TD>
				<TD > <%=rs.getString("purpose")%></TD>
				<td><%=rs.getString("principalstatus")%></td>
				<td><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/deleteLeave.jsp?uid=<%=uid%>&lId=<%=rs.getString("id")%>">delete</a></td>
				
				
			</tr>
		<%}%>
		</TABLE>
		</div>
		
	</div>
		
</div>

<%@include file="footer.html" %>	