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
        System.out.println(dataSource);
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>
<%
String leaveId=request.getParameter("lId");
String uid=(String)session.getAttribute("uid");
//String acyear=request.getParameter("acyear");
//response.setContentType("text/html");
Connection connection=null;
ResultSet rs=null;

connection = dataSource.getConnection();
Statement s=connection.createStatement();
int noru=s.executeUpdate("delete from leaves where id='"+leaveId+"'");
int noru1=s.executeUpdate("delete from adjust where leaveid='"+leaveId+"'");
out.println("<script>alert('Successfully Deleted!');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid="+uid+"'</script>");
	
	connection.close();
%>
