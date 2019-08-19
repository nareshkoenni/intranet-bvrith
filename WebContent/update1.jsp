<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
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
	//response.setContentType("text/html");
	Connection connection=null;
	//ResultSet rs=null;
	connection = dataSource.getConnection();
	String subjectId=request.getParameter("subjectId");
	String tname=request.getParameter("tname");
	String section=request.getParameter("section");
	String branch=request.getParameter("branch");
	String sem=request.getParameter("sem");
	
    System.out.println("got connection from update1 \t"+connection.getClass());
    System.out.println(subjectId);
    
    Statement s=connection.createStatement();
    s.executeUpdate("update subjectallocation set tid='"+tname+"' where  section='"+section+"' and subjectid='"+subjectId+"' and branch='"+branch+"' and sem='"+sem+"'");
    out.println("<script>alert(' Updated Successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/allocatedSubjects.jsp?uid="+uid+"'</script>"); 
    	
	connection.close();
	System.out.println("connection closed");
%>
</div>
		</div>
	</div>
</div>
<%@include file="footer.html" %>