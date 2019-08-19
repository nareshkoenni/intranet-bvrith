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
	
	response.setContentType("text/html");
	 String user=request.getParameter("user");
     String achievement=request.getParameter("achievement");
     String achievedon=request.getParameter("achievedon");
     String fromDate=request.getParameter("fromDate");
     String toDate=request.getParameter("toDate");
     
    connection = dataSource.getConnection();
	PreparedStatement ps=connection.prepareStatement("insert into achievements(user1,achievement,achievedon,fromDate,toDate) values(?,?,?,?,?)");
    ps.setString(1, user);
    ps.setString(2, achievement);
    ps.setString(3, achievedon);
    ps.setString(4, fromDate);
    ps.setString(5, toDate);
   
    int noru=ps.executeUpdate();
    if(noru==1){
    	out.println("Success");
    }else{
    	out.println("Failed");
    }
  	connection.close();
   %>