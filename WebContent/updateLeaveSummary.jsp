<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>


</head>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form method="POST" action="uls">
<h3 align="center" class="bars">Update Leave Summary</h3><br>
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
		Statement s=connection.createStatement();
		String lsId=request.getParameter("lsId").trim();
		rs=s.executeQuery("select * from leaveInfo where lsid='"+lsId+"' ");
		rs.next();
	%>
  <table align="center">
   <tr>
      	<th>Name</th> 
   		<td>
   		<select  name="faculty" class="btn btn-default dropdown-toggle" required="required">
			<option value='<%=rs.getString("faculty")%>'><%=rs.getString("faculty")%></option>
	    </select>
	    </td>
   </tr>
     <tr>
      <th>Earned Leave (EL)</th>
       	<td><input type="text" name="elCredit" placeholder="credit" value="<%=rs.getString("elcredit")%>" class="form-control"/></td>
    	<td><input type="text" name="elDebit" placeholder="debit" value="<%=rs.getString("eldebit")%>" class="form-control"/></td>
    	<td><input type="text" name="elBal" placeholder="bal" value="<%=rs.getString("elbalance")%>" class="form-control"/></td>
   
    </tr>
  
    <tr>
      	<th>Casual Leave(CL)</th>
    	<td><input type="text" name="clCredit" value="<%=rs.getString("clcredit")%>" class="form-control"/></td>
    	<td><input type="text" name="clDebit" value="<%=rs.getString("cldebit")%>" class="form-control"/></td>
    	<td><input type="text" name="clBal" value="<%=rs.getString("clbalance")%>" class="form-control"/></td>
    </tr>
    <tr>  
    	<th>Sick Leave(SL)</th>
    	<td><input type="text" name="slCredit" value="<%=rs.getString("slcredit")%>" class="form-control"/></td>
    	<td><input type="text" name="slDebit" value="<%=rs.getString("sldebit")%>" class="form-control"/></td>
    	<td><input type="text" name="slBal" value="<%=rs.getString("slbalance")%>" class="form-control"/></td>
   
    </tr>
    <tr>
      <th>Academic Leave (AL)</th>
   	  <td><input type="text" name="alCredit" value="<%=rs.getString("alcredit")%>" class="form-control"/></td>
      <td><input type="text" name="alDebit" value="<%=rs.getString("aldebit")%>" class="form-control"/></td>
      <td><input type="text" name="alBal" value="<%=rs.getString("albalance")%>" class="form-control"/></td>
     </tr>
    <tr>
	 	<th>CCL</th>
	    <td><input type="text" name="cclCredit" value="<%=rs.getString("cclcredit")%>" class="form-control"/></td>
        <td><input type="text" name="cclDebit" value="<%=rs.getString("ccldebit")%>" class="form-control"/></td>
        <td><input type="text" name="cclBal"  value="<%=rs.getString("cclbalance")%>" class="form-control"/></td>
   </tr>
   
    <tr>
	  <th>Vacation<th>
	  <td align="left"><input type="text" value="<%=rs.getString("vacation")%>" name="vacation" class="form-control"/></td>
      <td>&nbsp;</td><td>&nbsp;</td>	
    </tr>
	<tr>
    	<td><input type="hidden" name="lsId" value="<%=lsId%>"/> </td>
		<td><input type="submit" value="Submit" class="form-control" /></td>
	</tr>
    
 </table>
  
  
</form>

		</div>
		
	</div>
		
</div>

<%@include file="footer.html" %>
</body>
