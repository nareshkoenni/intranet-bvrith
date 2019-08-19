<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<%! private DataSource dataSource,dataSource1;

 %>
 
<%!
public void jspInit(){
    try {
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
        dataSource1 = (DataSource)envContext.lookup("jdbc/testmysql");
        
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>
<%@include file="studentHeader.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
	<h3 align="center" class="bars">Library Profile</h3><br>
	

<%
	//response.setContentType("text/html
	Connection connection=null,connection1=null;
	ResultSet rs=null,rs1=null,rs2=null;
	response.setContentType("text/html");
	connection = dataSource.getConnection();
	Statement s=connection.createStatement();
	connection1 = dataSource1.getConnection();
	Statement s1=connection1.createStatement();
	if(rollnumber.contains(".p")){
		String rn[]=rollnumber.split("\\.",2);
		rollnumber=rn[0];
	}
  	rs1=s1.executeQuery("select Dept  from LoginDetails  where  Username='"+rollnumber+"'"); 
  	String dept=null;
 	while(rs1.next()){
 		dept=rs1.getString("Dept");
 	}
 rs=s.executeQuery("select * from book_issue where  user='"+rollnumber+"' and status='issue'"); 
  %>
  	<table border='1' align='center'>
  	<tr><th >Name</th><td  colspan='3'><%=rollnumber %></td></tr>
  	<tr><th>Dept</th><td  colspan='3'><%=dept %></td></tr>
  	<tr><th align="center">Acc Num</th><th align='center'>Title</th><th align="center">Issue Date</th><th align="center">Penalty</th></tr>
  	<% 
  		int count=0;
  		while(rs.next()){ count++;%>
  		<tr>
  	
  		<td align="center"><%=rs.getString("accnum")%></td>
  		<td align="center"><%=rs.getString("title")%></td>
  		<td align="center"><%=rs.getString("from_date")%></td>
  		<td align="center"><%=rs.getString("penalty")%></td>
  		</tr>
  	<% }
  	if(count==0){
  		out.println("<tr><td align='center' colspan='4'>No books are taken</td></tr>");
  	}
  	%>
  	</table>
  	<%
  	connection.close();connection1.close();%>
  	</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>