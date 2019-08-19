<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<body>
<head>

  
 
  <style type="text/css">
	#serviceBox
{
    width:100%;
    margin: 0 auto;
    margin-top:75px;
    
    border:;
    
}
.serviceBox1, .serviceBox2, .serviceBox3{
    float:left;
    width:8%;
   
    background-color: ;
}
</style>
</head>



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
	ResultSet rs1=null;
	
	connection = dataSource.getConnection();
	String branch=request.getParameter("branch").toUpperCase();
	String section=request.getParameter("section");
	String sem=request.getParameter("sem");
	String from=request.getParameter("from");
	String subject=request.getParameter("subject");
	
//	String to=request.getParameter("to");
	
	
	
    System.out.println("got connection from allocatedsubjects1 \t"+connection.getClass());
    Statement s=connection.createStatement();
    rs1=s.executeQuery("select distinct subject,period from attendance where date='"+from+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' ");
    
%>
<table align="center" border="2" style="border-style: dashed; background:aqua;">

<tr>

<th><%= branch%> - <%= sem%> - <%= section%> - <%=from %> - Absentees</th>
</tr>
</table>
<br>

<%
ArrayList periodList=new ArrayList();
ArrayList subjectList=new ArrayList();

while(rs1.next()){
	
	periodList.add(rs1.getString("period"));
	subjectList.add(rs1.getString("subject"));
}
//Iterator itr=periodSet.iterator();
for(int p=0;p<periodList.size();p++){
	
%>
  
 <table align="center" border="2" style="border-style: dashed; background:aqua;">
	
<tr>

<td align="center"><%=periodList.get(p) %>-<%=subjectList.get(p)%></td>
</tr>	
<%

rs=s.executeQuery("select rollNumber,topic from attendance where branch='"+branch+"'  and sem='"+sem+"' and date='"+from+"' and section='"+section+"' and period='"+periodList.get(p)+"' and attendance=0 order by rollNumber");

while(rs.next()){
	 %>
 	<tr> 
<td><%=rs.getString("rollNumber") %></td>
</tr>
 
 <%
 if(rs.isLast()){
	 %><tr> <td><%=rs.getString("topic") %></td>
 <% 
 } %></tr> <%
}
%>

</table>


<% 
}

connection.close();
System.out.println("connection closed");
%>

		

</body>