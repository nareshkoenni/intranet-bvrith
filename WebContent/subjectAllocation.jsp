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
<form action="sas" method="POST" style="">

 <h3 align="center" class="bars">Subject Allocation</h3>
 <table align="center">
 
 

<%! private DataSource dataSource,dataSource2;

 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
        dataSource2 = (DataSource)envContext.lookup("jdbc/testmysql");
        System.out.println(dataSource);
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>
<%
	//response.setContentType("text/html");
	Connection connection=null,connection2=null;
	ResultSet rs=null,rs1=null,rs2=null;
	String branch=(String)session.getAttribute("branch");
	
	if(branch==null){
		branch=request.getParameter("branch");
	}
	String sem=request.getParameter("sem");
	if(sem==null){
		 sem=(String)session.getAttribute("sem");	
	}
	session.setAttribute("sem", sem);
	
	connection = dataSource.getConnection();
	connection2 = dataSource2.getConnection();
    System.out.println("got connection from cse subject allocation \t"+connection.getClass());
    Statement s=connection.createStatement();
    Statement s2=connection2.createStatement();
    rs=s2.executeQuery("select distinct Username from LoginDetails where  categeory!='student' and categeory!='parent'");
      
%>
<tr>
  <td><input type="text" name="branch" value="<%=branch%>" class="form-control" size="3"></td>
 <td><select name='faculty' class="btn btn-default dropdown-toggle"><option value='choose'>Choose Faculty</option>
 
<%
while(rs.next()){
	 
%>
 <option value='<%=rs.getString("username")%>'>
 <%=rs.getString("username")%>
  <%  } %>
  </option> 
  
  </select>
  </td>
  <%
  rs1=s2.executeQuery("select distinct course from courseSurvey where branch='"+branch+"' and sem='"+sem+"'");
  
  %>
<td><select name='subject' class="btn btn-default dropdown-toggle"><option value='choose' class="btn btn-default dropdown-toggle">Choose Subject</option>
 
<%
while(rs1.next()){
	 
%>
 <option value='<%=rs1.getString("course")%>'>
 <%=rs1.getString("course")%>
 <%  } %>
  </option> 
  
  </select>
  </td>
  <td>
  	<select name="section" class="btn btn-default dropdown-toggle">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select>
  </td>
  
  </tr>
  <tr>  
<td align="center" colspan="2"></td>

<td align="center" colspan="2"><input type="submit" value="Assign" /></td>

</tr>
 </table>	 
 
</form>
<%
	connection.close();
	System.out.println("connection closed");
%>
</div>
		
	</div>
		
</div>
<%@include file="footer.html" %>