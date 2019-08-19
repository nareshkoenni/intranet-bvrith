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
		<br>
<h3 align="center" class="bars">Grievance Inbox</h3>
<table width="80%" align="center" border="1">

	<%! private DataSource dataSource,dataSource1;%>
	
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
		Connection connection=null,connection1=null;
		ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs4=null;
		
		
		connection = dataSource.getConnection();
	/*	String dept=null;
		try {
			 Statement s = connection.createStatement();
			rs2=s.executeQuery("select Dept from logindetails where  username='"+uid+"' ");
			if(rs2.next()){
				dept=rs2.getString("Dept");
				//System.out.println("dddddddddd"+dept);  
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		*/
		Statement s=connection.createStatement();
	   rs=s.executeQuery("select * from grievance");
	  // rs=s.executeQuery("select * from leaves l  order by l.id desc");
	   
	%>
	<tr>
		
		<th align="center">S.No</th>
		<th>Category</th>
		<th>Message</th>
		<th>Date</th>
		<th>Status</th>
		<th>&nbsp;</th>
	</tr>   
	   
	<% 
	  int sno=0;
	  while(rs.next()){
		  sno++;
	%> 
			<TR>
				<TD align="center" ><%=sno%></TD>
				<TD ><%=rs.getString("category")%> </TD>
				<td > <%=rs.getString("message")%></td>
				<TD ><%=rs.getString("date")%> </TD>
				<TD > <%=rs.getString("status")%></TD>
				<td align="center"><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewGrievance.jsp?id=<%=rs.getString("id")%>">Update</a></td>
			</tr>
		<%
	  } 
	  %>
	
		</div>
		
	</div>
		
</div>
<%connection.close(); %>	