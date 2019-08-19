<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<%! private DataSource dataSource;

 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        System.out.println("hellooooo");
	
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>

<%
	//response.setContentType("text/html");
	Connection connection=null;
	ResultSet rs=null,rs1=null;
	String from=request.getParameter("from").trim();
	String to=request.getParameter("to").trim();
	
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	out.println("<table align='center' border='1'>");
		rs=s.executeQuery("select user,accnum,title,from_date from book_issue where status='issue' and  from_date between '"+from+"' and '"+to+"' ");
  		out.println("<tr><th align='center'>S.No</th><th align='center'>User</th><th align='center'>AccNo</th><th align='center'>Title</th><th align='center'>Issue Date</th></tr>");
  		int count=0;
  		while(rs.next()){
  			count++;
  			out.println("<tr>");
  			out.print("<td>"+count+"</td>");
  			out.print("<td>"+rs.getString("user")+"</td>");
  			out.print("<td>"+rs.getString("accnum")+"</td>");
  			out.print("<td>"+rs.getString("title")+"</td>");
  			out.print("<td>"+rs.getString("from_date")+"</td>");
  			
  			out.print("</tr>");
  		}
  		if(count==0){
  			out.print("<tr><td colspan='4' align='center'>No Returns in this data</td></tr>");
  		  	
  		}
	
   out.println("</table>");	
  	connection.close();
   %>