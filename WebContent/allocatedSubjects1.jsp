<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<body>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/allocatedSubjects1.jsp?uid=<%=uid%>" method="">

 <table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
  <tr>
  <td><select name='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
 <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"> </td>
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
	if(branch==null){
		branch=(String)session.getAttribute("branch");
	}
    System.out.println("got connection from allocatedsubjects1 \t"+connection.getClass());
    Statement s=connection.createStatement();
    rs=s.executeQuery("select *from subjectallocation where branch='"+branch+"' ");
%>
<h3 align="center" class="bars">List of Assigned Subjects</h3><br/>
<table align="center" border="2" style="border-style: dashed; background: silver; height: 200px; width: 800px;">

<tr>
<th>Sem</th><th>Section</th><th>Subject ID</th><th>Faculty</th><th>A.Y</th>
</tr>

<%    
    while(rs.next()){
    	
    %>
 <tr><td align="center"><%=rs.getString("sem") %></td><td align="center"><%=rs.getString("section")%></td><td align="center"><%=rs.getString("subjectid") %></td><td align="center"><%=rs.getString("tid") %></td><td align="center"><%=rs.getString("acyear") %></td><td align="center"><a href="update.jsp?subjectId=<%=rs.getString("subjectid") %>&section=<%=rs.getString("section") %>&tid=<%=rs.getString("tid")%>&sem=<%=rs.getString("sem") %>&branch=<%=rs.getString("branch") %>">update</a></td></tr>

 <%
 }
connection.close();
System.out.println("connection closed");
%>

 </table>
</div>
		</div>
	</div>
</div>
<%@include file="footer.html" %>
</body>