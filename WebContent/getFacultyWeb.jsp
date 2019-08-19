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

connection = dataSource.getConnection();
Statement s=connection.createStatement();
 rs=s.executeQuery("select distinct username,dept from LoginDetails where  Categeory!='Student' and Categeory!='Parent' ");//List teacherList=new ArrayList();

while(rs.next()){
	out.print(rs.getString("username").trim()+",");
}

%>
<%connection.close(); %>
