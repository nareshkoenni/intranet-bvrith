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
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
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
String tid=request.getParameter("tid");
ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
String acyear=rb.getString(sem);
//response.setContentType("text/html");
Connection connection=null;
ResultSet rs=null;

connection = dataSource.getConnection();
Statement s=connection.createStatement();
rs=s.executeQuery("select distinct subjectid from subjectAllocation where section='"+section+"' and branch='"+branch+"' and sem='"+sem+"' and tid='"+tid+"' and acyear='"+acyear+"' ");
//List teacherList=new ArrayList();
out.println("{\"courses\" : [  ");
  	 int i=0;
while(rs.next()){
	if(i != 0) {
			out.println(",");	 
		 } 
		 i=1;
		 out.println("{\"course\" : "+rs.getString("subjectid").trim()+" }");
	
}
out.println("]}");
	connection.close();
%>
