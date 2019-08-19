<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
  <script type="text/javascript">
  	function courseValid(){
  		var course=postattendance.course.value;
  		if(course=="choose"){
  			alert("Please Choose Course");
  			//postattendance.course.focus();
  			//return true;  
  		}
  		
  	}
  </script>
  </head>
  <body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
  <h3 align="center" class="bars">Notice Board</h3><br>
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
	
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	
  	
	out.println("<table align='center' border='1'>");
	
	out.println("<tr>");
		out.print("<th align='center'>Message</th>");
		out.print("<th>Posted By</th>");
		out.print("<th>Date</th>");
		
		out.print("</tr>");
			
	rs1=s.executeQuery("select date,message,posteduser from noticeboard order by date desc ");
	int count1=0;
	while(rs1.next()){
		count1++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("message")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("posteduser")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("date")+"</td>");
		
  	}if(count1==0){
			out.print("<td colspan='6' align='center'>No Data</td>");
  	}
	out.print("</tr>");
	
	
  		
   out.println("</table>");	
  	connection.close();
   %>
   
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>