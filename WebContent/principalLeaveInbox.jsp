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
<h3 align="center" class="bars">Leave Inbox</h3>
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
	   rs=s.executeQuery("select * from leaves  where hodstatus='accepted' order by id desc");
	%>
	<tr>
		<th>Applicant Faculty</th>
		<th>Department</th>
		<th>Leave Type</th>
		<th>Num of Days</th>
		<th>Date</th>
		<th>Purpose</th>
		<th>HOD Status</th>
		<th>Principal Status</th>
			<th>Reason</th>
	
	</tr>   
	   
	<% 
	  while(rs.next()){
	%> 
	
			<TR>
				<TD ><%=rs.getString("applicant_id")%> </TD>
				<TD ><%=rs.getString("applicant_dept")%> </TD>
				<TD ><%=rs.getString("leave_type")%> </TD>
				<td > <%=rs.getString("numdays")%></td>
				<TD ><%=rs.getString("fromDate")%> To <%=rs.getString("toDate")%>  </TD>
				<TD > <%=rs.getString("purpose")%></TD>
				<TD > <%=rs.getString("hodstatus")%></TD>
				
				<%
				String reas=null;
				
				if(rs.getString("principalstatus").equals("accepted") || rs.getString("principalstatus").equals("rejected")){ %>
				<td><%=rs.getString("principalstatus")%></td>
				<%}else{ %>
				<td ><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/uplibs?uid=<%=uid%>&status=accepted&leaveId=<%=rs.getString("id")%>&reason= ">Accept</a>|<a id="printReas" onclick="reason(<%=rs.getString("id")%>)" href="http://intranet.bvrithyderabad.edu.in:9000/intranet/uplibs?uid=<%=uid%>&status=rejected&leaveId=<%=rs.getString("id")%>">Reject</a></td>
				<%}%>
				<td><%=rs.getString("rejectreason")%></td>
			</tr>
		<%
	  } 
	  %>
	  	
		</TABLE>
		<script type="text/javascript">
	function reason(lid) {
		reason=window.prompt("reason", "");
		document.getElementById("printReas").href="http://intranet.bvrithyderabad.edu.in:9000/intranet/uplibs?uid=<%=uid%>&leaveId="+lid+"&status=rejected&reason="+reason;
	}
	
</script>
		</div>
		
	</div>
		
</div>
<%connection.close(); %>

<%@include file="footer.html" %>	