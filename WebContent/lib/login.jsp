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
	//response.setContentType("text/html");
	Connection connection=null;
	ResultSet rs=null,rs1=null;
	String username=request.getParameter("username");
	String pwd=request.getParameter("pwd");
	
	
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
  	 rs=s.executeQuery("select * from logindetails where  username='"+username+"' and password='"+pwd+"' ");
  	
  	 if(rs.next()){
  		 if(rs.getString("Categeory").equals("Student")){
  			 out.println("student");
  		 }else if(rs.getString("role").equals("Librarian")){
  			out.println("librarian");
  	  	 }else if(rs.getString("Categeory").equals("Parent")){
  			 out.println("parent");
  		 }else{
  	  		out.println("staff");
  	  	 }
  		//rd.include(request,response);
	}else{
	
		out.println("Invaild credentials");
		
	}
  //	connection.close();
   %>