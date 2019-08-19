<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<body style="background: silver;">
<form action="viewFaculty1.jsp" method="POST">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500 height="95"></h1>
 <hr/>
 <table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
  <tr>
  <td><select name='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
 <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"><a href="adminHome.jsp">Home</a>  </td>
  </tr>
</table>	 
</form>
<hr/>

<%! private DataSource dataSource;
 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
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
	String branch=request.getParameter("branch").toUpperCase();
	
    System.out.println("got connection from viewfeedback2 \t"+connection.getClass());
    Statement s=connection.createStatement();
    rs=s.executeQuery("select *from teacher where branch='"+branch+"' order by id asc ");
%>
<table align="center" border="2" style="border-style: dashed; background: green; height: 200px; width: 600px;">
<tr><th colspan="3" align="center"><%=branch %> Faculty List</th></tr>
<tr>
<th>Faculty ID</th><th>Name</th><th>DOJ</th>
</tr>

<%    
    while(rs.next()){
    	
    %>
 <tr><td align="center"><%=rs.getString("id") %></td><td align="center"><%=rs.getString("name") %></td><td align="center"><%=rs.getString("doj") %></td> </tr>
 <%
 }
connection.close();
System.out.println("connection closed");
%>

 </table>

</body>