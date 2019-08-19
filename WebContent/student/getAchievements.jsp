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
        System.out.println("hellooooo");
	
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
	String user=request.getParameter("user").trim();
	if(user.contains(".p")){
		String rn[]=user.split("\\.",2);
		user=rn[0];
	}
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	
  	
	out.println("<table align='center' border='1'>");
	
	out.println("<tr>");
		out.print("<th>Achievement</th>");
		out.print("<th>Achieved On</th>");
  		out.print("<th>From Date</th>");
  		out.print("<th>To Date</th>");
		
  	out.print("</tr>");
			
	rs1=s.executeQuery("select achievement, achievedon, fromDate, toDate from achievements where  user1 = '"+user+"' order by achievedon desc ");
	int count1=0;
	while(rs1.next()){
		count1++;
		out.println("<tr>");
		
		out.print("<td align='center'>"+rs1.getString("achievement")+"</td>");
		
		out.print("<td align='center'>"+rs1.getString("achievedon")+"</td>");
		if(rs1.getString("fromDate")==null){
			out.print("<td align='center'>-</td>");
	  	}else{
  			out.print("<td align='center'>"+rs1.getString("fromDate")+"</td>");
	  	}
  		out.print("<td align='center'>"+rs1.getString("toDate")+"</td>");
		}if(count1==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
	
  		
   out.println("</table>");	
  	connection.close();
   %>