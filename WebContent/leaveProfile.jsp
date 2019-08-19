<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">

		function getFaculty(){
		xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    var x=document.getElementById("fac");
		 //  alert(x.length);
		  //  var option=document.createElement("option");
		    var te=this.responseText;
		    var a=te.split(",");
		    for(var i=0;i<a.length-1;i++){
		   // alert(a);
		    var option=document.createElement("option");
			option.text=a[i].toString();
		    for(i=0;i<x.length;i++){
				x.add(option);
		    }
		    }
		    }
		  };
		  xhttp.open("GET", "getFacultyWeb.jsp", true);
		  xhttp.send();
		  
	} 
	
 
 </script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
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
		ResultSet rs1=null,rs2=null,rs3=null,rs4=null,rs5=null,rs6=null,rs7=null;
		
		
		connection = dataSource.getConnection();
		
		//String uid=request.getParameter("uid");
		//session.setAttribute("uid", uid);
	
		Statement s=connection.createStatement();
	  
	%>
	
		<br><br>
		<h3 align="center" class="bars">Leave Summary</h3>
<table  width="100%"  align="center" border="2">
		
		<%
		//response.setContentType("text/html");
		ResultSet rs=null;
		
		
		connection = dataSource.getConnection();
		
		//String uid=request.getParameter("uid");
		//session.setAttribute("uid", uid);
	
		Statement s2=connection.createStatement();
	%>
	<tr>
		<td rowspan="2" align="center">Name</td>
		<td colspan="3" align="center">CL</td>
		<td colspan="3" align="center">SL</td>
		<td colspan="3" align="center">EL</td>
		<td colspan="3" align="center">AL</td>
		<td colspan="3" align="center">CCL</td>
		<td rowspan="2" align="center">Vacation</td>
		<td rowspan="2" align="center">LOP</td>
		
		<td rowspan="2" align="center">&nbsp;</td>
		</tr>   
	<tr>
		<td align="center">Credit</td>
		<td align="center">Debit</td>
		<td align="center">Bal</td>
		
		<td align="center">Credit</td>
		<td align="center">Debit</td>
		<td align="center">Bal</td>
		
		
		<td align="center">Credit</td>
		<td align="center">Debit</td>
		<td align="center">Bal</td>
		
		
		<td align="center">Credit</td>
		<td align="center">Debit</td>
		<td align="center">Bal</td>
		
		<td align="center">Credit</td>
		<td align="center">Debit</td>
		<td align="center">Bal</td>
	</tr>   
	   
	<% 
		try{
	   rs=s2.executeQuery("select * from leaveInfo where faculty='"+uid+"' ");
	//   rs1=s.executeQuery("select * from leaves");
		
	  while(rs.next()){
	%> 
	
			<TR>
				<TD><%=rs.getString("faculty")%> </TD>
				<TD align="center"><%=rs.getString("clcredit")%> </TD>
				<TD align="center"><%=rs.getString("cldebit")%> </TD>
				<%
					if(Double.parseDouble(rs.getString("clbalance"))<0 ){
				%>
				<TD align="center">0 </TD>
				<%}else {%>
				<TD align="center"><%=rs.getString("clbalance")%> </TD>
				<%} %>
				<TD align="center"><%=rs.getString("slcredit")%> </TD>
				<TD align="center"><%=rs.getString("sldebit")%> </TD>
				<TD align="center"><%=rs.getString("slbalance")%> </TD>
				
				<td align="center"> <%=rs.getString("elcredit")%></td>
				<td align="center"> <%=rs.getString("eldebit")%></td>
				<%
					if(Double.parseDouble(rs.getString("elbalance"))<0 ){
				%>
				<TD align="center">0 </TD>
				<%}else {%>
				<TD align="center"><%=rs.getString("elbalance")%> </TD>
				<%} %>
				<TD align="center"><%=rs.getString("alcredit")%>  </TD>
				<TD align="center"><%=rs.getString("aldebit")%>  </TD>
				<TD align="center"><%=rs.getString("albalance")%>  </TD>
				
				<td align="center"><%=rs.getString("cclcredit")%></td>
				<td align="center"><%=rs.getString("ccldebit")%></td>
				<td align="center"><%=rs.getString("cclbalance")%></td>
				
				<td align="center"><%=rs.getString("vacation")%></td>
			<%
				double lop=0;
				if(Double.parseDouble(rs.getString("elbalance"))<0 ){
					lop=Double.parseDouble(rs.getString("eldebit"))-Double.parseDouble(rs.getString("elcredit"));
			%>
				<td align="center" style="color: red;"><%=lop%></td>
			<% 	
				}else{
			%>
				<td align="center"><%=lop%></td>
		
			<%} %>
				<td align="center"></td>
				
			</tr>
		<%}
		}catch(Exception e){
		%>
			<table>
			<tr>
			<td rowspan="2" align="center">Name</td>
			<td colspan="3" align="center">CL</td>
			<td colspan="3" align="center">SL</td>
			<td colspan="3" align="center">EL</td>
			<td colspan="3" align="center">AL</td>
			<td colspan="3" align="center">CCL</td>
			<td rowspan="2" align="center">Vacation</td>
			<td rowspan="2" align="center">LOP</td>
			
			<td rowspan="2" align="center">&nbsp;</td>
			</tr>   
		
		</table>  
		<%  
		}	
		%>
		</TABLE>
		</div>
		
	</div>
		
</div>
<%connection.close(); %>
<h4 align="center">&copy;2019 BVRITH. All Rights Reserved</h4>
</body>
