<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<%! private DataSource dataSource,dataSource1;

 %>
 
<%!
public void jspInit(){
    try {
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
        dataSource1 = (DataSource)envContext.lookup("jdbc/testmysql");
        
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>
<%
	//response.setContentType("text/html
	Connection connection=null,connection1=null;
	ResultSet rs=null,rs1=null,rs2=null;
	String uid=request.getParameter("uid").trim();
	response.setContentType("text/html");
	
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	
	connection1 = dataSource1.getConnection();
	Statement s1=connection1.createStatement();
	
  	rs1=s1.executeQuery("select Dept  from LoginDetails  where  Username='"+uid+"'"); 
  	String dept=null;
 	while(rs1.next()){
 		dept=rs1.getString("Dept");
 	}
 rs=s.executeQuery("select * from book_issue where  user='"+uid+"' and status='issue'"); 
 int count=0;
  %>
  	<table border='1' align='center'>
  	<tr><th>Name</th><td  colspan='4'><%=uid %></td></tr>
  	<tr><th>Dept</th><td  colspan='4'><%=dept %></td></tr>
  	
  	<% while(rs.next()){ count++;%>
  	
  		<tr>
  	
  		<td><%=rs.getString("accnum")%></td>
  		<td><%=rs.getString("title")%></td>
  		<td><%=rs.getString("from_date")%></td>
  		<td><%=rs.getString("to_date")%></td>
  		<td><%=rs.getString("penalty")%></td>
  		</tr>
  	<% }if(count==0){out.println("<tr><td colspan='5'>No books are taken</td></tr>");}%>
  	</table>
  	<%connection.close();connection1.close();%>
  	