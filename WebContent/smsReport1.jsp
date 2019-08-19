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
	String rollNumber=request.getParameter("rollNumber").trim();
	
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	out.println("<table align='center' border='1'>");
	rs=s.executeQuery("select deliveryDate,parentMobile,messageStatus,message from smsReport where  rollNumber = '"+rollNumber+"' order by deliveryDate desc ");
  	int count=0;
  	out.println("<tr>");
	out.print("<th colspan='3'></th>");
	out.print("<th colspan='2'>"+rollNumber+"</th>");
		
	out.println("<tr><th align='center'></th><th align='center'>Date</th><th align='center'>Parent Mobile</th><th align='center'>Message Status</th><th>Message</th></tr>");
  	
	out.print("</tr>");
  		
  	while(rs.next()){
  		count++;
  		out.println("<tr>");
  		out.print("<td>"+count+"</td>");
  		out.print("<td>"+rs.getString("deliveryDate")+"</td>");
  		out.print("<td>"+rs.getString("parentMobile")+"</td>");
  		out.print("<td>"+rs.getString("messageStatus")+"</td>");
  		out.print("<td>"+rs.getString("message")+"</td>");
  		out.print("</tr>");
  	}
	
   out.println("</table>");	
  	connection.close();
   %>