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
	String ay=request.getParameter("ay").trim();
	//System.out.println(branch+sem+section+course+ay);
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	
	out.println("<table align='center' border='1'>");
	rs=s.executeQuery("select avg(teaching),avg(labs),avg(library),avg(internet),avg(tpc),avg(admin),avg(medical),avg(canteen),avg(transp),avg(sports),avg(extraact),avg(ambience),avg(security),avg(counselling),avg(aminities),avg(overall) from fbFacilities where  branch ='"+branch+"' and sem='"+sem+"' and section='"+section+"'  and acyear='"+ay+"'  group by section ");
  	int count=0;
  	double tlp1=0,tlp2=0,tlp3=0,tlp4=0,tlp5=0,tlp6=0,tlp7=0,tlp8=0,tlp9=0,tlp10=0,tlp11=0,tlp12=0,tlp13=0,tlp14=0,tlp15=0,tlp16=0;
  	if(rs.next()){
  		tlp1=rs.getDouble(1);
  		tlp2=rs.getDouble(2);
  		tlp3=rs.getDouble(3);
  		tlp4=rs.getDouble(4);
  		tlp5=rs.getDouble(5);
  		tlp6=rs.getDouble(6);
  		tlp7=rs.getDouble(7);
  		tlp8=rs.getDouble(8);
  		tlp9=rs.getDouble(9);
  		tlp10=rs.getDouble(10);
  		tlp11=rs.getDouble(11);
  		tlp12=rs.getDouble(12);
  		tlp13=rs.getDouble(13);
  		tlp14=rs.getDouble(14);
  		tlp15=rs.getDouble(15);
  		tlp16=rs.getDouble(16);
  	  	
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
		
		out.println("</table>");
	//	out.println("<br>");
	  
		out.println("<table border='1' width='300'>");
	  		out.println("<tr>");
				out.print("<th colspan='3'>1.Teaching</th>");
			//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp1+"</th>");
	  		out.println("</tr>");
	  		
	  		out.println("<tr>");
			out.print("<th colspan='3'>2.Laboratories & Class Rooms</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp2+"</th>");
  			out.println("</tr>");
  		
  			  			
  			out.println("<tr>");
			out.print("<th colspan='3'>3.Library</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp3+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>4.Computing Facilities & Internet</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp4+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>5.Training & Placement Cell</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp5+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>6.Administration Department</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp6+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>7.Medical</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp7+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>8.Canteen</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp8+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>9.Transport/Hostel</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp9+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>10.Sports</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp10+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>11.Extracurricular Activities</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp11+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>12.Ambience</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp12+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>13.Security</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp13+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>14.Counseling System</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp14+"</th>");
  			out.println("</tr>");
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>15.Aminities</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp15+"</th>");
  			out.println("</tr>");
  			
  			
  			out.println("<tr>");
			out.print("<th colspan='3'>16.Overall Rating</th>");
		//	out.print("<th colspan='3'>:</th>");
			out.print("<td colspan='3'>"+tlp16+"</th>");
  			out.println("</tr>");
	  	out.println("</table>");
  	}
	connection.close();
   %>