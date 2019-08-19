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
	ResultSet rs=null;
	String year=null;
	String sem=null;
	String sem1=request.getParameter("sem");
	if(sem1.equals("1/4Sem-I"))
	{
		year="1";
		sem="1";
	}else if(sem1.equals("1/4Sem-II")){
		year="1";
		sem="2";
	}else if(sem1.equals("2/4Sem-I")){
		year="2";
		sem="1";
	}else if(sem1.equals("2/4Sem-II")){
		year="2";
		sem="2";
	}else if(sem1.equals("3/4Sem-I")){
		year="3";
		sem="1";
	}else if(sem1.equals("3/4Sem-II")){
		year="3";
		sem="2";
	}else if(sem1.equals("4/4Sem-I")){
		year="4";
		sem="1";
	}else if(sem1.equals("4/4Sem-II")){
		year="4";
		sem="2";
	}
	System.out.println(year);
	System.out.println(sem);
	String role1=request.getParameter("section");
	String role=null;
	if(role1.equals("section1")){
		role="a";
	}else{
		role="b";
	}
	System.out.println(role);
	String dept=request.getParameter("dept");
	System.out.println(dept);
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
  	 rs=s.executeQuery("select Username from logindetails where categeory='Student' and Year='"+year+"' and sem='"+sem+"' and Role='"+role+"' and Dept='"+dept+"' ");
  	 out.println("{\"rollnumbers\" : [  ");
  	 int i=0;
  	 while(rs.next()){
  		 
  		 if(i != 0) {
  			out.println(",");	 
  		 } 
  		 i=1;
  		 out.println("{\"rno\" : "+rs.getString(1)+" }");
  		 
  	}  
  	 out.println("]} ");
  	connection.close();
   %>