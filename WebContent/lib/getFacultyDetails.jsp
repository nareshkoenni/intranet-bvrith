<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<%! private DataSource dataSource,dataSource1;

 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        
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
	//response.setContentType("text/html");
	Connection connection=null,connection1=null;
	ResultSet rs=null,rs1=null,rs2=null;
	String rollNo=request.getParameter("user").trim();
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	
	connection1 = dataSource1.getConnection();
	Statement s1=connection1.createStatement();
	Statement s2=connection1.createStatement();
	
  	rs1=s1.executeQuery("select Categeory, Dept  from LoginDetails  where  Username='"+rollNo+"' ");
  	
  	String user=null;
  	
  	String dept=null;
 	while(rs1.next()){
 		user=rs1.getString("Categeory");
		dept=rs1.getString("Dept");
 	}
  	
   	 
  	rs=s.executeQuery("select * from book_issue where  user='"+rollNo+"' and status='issue' ");
  	out.println("<table border='1' align='center'>");
  	out.println("<tr><th>Name</th><th  colspan='3'>"+user+"</th>");
  	out.println("<tr><th>Dept</th><th  colspan='3'>"+dept+"</th>");
  	out.println("<tr><th>AccNo</th><th align='center'>Title</th><th>Issue-date</th></tr>");
  	while(rs.next()){
  		out.print("<tr>");
  		out.print("<td>"+rs.getString("accnum")+"</td>");
  		out.print("<td>"+rs.getString("title")+"</td>");
  		out.print("<td>"+rs.getString("from_date")+"</td>");
  		out.print("</tr>");
  		
  	}
  	out.print("</table>");
  	connection.close();
   %>