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
	String section=request.getParameter("section");
String branch=request.getParameter("branch");
String sem=request.getParameter("sem");
String course=request.getParameter("course");
connection = dataSource.getConnection();
Statement s=connection.createStatement();
ResultSet rs=s.executeQuery("select p1,p2,p3,p4,p5,p6,p7,p8 from courseSurvey where section='"+section+"' and branch='"+branch+"' and sem='"+sem+"' and course='"+course+"' ");
//List teacherList=new ArrayList();

while(rs.next()){
	out.print(rs.getString("p1")+"\t"+rs.getString("p2")+"\t"+rs.getString("p3")+"\t"+rs.getString("p4")+"\t"+rs.getString("p5")+"\t"+rs.getString("p6")+"\t"+rs.getString("p7")+"\t"+rs.getString("p8"));
}

%>
<%connection.close(); %>
