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
	String rollnumber=request.getParameter("rollnumber").trim();
	if(rollnumber.contains(".p")){
		String rn[]=rollnumber.split("\\.",2);
		rollnumber=rn[0];
	}  
	
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	rs=s.executeQuery("select StudentName, Dept  from  StudentsMobiledata  where  UserName='"+rollnumber+"' ");
    String sname=null;
    String dept=null;
    while(rs.next()){
 		sname=rs.getString("StudentName"); 
  		dept=rs.getString("Dept"); 
    }
    out.println("<table align='center' border='1'>");
	out.println("<tr>");
		out.print("<th colspan='2'>"+rollnumber+"</td>");
		out.print("<th colspan='2'>"+sname+"</td>");
		out.print("<th colspan='2'>"+dept+"</td>");
	out.print("</tr>");
	out.println("</table");
	out.print("<br/>");
	out.println("<table align='center' border='1'>");
	out.println("<tr><th colspan='6' align='center'>1-1</th></tr>");
	out.println("<tr>");
		out.print("<th>July</th>");
		out.print("<th>August</th>");
  		out.print("<th>September</th>");
  		out.print("<th>October</th>");
		out.print("<th>November</th>");
  	out.print("</tr>");
	rs1=s.executeQuery("select july,august,september,october,november from studentOddSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+1+"' and sem='"+1+"' ");
	int count1=0;
	if(rs1.next()){
		count1++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("july")+"</td>");
		out.print("<td align='center'>"+rs1.getString("august")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("september")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("october")+"</td>");
		out.print("<td align='center'>"+rs1.getString("november")+"</td>");
  	}if(count1==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	out.println("<tr><th colspan='6' align='center'>1-2</th></tr>");
	out.println("<tr>");
		out.print("<th>December</th>");
		out.print("<th>January</th>");
  		out.print("<th>February</th>");
  		out.print("<th>March</th>");
		out.print("<th>April</th>");
  	out.print("</tr>");
	rs1=s.executeQuery("select december,january,february,march,april from studentEvenSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+1+"' and sem='"+2+"' ");
	int count2=0;
	if(rs1.next()){
		count2++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("december")+"</td>");
		out.print("<td align='center'>"+rs1.getString("january")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("february")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("march")+"</td>");
		out.print("<td align='center'>"+rs1.getString("april")+"</td>");
  		
  	}if(count2==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
	
	out.println("<tr><th colspan='6' align='center'>2-1</th></tr>");
	out.println("<tr>");
		out.print("<th>July</th>");
		out.print("<th>August</th>");
  		out.print("<th>September</th>");
  		out.print("<th>October</th>");
		out.print("<th>November</th>");
  	out.print("</tr>");
	rs1=s.executeQuery("select july,august,september,october,november from studentOddSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+2+"' and sem='"+1+"' ");
	int count3=0;
	if(rs1.next()){
		count3++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("july")+"</td>");
		out.print("<td align='center'>"+rs1.getString("august")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("september")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("october")+"</td>");
		out.print("<td align='center'>"+rs1.getString("november")+"</td>");
  	}if(count3==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
	
	out.println("<tr><th colspan='6' align='center'>2-2</th></tr>");
	out.println("<tr>");
		out.print("<th>December</th>");
		out.print("<th>January</th>");
  		out.print("<th>February</th>");
  		out.print("<th>March</th>");
		out.print("<th>April</th>");
  	out.print("</tr>");
	rs1=s.executeQuery("select december,january,february,march,april from studentEvenSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+2+"' and sem='"+2+"' ");
	int count4=0;
	if(rs1.next()){
		count4++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("december")+"</td>");
		out.print("<td align='center'>"+rs1.getString("january")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("february")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("march")+"</td>");
		out.print("<td align='center'>"+rs1.getString("april")+"</td>");
  	}if(count4==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
	
	out.println("<tr><th colspan='6' align='center'>3-1</th></tr>");
	out.println("<tr>");
		out.print("<th>July</th>");
		out.print("<th>August</th>");
  		out.print("<th>September</th>");
  		out.print("<th>October</th>");
		out.print("<th>November</th>");
  	out.print("</tr>");
  			
	rs1=s.executeQuery("select july,august,september,october,november from studentOddSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+3+"' and sem='"+1+"' ");
	int count5=0;
	if(rs1.next()){
		count5++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("july")+"</td>");
		out.print("<td align='center'>"+rs1.getString("august")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("september")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("october")+"</td>");
		out.print("<td align='center'>"+rs1.getString("november")+"</td>");
  	}if(count5==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
	
	out.println("<tr><th colspan='6' align='center'>3-2</th></tr>");
	out.println("<tr>");
		out.print("<th>December</th>");
		out.print("<th>January</th>");
  		out.print("<th>February</th>");
  		out.print("<th>March</th>");
		out.print("<th>April</th>");
  	out.print("</tr>");
	rs1=s.executeQuery("select december,january,february,march,april from studentEvenSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+3+"' and sem='"+2+"' ");
	int count6=0;
	if(rs1.next()){
		count6++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("december")+"</td>");
		out.print("<td align='center'>"+rs1.getString("january")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("february")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("march")+"</td>");
		out.print("<td align='center'>"+rs1.getString("april")+"</td>");
  		}if(count6==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
		
	out.println("<tr><th colspan='6' align='center'>4-1</th></tr>");
	out.println("<tr>");
		out.print("<th>July</th>");
		out.print("<th>August</th>");
  		out.print("<th>September</th>");
  		out.print("<th>October</th>");
		out.print("<th>November</th>");
  	out.print("</tr>");
  			
	rs1=s.executeQuery("select july,august,september,october,november from studentOddSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+4+"' and sem='"+1+"' ");
	int count7=0;
	if(rs1.next()){
		count7++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("july")+"</td>");
		out.print("<td align='center'>"+rs1.getString("august")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("september")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("october")+"</td>");
		out.print("<td align='center'>"+rs1.getString("november")+"</td>");
  	}if(count7==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
	
	out.println("<tr><th colspan='6' align='center'>4-2</th></tr>");
	out.println("<tr>");
		out.print("<th>December</th>");
		out.print("<th>January</th>");
  		out.print("<th>February</th>");
  		out.print("<th>March</th>");
		out.print("<th>April</th>");
  	out.print("</tr>");
	rs1=s.executeQuery("select december,january,february,march,april from studentEvenSemAttendance where  rollNumber = '"+rollnumber+"' and year='"+4+"' and sem='"+2+"' ");
	int count8=0;
	if(rs1.next()){
		count8++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("december")+"</td>");
		out.print("<td align='center'>"+rs1.getString("january")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("february")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("march")+"</td>");
		out.print("<td align='center'>"+rs1.getString("april")+"</td>");
  		}if(count8==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
   out.println("</table>");	
  	connection.close();
   %>