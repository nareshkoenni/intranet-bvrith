<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<%! private DataSource dataSource,dataSource1;

 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
        dataSource1 = (DataSource)envContext.lookup("jdbc/testmysql");
        
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>
<%
	//response.setContentType("text/html");
	Connection connection=null,connection1=null;
	ResultSet rs=null,rs1=null,rs2=null;
	String rollNo=request.getParameter("rollno").trim();
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	
	connection1 = dataSource1.getConnection();
	Statement s1=connection1.createStatement();
	Statement s2=connection1.createStatement();
	
  	rs1=s1.executeQuery("select Categeory, Role, Year, Sem, Dept  from LoginDetails  where  Username='"+rollNo+"' ");
  	
  	String rollNumber=null;
  	String section=null;
  	String year=null;
  	String sem=null;
  	String dept=null;
 	while(rs1.next()){
 		section=rs1.getString("Role");
 		year=rs1.getString("Year");
 		sem=rs1.getString("Sem");
		dept=rs1.getString("Dept");
 	}
 	
  	String semister=dept+"-"+year+"-"+sem+"-"+section;
 	rs2=s2.executeQuery("select StudentName, MobileNumber  from  StudentsMobiledata  where  UserName='"+rollNo+"' ");
    String sname=null;
    String mobile=null;
    while(rs2.next()){
 		sname=rs2.getString("StudentName").trim(); 
  		mobile=rs2.getString("MobileNumber").trim(); 
    }
    System.out.println(sname+"-"+mobile);
  	rs=s.executeQuery("select * from book_issue where  user='"+rollNo+"' and status='issue' ");
  	out.println("<table border='1'>");
  	out.println("<tr><th>Roll Number</th><th  colspan='4'>"+rollNo+"</th>");
  	out.println("<tr><th>Name</th><th  colspan='4'>"+sname+"</th>");
  	out.println("<tr><th>Semister</th><th  colspan='4'>"+semister+"</th>");
  	out.println("<tr><th>Mobile</th><th  colspan='4'>"+mobile+"</th>");
  	
  	
  	 out.println("<tr><th>AccNo</th><th>Title</th><th>from-date</th><th>to-date</th><th>penalty</th></tr>");
  	while(rs.next()){
  		out.print("<tr>");
  		out.print("<td>"+rs.getString("accnum")+"</td>");
  		out.print("<td>"+rs.getString("title")+"</td>");
  		out.print("<td>"+rs.getString("from_date")+"</td>");
  		out.print("<td>"+rs.getString("to_date")+"</td>");
  		out.print("<td>"+rs.getString("penalty")+"</td>");
  		out.print("</tr>");
  		
  	}
  	out.print("</table>");
  	connection.close();
   %>