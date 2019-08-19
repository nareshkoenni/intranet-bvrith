<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="allocatedSubjects1.jsp" method="POST">

 <table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
  <tr>
  <td><select name='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
 <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"> </td>
  </tr>
</table>	 
</form>
<hr/>

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
	ResultSet rs=null,rs1=null;
	connection = dataSource.getConnection();
	connection2 = dataSource2.getConnection();
	String subjectId=request.getParameter("subjectId");
	String section=request.getParameter("section");
	String tid=request.getParameter("tid");
	String branch=request.getParameter("branch");
	if(branch==null){
		 branch=(String)session.getAttribute("branch");
	}
	String sem=request.getParameter("sem");
	
    System.out.println("got connection from update \t"+connection.getClass());
    System.out.println(subjectId);
    System.out.println(section);
    
    Statement s=connection.createStatement();
  //  rs=s.executeQuery("select section,subjectid from subjectallocation where  subjectid='"+subjectId+"' and section='"+section+"' and tname='"+tname+"' and branch='"+branch+"'");
%>
<form action="update1.jsp">
<table align="center" border="2" style="border-style: dashed; background:gray; height: 200px; width: 200px;">
<tr><th colspan="6" align="center"> Update Faculty</th></tr>

<%
String branch1=null;
//while(rs.next()){
 
 %>
 <tr><td align="center"><input type="text" name="branch" value="<%=branch%>" /></td></tr>
 <tr><td align="center"><input type="text" name="sem" value="<%=sem%>" /></td></tr>
 
 <tr><td align="center"><input type="text" name="section" value="<%=section%>" /></td></tr>
 <tr><td align="center"><input type="text" name="subjectId" value="<%=subjectId%>" /></td></tr>
 <%
//}
Statement s2=connection2.createStatement();
rs1=s2.executeQuery("select distinct Username from LoginDetails where  categeory!='student' and categeory!='parent' ");


 %>
 <tr>
 <td align="center"><select name='tname'><option value='choose'>Choose Faculty</option>
 <%
 while(rs1.next()){
%>
 <option value='<%=rs1.getString("Username")%>'>
 <%=rs1.getString("Username")%>
 <%  } %>
  </option> 
  
  </select>
  </td>
  <tr><td align="center"><input type="submit" value="Update"></td></tr>
</tr>
 <%
 
connection.close();
System.out.println("connection closed");
%>

 </table>
</form>
</div>
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>