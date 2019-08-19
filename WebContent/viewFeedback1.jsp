<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<form action="viewFeedback2.jsp" method="POST">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500 height="95"></h1>
 <hr/>
 <h2  align="center" ><font style="color: green;">Feedback Analysis</font></h2>
 <table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
  <tr>
 
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
    System.out.println("got connection from viewfeedback1 \t"+connection.getClass());
    Statement s=connection.createStatement();
    
    String branch=request.getParameter("branch");
    String sem=request.getParameter("sem");
    session.setAttribute("sem",sem);
    
    rs=s.executeQuery("select distinct section from subjectallocation where branch='"+branch+"'and sem='"+sem+"' ");
    
    System.out.println(branch);
    
%>

 <td><input type="text" name="branch" value="<%=branch %>" /></td>
 <td><input type="text" name="sem" value="<%=sem%>" /></td>
 
 <td><select name='section'><option value='choose'>Choose Section</option>
 <%
 while(rs.next()){
 
 %>
 <option value='<%=rs.getString("section")%>'>
 <%=rs.getString("section")%>
 <%  } %>
  </option> 
  
  </select>
  </td>
    
 <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"><a href="adminHome.jsp">Home</a>  </td>
  </tr>
 
</table>	 
 </form>
 <%
 
 %>
<%
connection.close();
System.out.println("connection closed");
%>
