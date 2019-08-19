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
    $("#datepicker").datepicker().datepicker("setDate", new Date());
  });
  </script>
  <script type="text/javascript">
  	function courseValid(){
  		var course=grievance.category.value;
  		//var course=postattendance.course.value;
  		
  		if(course=="category"){
  			alert("Please Choose Category");
  			//postattendance.course.focus();
  			//return true;  
  		}
  		
  	}
  </script>
 
</head>
<!-- <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1><h4 align="right"><a href="index.html">Logout</a></h4> -->

<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
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
		String dept=null;
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
		
		String id=request.getParameter("id");
		Statement s=connection.createStatement();
	   rs=s.executeQuery("select * from grievance where id='"+id+"'");
	  // rs=s.executeQuery("select * from leaves l  order by l.id desc");
	   if(rs.next())
	%>
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/ugis?uid=<%=uid%>" name="grievance" method="post" >
	<h3 align="center" class="bars">Update Grievance</h3><br>
	<br>
	<table align="center">	
		<tr>
			<td><input type="text" name="date" value="<%=rs.getString("date")%>"  class="form-control" required="required"/></td>		
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><input type="text" value="<%=rs.getString("mailID")%>"  name="mailID" class="form-control" required="required"/></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><select name="dept" class="btn btn-default dropdown-toggle" required="required">
				<option value='<%=dept%>'><%=dept%> </option>
				
			</select></td>		
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><input type="hidden"  name="uid" value="<%=uid%>" class="form-control"/></td>	
		</tr>
		<tr>
			<td><input type="hidden"  name="gid" value="<%=id%>" class="form-control"/></td>	
		</tr>
		
		<tr>
			<td><select name="category" class="btn btn-default dropdown-toggle" required="required">
				<option value="<%=rs.getString("category")%>"><%=rs.getString("category")%></option>
				
			</select></td>		
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><textarea  name="message"  rows="3" cols="40" class="form-control" required="required"><%=rs.getString("message")%></textarea></td>	
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><select name="status" class="btn btn-default dropdown-toggle" required="required">
				<option value="raised">Raised</option>
				<option value="inprogress">In Progress</option>
				<option value="pending">Pending</option>
				<option value="fixed">Fixed</option>
			</select></td>		
		</tr>
		<tr>
			<td><textarea  name="comments" placeholder="comments" rows="3" cols="40" class="form-control" required="required"></textarea></td>	
		</tr>
		
		<tr><td>&nbsp;</td></tr>
		
		<tr>
    		<td align="center"><input type="submit" value="Submit" class="form-control" /></td>
		</tr>
	</table>



</form>
	
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>