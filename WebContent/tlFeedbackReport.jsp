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
	String branch=request.getParameter("branch").trim();
	String sem=request.getParameter("sem").trim();
	String section=request.getParameter("section").trim();
	String course=request.getParameter("course").trim();
	String ay=request.getParameter("ay").trim();
	System.out.println(branch+sem+section+course+ay);
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	Statement s1=connection.createStatement();
	rs1=s1.executeQuery("select faculty from tlfeedback where  branch ='"+branch+"' and sem='"+sem+"' and section='"+section+"' and course='"+course+"' and acyear='"+ay+"' ");
	String faculty=null;
	if(rs1.next()){
		faculty=rs1.getString("faculty");
	}
	out.println("<table align='center' border='1'>");
	rs=s.executeQuery("select avg(tlp1),avg(tlp2),avg(tlp3),avg(tlp4),avg(tlp5),avg(tlp6),avg(tlp7),avg(tlp8) from tlfeedback where  branch ='"+branch+"' and sem='"+sem+"' and section='"+section+"' and course='"+course+"' and acyear='"+ay+"'  group by course,section ");
  	int count=0;
  	double tlp1=0,tlp2=0,tlp3=0,tlp4=0,tlp5=0,tlp6=0,tlp7=0,tlp8=0;
  	if(rs.next()){
  		tlp1=rs.getDouble(1)*20;
  		tlp2=rs.getDouble(2)*20;
  		tlp3=rs.getDouble(3)*20;
  		tlp4=rs.getDouble(4)*20;
  		tlp5=rs.getDouble(5)*20;
  		tlp6=rs.getDouble(6)*20;
  		tlp7=rs.getDouble(7)*20;
  		tlp8=rs.getDouble(8)*20;
  		count++;
  	}
  	if(count==0){
  		out.println("<table border='0'>");
  	  	out.println("<tr>");
	  		out.print("<th colspan='3'>NA</th>");
		out.println("</tr>");
		out.println("</table>");
  	}else{
  		out.println("<table border='0'>");
  	  	out.println("<tr>");
	  		out.print("<th colspan='3'>Branch</th>");
	  		out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+branch+"</th>");
		out.println("</tr>");
		out.println("<tr>");
	  		out.print("<th colspan='3'>Semester</th>");
	  		out.print("<th colspan='3'>:</th>");
	  		out.print("<td colspan='3'>"+sem+"</th>");
		out.println("</tr>");
		out.println("<tr>");
	  		out.print("<th colspan='3'>Section</th>");
	  		out.print("<th colspan='3'>:</th>");
	  		out.print("<td colspan='3'>"+section+"</th>");
		out.println("</tr>");
		out.println("<tr>");
	  		out.print("<th colspan='3'>Batch</th>");
	  		out.print("<th colspan='3'>:</th>");
	  		out.print("<td colspan='2'>"+ay+"</th>");
		out.println("</tr>");
		out.println("<tr>");
	  		out.print("<th colspan='3'>Faculty</th>");
	  		out.print("<th colspan='3'>:</th>");
	  		//out.print("<td colspan='2'>"+rs.getString("faculty")+"</th>");
			out.print("<td colspan='2'>"+faculty+"</th>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<br>");
	  
		out.println("<table >");
	  		out.println("<tr>");
				out.print("<th colspan='3'>Enlighting introduction to the subject and creation of interest</th>");
				out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp1+"</th>");
	  		out.println("</tr>");
	  		
	  		out.println("<tr>");
			out.print("<th colspan='3'>Planning and delivery of the Subject</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp2+"</th>");
  			out.println("</tr>");
  		
  			  			
  			out.println("<tr>");
			out.print("<th colspan='3'>Lectures are knowledgeable, clear and audible</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp3+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>Usage of the board is Clear and Visible</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp4+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>Quality of Internal Evaluation</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp5+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>Encouragement for Questions and innovative ideas</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp6+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>Maintenance of Regularity and Discipline</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp7+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>Innovative methods for Teaching</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp8+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>Overall</th>");
			out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+(tlp1+tlp2+tlp3+tlp4+tlp5+tlp6+tlp7+tlp8)/8+"</th>");
  			out.println("</tr>");
	  	out.println("</table>");
  	}
		
  	
	
   
  	connection.close();
   %>