<%@page import="com.sun.org.apache.bcel.internal.generic.FMUL"%>
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
	rs=s.executeQuery("select Studentname,Department,Sphoneno,Fathername,Fcontactnumber,Semailid,Mothername,Mcontactnumber,Batch,Dateofbirth,Permanentaddress,Addressforcommunication,Remarks  from  StudentRegister  where  Username='"+rollnumber+"' ");
    String sname=null;
    String sphone=null;
    String dept=null;
    String fname=null;
    String fphone=null;
    String mname=null;
    String mphone=null;
    String semail=null;
    String batch=null;
    String dob=null;
    String paddress=null;
    String caddress=null;
    String imageAddress=null;
    
    while(rs.next()){
 		sname=rs.getString("StudentName"); 
  		dept=rs.getString("Department"); 
  		sphone=rs.getString("Sphoneno");
  		fname=rs.getString("Fathername");
  		fphone=rs.getString("Fcontactnumber");
  		semail=rs.getString("Semailid");
  		mname=rs.getString("Mothername");
  		mphone=rs.getString("Mcontactnumber");
  		batch=rs.getString("Batch");
  		dob=rs.getString("Dateofbirth");
  		paddress=rs.getString("Permanentaddress");
  		caddress=rs.getString("Addressforcommunication");
  		imageAddress=rs.getString("Remarks");
    }
   // String img[]=imageAddress.split("\\.",2);
	//rollnumber=rn[0];
    out.println("<table align='center' border='1'>");
    out.println("<tr>");
		out.print("<th>Roll Number</th>");
		out.print("<th>Name</th>");
		out.print("<th>Dept</th>");
		out.print("<th>Student mobile</th>");
		out.print("<th>Father name</th>");
		out.print("<th>Father mobile</th>");
		out.print("<th>Mother Name</th>");
		out.print("<th>Mother mobile</th>");
		out.print("<th>Perm Address</th>");
		out.print("<th>Comm Address</th>");
		out.print("<th>Batch</th>");
		out.print("<th>Mail ID</th>");
		out.print("<th>DoB</th>");
		out.print("<th></th>");
		
	out.print("</tr>");
	out.println("<tr>");
		out.print("<td>"+rollnumber+"</td>");
		out.print("<td>"+sname+"</td>");
		out.print("<td>"+dept+"</td>");
		out.print("<td>"+sphone+"</td>");
		out.print("<td>"+fname+"</td>");
		out.print("<td>"+fphone+"</td>");
		out.print("<td>"+mname+"</td>");
		out.print("<td>"+mphone+"</td>");
		out.print("<td>"+paddress+"</td>");
		out.print("<td>"+caddress+"</td>");
		out.print("<td>"+batch+"</td>");
		out.print("<td>"+semail+"</td>");
		out.print("<td>"+dob+"</td>");
		out.print("<td><img src='16WH1A0201.jpg'/></td>");
		
	out.print("</tr>");
	out.println("</table");
	out.print("<br/>");
	
	
	
  		
  	connection.close();
   %>