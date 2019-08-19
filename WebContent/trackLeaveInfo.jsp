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
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>

<%
	//response.setContentType("text/html");
	Connection connection=null;
	ResultSet rs=null,rs1=null;
	String from=request.getParameter("from").trim();
	String to=request.getParameter("to").trim();
	String lt=request.getParameter("lt").trim();
	
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	out.println("<table align='center' border='1'>");
		rs=s.executeQuery("select * from leaves where leave_type='"+lt+"' and fromDate between '"+from+"' and '"+to+"' order by applicant_dept ");
  		out.println("<tr><th align='center'>No</th><th align='center'>Applicant</th><th align='center'>Dept</th><th align='center'>Leave Type</th><th align='center'>Days</th><th align='center'>From Date</th><th align='center'>To Date</th><th align='center'>Principal Status</th></tr>");
  		int count=0;
  		while(rs.next()){
  			count++;
  			out.println("<tr>");
  			out.print("<td>"+count+"</td>");
  			out.print("<td>"+rs.getString("applicant_id")+"</td>");
  			out.print("<td>"+rs.getString("applicant_dept")+"</td>");
  			out.print("<td>"+rs.getString("leave_type")+"</td>");
  			out.print("<td>"+rs.getString("numdays")+"</td>");
  			out.print("<td>"+rs.getString("fromDate")+"</td>");
  			out.print("<td>"+rs.getString("toDate")+"</td>");
  			out.print("<td>"+rs.getString("principalstatus")+"</td>");
  			
  			out.print("</tr>");
  		}
  		if(count==0){
  			out.print("<tr><td colspan='7' align='center'>No Leaves in this range</td></tr>");
  		  	
  		}
	
   out.println("</table>");	
  	connection.close();
   %>