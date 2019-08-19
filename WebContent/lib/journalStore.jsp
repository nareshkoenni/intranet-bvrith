<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<%@ page import="java.text.* " %>
<%@ page import="java.net.*" %>


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
	ResultSet rs=null;
	String one=request.getParameter("1");
	String two=request.getParameter("2");
	String three=request.getParameter("3");
	
	
	String uid=(String)session.getAttribute("uid");
	connection = dataSource.getConnection();
	PreparedStatement ps=connection.prepareStatement("insert into journal values(?,?,?,?)");
	ps.setString(1,one);
	ps.setString(2,two);
	ps.setString(3,three);
	ps.setString(4,uid);
	
	
	int noru=ps.executeUpdate();
	if(noru==1){
	 	 out.println("<script>alert('Successfully inserted ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/journal.jsp?uid="+uid+"'</script>");
       	 System.out.println("Successfully Posted!");
      
	}else{
		 out.println("<script>alert('Failed ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/journal.jsp?uid="+uid+"'</script>");
	      
	}
	connection.close();
	System.out.println("connection closed");
%>
<br>

</body>
