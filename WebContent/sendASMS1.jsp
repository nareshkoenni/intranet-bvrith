<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  
  function toggle(source) {
	  checkboxes = document.getElementsByName('absenties');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}
  </script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<h3 class="bars" align="center">SMS to Specific </h3>  <h5 align="center" style="font: bold;">Note: Check the Roll Numbers to send SMS &nbsp;&nbsp;&nbsp;<input type="checkbox" onClick="toggle(this)" /> Check All </h5>
<form action="sendASMS2.jsp" name="postattendance" method="post">

<%! private DataSource dataSource;
 %>
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
	ResultSet rs=null;
	connection = dataSource.getConnection();
    System.out.println("got connection from postAttendanceDisplay \t"+connection.getClass());
    Statement s=connection.createStatement();
    
    String branch=request.getParameter("branch");
    String sem1=request.getParameter("sem");
    String section=request.getParameter("section");
    session.setAttribute("branch", branch);
    session.setAttribute("sem", sem1);
    session.setAttribute("section",section);
    
    String year=null;
	String sem=null;
	if(sem1.equals("1/4Sem-I"))
	{
		year="1";
		sem="1";
	}else if(sem1.equals("1/4Sem-II")){
		year="1";
		sem="2";
	}else if(sem1.equals("2/4Sem-I")){
		year="2";
		sem="1";
	}else if(sem1.equals("2/4Sem-II")){
		year="2";
		sem="2";
	}else if(sem1.equals("3/4Sem-I")){
		year="3";
		sem="1";
	}else if(sem1.equals("3/4Sem-II")){
		year="3";
		sem="2";
	}else if(sem1.equals("4/4Sem-I")){
		year="4";
		sem="1";
	}else if(sem1.equals("4/4Sem-II")){
		year="4";
		sem="2";
	}
	String role=null;
	if(section.equals("section1")){
		role="a";
	}else{
		role="b";
	}
	 rs=s.executeQuery("select Username from logindetails where categeory='Student' and Year='"+year+"' and sem='"+sem+"' and Role='"+role+"' and Dept='"+branch+"' ");
	  	
    System.out.println(branch);
    
%>

 <%
 List rollList=new ArrayList();
 int count=4;
 while(rs.next()){
	 rollList.add(rs.getString("Username")); 
 if(count==4){	
	// out.println("if count2");
 %>
 <div class="serviceBox2">
 	<div class="col-md-6" align="right" >
 		<table class="table table-bordered">
 		    
 			<tr>
 				<td><%=rs.getString("Username") %></td>
 				<td><input type="checkbox" name="absenties" style="font-weight: bolder;" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				<td>&nbsp;&nbsp;</td>
 				<%
 					count=3;
 }else if(count==3){
	 //out.println("else count2");
	count=2; 
	
 %>
				<td><%=rs.getString("Username") %></td>
 				<td><input type="checkbox" name="absenties" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				<td>&nbsp;&nbsp;</td>
 <% 
 }
 else if(count==2){
	 //out.println("else count2");
	count=1; 
%>
				 <td><%=rs.getString("Username") %></td>
 				 <td><input type="checkbox" name="absenties" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				 <td>&nbsp;&nbsp;</td>
 <% 
 }else{
	 //out.println("else count2");
	count=4; 
%>
				 <td><%=rs.getString("Username") %></td>
 				 <td><input type="checkbox" name="absenties" value="<%=rs.getString("Username")%>" onclick="periodValid()"/></td>
 				  <td>&nbsp;&nbsp;</td>
 				 </tr>
 <% 
 }
  
 }
 	session.setAttribute("rollList",rollList);
	 
 %>
 </table>	
 <table>
 
 	<tr>
		<td>Message</td>
		<td><textarea name="message" rows="3" cols="65" maxlength="180" class="form-control" required="required"></textarea> </td><td>&nbsp;</td>		
		<td align="center"><input type="submit" value="Send" class="form-control"  /></td>
 	</tr>
  	
 </table>
			 
 	</div>
 </div>

 
<%
connection.close();
System.out.println("connection closed");
%>
</form>
	</div>
	</div>
</div>

<%@include file="footer.html" %>
</body>
