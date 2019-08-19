<%@page import="java.math.BigDecimal"%>
<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<form action="viewFeedback1.jsp" method="POST">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500 height="95"></h1>
 <hr/>
 <h2  align="center" ><font style="color: green;">Feedback Analysis</font></h2>
 <table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
  <tr>
  <td><select name='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
  <td><select name="sem" >
				<option value="1/4Sem-I">1/4Sem-I</option>
				<option value="1/4Sem-II">1/4Sem-II</option>
				<option value="2/4Sem-I">2/4Sem-I</option>
				<option value="2/4Sem-II">2/4Sem-II</option>
				<option value="3/4Sem-I">3/4Sem-I</option>
				<option value="3/4Sem-II">3/4Sem-II</option>
				<option value="4/4Sem-I">4/4Sem-I</option>
				<option value="4/4Sem-II">4/4Sem-II</option>
			
			
			</select></td>	
 <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"><a href="adminHome.jsp">Home</a>  </td>
  </tr>
</table>	 
</form>
<hr/>

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
	connection = dataSource.getConnection();
	String branch=request.getParameter("branch");
	String section=request.getParameter("section");
    System.out.println(branch+"\t"+section);
	
    System.out.println("got connection from viewfeedback2 \t"+connection.getClass());
    Statement s=connection.createStatement();
    rs=s.executeQuery("select teacherid,subject,count(p1), avg(p1),avg(p2),avg(p3),avg(p4),avg(p5),avg(p6),avg(p7),avg(p8),avg(p9),avg(p10) from feedback where branch='"+branch+"' and section='"+section+"' group by teacherid");
%>
<table align="center" border="2" style="border-style: dashed; background: silver; height: 200px; width: 800px;">
<tr><th colspan="14" align="center"><%=branch%>-<%=session.getAttribute("sem")%>-<%=section %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=new java.util.Date() %> </th></tr>
<tr>
<th>Faculty</th><th>Subject</th><th>Strength</th><th>p1</th><th>p2</th><th>p3</th><th>p4</th><th>p5</th><th>p6</th><th>p7</th><th>p8</th><th>p9</th><th>p10</th><th>Total</th>
</tr>

<%    
    while(rs.next()){
    	double p1=rs.getDouble("avg(p1)");
    	double p2=rs.getDouble("avg(p2)");
    	double p3=rs.getDouble("avg(p3)");
    	double p4=rs.getDouble("avg(p4)");
    	double p5=rs.getDouble("avg(p5)");
    	double p6=rs.getDouble("avg(p6)");
    	double p7=rs.getDouble("avg(p7)");
    	double p8=rs.getDouble("avg(p8)");
    	double p9=rs.getDouble("avg(p9)");
    	double p10=rs.getDouble("avg(p10)");

  //  	System.out.println(p1+"\t"+p2);
    	
    %>
 <tr><th><%=rs.getString("teacherid") %></th><th><%=rs.getString("subject") %></th><th><%=rs.getString("count(p1)") %></th><th><%=p1 %></th><th><%=p2 %></th><th><%=p3 %></th><th><%=p4 %></th><th><%=p5 %></th><th><%=p6 %></th><th><%=p7 %></th><th><%=p8 %></th><th><%=p9 %></th><th><%=p10 %></th><th><%=(p1+p2+p3+p4+p5+p6+p7+p8+p9+p10)/10 %></th>
 </tr>
 <%
 }
connection.close();
System.out.println("connection closed");
%>

 </table>

