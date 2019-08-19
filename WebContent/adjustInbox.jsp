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
<h3 align="center" class="bars">Session Adjustments</h3>
<table  width="100%"  align="center" border="1">

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
/*	   rs=s.executeQuery("select * from leaves l where l.applicant_id ='"+uid+"' order by l.toDate desc");
	%>
	<tr>
		<th>Leave Type</th>
		<th>Num of Days</th>
		<th>Date</th>
		<th>Purpose</th>
		<th>HOD Status</th>
		<th>Principal Status</th>
	</tr>   
	   
	<% 
	  while(rs.next()){
	%> 
	
			<TR>
				
				<TD ><%=rs.getString("l.leave_type")%> </TD>
				<td > <%=rs.getString("l.numdays")%></td>
				<TD ><%=rs.getString("l.fromDate")%> To <%=rs.getString("l.toDate")%>  </TD>
				<TD > <%=rs.getString("l.purpose")%></TD>
				<TD > <%=rs.getString("l.hodstatus")%></TD>
				<TD > <%=rs.getString("l.principalstatus")%></TD>
				
				
			</tr>
		<%
	  } */
	  %>
	  <thead>
	  	<tr>
	  	
	  		<th >Applicant Faculty</th>
			<th >Semester</th>
			<th >Section</th>
			<th >Date</th>
			<th >Period - Session</th>
			<th >Action/Status</th>
		</tr>   
	   
	  	</thead>
	  <%
		rs1=s.executeQuery("select * from  adjust  where adj_with_id ='"+uid+"' order by adj_date desc");
		while(rs1.next()){
		%>
			<tr>
				<td ><%=rs1.getString("applicant_id")%>	</td>
				<TD > <%=rs1.getString("sem")%></TD>
				<td ><%=rs1.getString("section")%></td>
				<TD > <%=rs1.getString("adj_date")%></TD>
				<TD><%=rs1.getString("period")%> - <%=rs1.getString("session")%> </TD>
				<%if(rs1.getString("fadjuststatus").equals("accepted") || rs1.getString("fadjuststatus").equals("rejected")){ %>
				<td><%=rs1.getString("fadjuststatus")%></td>
				<%}else{ %>
				<td ><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/uaibs?uid=<%=uid%>&status=accepted&adjId=<%=rs1.getString("id")%>&appId=<%=rs1.getString("applicant_id")%>&leaveId=<%=rs1.getString("leaveId")%>">Accept</a>|<a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/uaibs?uid=<%=uid%>&status=rejected&adjId=<%=rs1.getString("id")%>&appId=<%=rs1.getString("applicant_id")%>&leaveId=<%=rs1.getString("leaveId")%>">Reject</a></td>
				<%}%>
			</tr>
		<%   
		} %>
		</TABLE>
		</div>
		
	</div>
		
</div>

<%@include file="footer.html" %>	