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
        dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>

<%
	//response.setContentType("text/html");
	Connection connection=null;
	ResultSet rs=null,rs1=null;
	String ssone=request.getParameter("ssone").trim();
	String sstwo=request.getParameter("sstwo").trim();
	
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	out.println("<table align='center' border='1'>");
	if(ssone.equals("1")){
  		rs=s.executeQuery("select title,subject,status from Book where  title like '%"+sstwo+"%' ");
  		out.println("<tr><th align='center'>Title</th><th>Subject</th><th>Status</th></tr>");
  		
  		while(rs.next()){
  			out.println("<tr>");
  			out.print("<td>"+rs.getString("title")+"</td>");
  			out.print("<td>"+rs.getString("subject")+"</td>");
  			out.print("<td>"+rs.getString("status")+"</td>");
  			out.print("</tr>");
  		}
	}else if(ssone.equals("2")){
		rs=s.executeQuery("select title,author,status from Book where  author like '%"+sstwo+"%' ");
		out.println("<tr><th align='center'>Title</th><th>Author</th><th>Status</th></tr>");
  		while(rs.next()){
  			out.println("<tr>");
  			out.print("<td>"+rs.getString("title")+"</td>");
  			out.print("<td>"+rs.getString("author")+"</td>");
  			out.print("<td>"+rs.getString("status")+"</td>");
  			out.print("</tr>");
  		}
	}else if(ssone.equals("3")){
		rs=s.executeQuery("select title,subject,status from Book where  subject like '%"+sstwo+"%' ");
		out.println("<tr><th align='center'>Title</th><th>Subject</th><th>Status</th></tr>");
  		
		while(rs.next()){
  			out.println("<tr>");
  			out.print("<td>"+rs.getString("title")+"</td>");
  			out.print("<td>"+rs.getString("subject")+"</td>");
  			out.print("<td>"+rs.getString("status")+"</td>");
  			out.print("</tr>");
  		}
	}else if(ssone.equals("4")){
		rs=s.executeQuery("select title,accno,status from Book where  accno like '%"+sstwo+"%' ");
		out.println("<tr><th align='center'>Title</th><th>AccNumber</th><th>Status</th></tr>");
  		while(rs.next()){
  			out.println("<tr>");
  			out.print("<td>"+rs.getString("title")+"</td>");
  			out.print("<td>"+rs.getString("accno")+"</td>");
  			out.print("<td>"+rs.getString("status")+"</td>");
  			out.print("</tr>");
  		}
	}
   out.println("</table>");	
  	connection.close();
   %>