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
	String four=request.getParameter("4");
	String five=request.getParameter("5");
	String six=request.getParameter("6");
	String seven=request.getParameter("7");
	String eight=request.getParameter("8");
	String nine=request.getParameter("9");
	String ten=request.getParameter("10");
	String eleven=request.getParameter("11");
	String twelve=request.getParameter("12");
	
	String uid=(String)session.getAttribute("uid");
	connection = dataSource.getConnection();
	PreparedStatement ps=connection.prepareStatement("insert into book values(?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,one);
	ps.setString(2,two);
	ps.setString(3,three);
	ps.setString(4,four);
	ps.setString(5,five);
	ps.setString(6,six);
	ps.setString(7,seven);
	ps.setString(8,eight);
	ps.setString(9,nine);
	ps.setString(10,ten);
	ps.setString(11,eleven);
	ps.setString(12,twelve);
	
	int noru=ps.executeUpdate();
	if(noru==1){
	 	 out.println("<script>alert('Successfully inserted ');window.location = 'http://192.168.1.46:9000/intranet/lib/book.jsp?uid="+uid+"'</script>");
       	 System.out.println("Successfully Posted!");
      
	}else{
		 out.println("<script>alert('Failed ');window.location = 'http://192.168.1.46:9000/intranet/lib/book.jsp?uid="+uid+"'</script>");
	      
	}
	connection.close();
	System.out.println("connection closed");
%>
<br>

</body>
