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
//String teacherName=(String)session.getAttribute("teacherName");
//System.out.println("teacherName---:"+teacherName);
String sem=request.getParameter("sem");
//ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
//String acyear=rb.getString(sem);

Connection connection=null;
ResultSet rs=null;

connection = dataSource.getConnection();
Statement s=connection.createStatement();
rs=s.executeQuery("select distinct course from courseSurvey where section='"+section+"' and branch='"+branch+"' and sem='"+sem+"' ");
// rs=s.executeQuery("select distinct subjectid from subjectAllocation where section='"+section+"' and branch='"+branch+"' and sem='"+sem+"' and tid='"+teacherName+"' and acyear='"+acyear+"' ");
//List teacherList=new ArrayList();

while(rs.next()){
	out.print(rs.getString("course").trim()+",");
}
%>
<%connection.close(); %>