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
	
	response.setContentType("text/html");
	 String message=request.getParameter("message");
     String user=(String)session.getAttribute("uid");
    connection = dataSource.getConnection();
	PreparedStatement ps=connection.prepareStatement("insert into noticeboard(message,date,posteduser) values(?,getdate(),?)");
    ps.setString(1, message);
    ps.setString(2, user);
    
    int noru=ps.executeUpdate();
    if(noru==1){
    	out.println("<script>alert('Successfully Posted');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/viewNoticeboard.jsp?uid="+user+"'</script>");
		
    }else{
    	out.println("<script>alert('Failed');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/noticeboard.jsp?uid="+user+"'</script>");
    	
    }
  	connection.close();
   %>