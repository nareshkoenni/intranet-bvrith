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
	String element=request.getParameter("q").trim();
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
  	 rs=s.executeQuery("select title from Book where  title like '"+element+"%' ");
  	while(rs.next()){
  		out.println(rs.getString("title").trim()+",");
  	}
  	connection.close();
   %>