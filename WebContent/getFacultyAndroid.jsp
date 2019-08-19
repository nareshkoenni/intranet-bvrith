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


Connection connection=null;
ResultSet rs=null;
response.setHeader("Access-Control-Allow-Origin", "*");
connection = dataSource.getConnection();
Statement s=connection.createStatement();
 rs=s.executeQuery("select distinct username from LoginDetails where  categeory!='student' and categeory!='parent' ");//List teacherList=new ArrayList();
 out.println("{\"faculty\" : [  ");
 int i=0;
while(rs.next()){
	 if(i != 0) {
			out.println(",");	 
		 } 
		 i=1;
		 out.println("{\"name\" : "+'"'+rs.getString("username")+'"'+" }");
}
out.println("]} ");
%>
<%connection.close(); %>