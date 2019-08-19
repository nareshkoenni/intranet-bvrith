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
	
	out.println("<tr>");
		out.print("<th>SubjectName</th>");
		//out.print("<th>MID1</th>");
  		//out.print("<th>MID2</th>");
  		out.print("<th>Internal</th>");
		out.print("<th>External</th>");
  		out.print("<th>Total</th>");
  	out.print("</tr>");
  	out.println("<tr><th colspan='6' align='center' style='align:center;'>1-1</th></tr>");
			
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+1+"' and sem='"+1+"' ");
	int count1=0;
	double sum=0;
	while(rs1.next()){
		count1++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
		//out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  		//out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		sum+=Integer.parseInt(rs1.getString("TotalMarks"));
  	}if(count1==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	out.print("<tr>");
	
	out.print("</tr>");
	
	out.println("<tr><th colspan='6' align='center'>1-2</th></tr>");
	
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+1+"' and sem='"+2+"' ");
	int count2=0;
	while(rs1.next()){
		count2++;
		out.println("<tr>");
		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
	//	out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  		//out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		
  	}if(count2==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	out.println("<tr><th colspan='6' align='center'>2-1</th></tr>");
	
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+2+"' and sem='"+1+"' ");
	int count3=0;
	while(rs1.next()){
		count3++;
		out.println("<tr>");
		
  		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
	//	out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  		//out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		
  	}if(count3==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	out.println("<tr><th colspan='6' align='center'>2-2</th></tr>");
	
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+2+"' and sem='"+2+"' ");
	int count4=0;
	while(rs1.next()){
		count4++;
		out.println("<tr>");
		
  		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
	//	out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  		//out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		
  	}if(count4==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
out.println("<tr><th colspan='6' align='center'>3-1</th></tr>");
	
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+3+"' and sem='"+1+"' ");
	int count5=0;
	while(rs1.next()){
		count5++;
		out.println("<tr>");
		
  		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
	//	out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  	//	out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		
  	}if(count5==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
out.println("<tr><th colspan='6' align='center'>3-2</th></tr>");
	
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+3+"' and sem='"+2+"' ");
	int count6=0;
	while(rs1.next()){
		count6++;
		out.println("<tr>");
		
  		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
	//	out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  		//out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		
  	}if(count6==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
out.println("<tr><th colspan='6' align='center'>4-1</th></tr>");
	
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+4+"' and sem='"+1+"' ");
	int count7=0;
	while(rs1.next()){
		count7++;
		out.println("<tr>");
		
  		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
	//	out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  		//out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		
  	}if(count7==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
out.println("<tr><th colspan='6' align='center'>4-2</th></tr>");
	
	rs1=s.executeQuery("select SubjectName,MID1,MID2,SubjectInternalMarks,SubjectExternalMarks,TotalMarks from Studentmarks where  StudentRollnumber = '"+rollnumber+"' and year='"+4+"' and sem='"+2+"' ");
	int count8=0;
	while(rs1.next()){
		count8++;
		out.println("<tr>");
		
  		out.print("<td align='center'>"+rs1.getString("SubjectName")+"</td>");
	//	out.print("<td align='center'>"+rs1.getString("MID1")+"</td>");
  		//out.print("<td align='center'>"+rs1.getString("MID2")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("SubjectInternalMarks")+"</td>");
		out.print("<td align='center'>"+rs1.getString("SubjectExternalMarks")+"</td>");
  		out.print("<td align='center'>"+rs1.getString("TotalMarks")+"</td>");
  		
  	}if(count8==0){
		out.print("<td colspan='6' align='center'>NA</td>");
  	}
	out.print("</tr>");
	
  		
   out.println("</table>");	
  	connection.close();
   %>