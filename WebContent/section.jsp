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
	ResultSet  rs=null;
	connection = dataSource.getConnection();
    System.out.println("got connection from cse subject allocation \t"+connection.getClass());
    Statement s=connection.createStatement();
    String section =(String)session.getAttribute("section");
    System.out.println(section);
    rs=s.executeQuery("select distinct subjectid,section,tid,tname from subjectallocation  where section='"+section+"' ");
%>

<form action="feedback1.jsp" method="POST">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500 height="95"></h1>
 <hr/>
 <h2  align="center" ><font style="color: green;">STUDENT FEEDBACK FORM</font></h2>
 <table align="center" style="border-style: dashed; background: silver; height: 150px; width: 300px;">
 <tr>
 
 <td><select name='subject'><option value='choose'>Choose Subject</option>
 <%
 while(rs.next()){
%>
 <option value='<%=rs.getString("subjectid")%>'>
 <%=rs.getString("subjectid")%>
 <%  } %>
  </option> 
  
  </select>
  </td>
<td></td>    
 </tr>
 <tr>
<td align="center"><a href="studentHome.jsp">Back</a></td>
<td align="center"><input type="submit" value="Submit" /></td>
</tr>
</table>	 
 
</form>
<%
connection.close();

System.out.println("connection closed");

%>
