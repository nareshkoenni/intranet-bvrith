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

	<%! private DataSource dataSource,dataSource1;%>
	
	<%!
	public void jspInit(){
	   try {
	       // Get DataSource
	       
	       Context initContext  = new InitialContext();
	       Context envContext  = (Context)initContext.lookup("java:/comp/env");
	       dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
	       dataSource1 = (DataSource)envContext.lookup("jdbc/testmysql");
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
		connection1 = dataSource1.getConnection();
		String dept=null;
		try {
			 Statement s = connection1.createStatement();
			rs2=s.executeQuery("select Dept from logindetails where  username='"+uid+"' ");
			if(rs2.next()){
				dept=rs2.getString("Dept");
				//System.out.println("dddddddddd"+dept);  
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Statement s=connection.createStatement();
		rs4=s.executeQuery("select id from leaves");
		ArrayList lvidList=new ArrayList();
		while(rs4.next()){
			lvidList.add(rs4.getString("id"));
		}
		boolean adjStatus=false;
		for(int i=0;i<lvidList.size();i++){
		rs3=s.executeQuery("select leaveId from adjust where leaveId='"+lvidList.get(i)+"' ");
		 adjStatus=rs3.next();
		}
	   rs=s.executeQuery("select * from leaves   where applicant_dept='"+dept+"' order by id desc");
	  // rs=s.executeQuery("select * from leaves l  order by l.id desc");
	   
	%>
	<tr>
		
		<th>Applicant Faculty</th>
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
				<TD ><%=rs.getString("leave_type")%> </TD>
				<td > <%=rs.getString("numdays")%></td>
				<TD ><%=rs.getString("fromDate")%> To <%=rs.getString("toDate")%>  </TD>
				<TD > <%=rs.getString("purpose")%></TD>
				<%
				String reas=null;
				System.out.println("no adj"+adjStatus);
				
				if(rs.getString("hodstatus").equals("accepted") || rs.getString("hodstatus").equals("rejected")){ %>
				<td><%=rs.getString("hodstatus")%></td>
				<%}else if(rs.getInt("adjustcode")==0 || rs.getString("leave_type").equals("OneHrPerm") || rs.getString("fadjuststatus").equals("accepted")){ 
				%>
				
				<td><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/ulibs?uid=<%=uid%>&status=accepted&leaveId=<%=rs.getString("id")%>&reason=  ">Accept</a>|<a id="printReas" onclick="reason(<%=rs.getString("id")%>)" href='"http://intranet.bvrithyderabad.edu.in:9000/intranet/ulibs?uid=<%=uid%>&status=rejected&leaveId=<%=rs.getString("id")%>&reason="'>Reject</a></td>
				
				<%}else{%>
					<td><%=rs.getString("hodstatus")%></td>    
				<%} %>
				<TD > <%=rs.getString("principalstatus")%></TD>
				<td><%=rs.getString("rejectreason")%></td>
			</tr>
		<%
	  } 
	  %>
	  <tr>
	  		<td colspan="6" align="center" style="color: teal;">Adjustments</td>
	  	</tr>
	  
	  	<tr>
	  		
	  		<th >Applicant Faculty</th>
			<th >Semester</th>
			<th >Section</th>
			<th >Date</th>
			<th >Period - Session</th>
			<th>Adjusted to</th>
			<th >Status</th>
		</tr>   
	   
	  	
	  <%
		rs1=s.executeQuery("select * from  adjust  where applicant_dept='"+dept+"' or department='"+dept+"' order by id desc");
		while(rs1.next()){
		%>
			<tr>
				
				<td ><%=rs1.getString("applicant_id")%></td> 
				<TD > <%=rs1.getString("sem")%></TD>
				<td ><%=rs1.getString("section")%></td>
				<TD > <%=rs1.getString("adj_date")%></TD>
				<TD><%=rs1.getString("period")%> - <%=rs1.getString("session")%> </TD>
				<TD > <%=rs1.getString("adj_with_id")%> (<%=rs1.getString("department")%>)</TD>
				<td><%=rs1.getString("fadjuststatus")%></td>
			
			</tr>
		<%   
		} %>
		</TABLE>
		<script type="text/javascript">
	function reason(lid) {
		reason=window.prompt("reason", "");
		document.getElementById("printReas").href="http://intranet.bvrithyderabad.edu.in:9000/intranet/ulibs?uid=<%=uid%>&leaveId="+lid+"&status=rejected&reason="+reason;
	}
	
</script>
		
		</div>
		
	</div>
		
</div>
<%connection.close(); %>
<%@include file="footer.html" %>	