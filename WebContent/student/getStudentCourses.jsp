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
String section=request.getParameter("section");
String branch=request.getParameter("branch");
String sem=request.getParameter("sem");
//String acyear=request.getParameter("acyear");
//response.setContentType("text/html");
Connection connection=null;
ResultSet rs=null;

connection = dataSource.getConnection();
Statement s=connection.createStatement();
rs=s.executeQuery("select distinct course from coursesurvey where section='"+section+"' and branch='"+branch+"' and sem='"+sem+"' ");

while(rs.next()){
	
		 out.println(rs.getString("course").trim()+",");
	
}

	connection.close();
%>
