<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">]
		<div class="single-grid">
<h3 align="center" class="bars">Faculty Leaves</h3>
<table  align="center" border="1">

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
		ResultSet rs=null,rs1=null;
		
		
		connection = dataSource.getConnection();
		
		//String uid=request.getParameter("uid");
		//session.setAttribute("uid", uid);
	
		Statement s=connection.createStatement();
	%>
	<tr>
		<th>Name</th>
		<th>CL</th>
		<th>SL</th>
		<th>EL</th>
		<th>AL</th>
		<th>OD</th>
		<th>CCL</th>
		<th>OHP</th>
		<th>Vacation</th>
		<th></th>
	</tr>   
	   
	<% 
	   rs=s.executeQuery("select * from leaveInfo");
	
	  while(rs.next()){
	%> 
	
			<TR>
				<TD ><%=rs.getString("faculty")%> </TD>
				<TD ><%=rs.getString("cl")%> </TD>
				<TD ><%=rs.getString("sl")%> </TD>
				<td > <%=rs.getString("el")%></td>
				<TD ><%=rs.getString("al")%>  </TD>
				<TD > <%=rs.getString("od")%></TD>
				<td><%=rs.getString("ccl")%></td>
				<td><%=rs.getString("ohp")%></td>
				<td><%=rs.getString("vacation")%></td>
				
				<td><a href="updateLeave.jsp">update</a></td>
				
				
				
			</tr>
		<%}%>
		</TABLE>
		</div>
		
	</div>
		
</div>

<%@include file="footer.html" %>	