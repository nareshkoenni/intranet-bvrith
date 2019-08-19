<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<body style="background: silver;">
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#date").datepicker();
  });
  $(document).ready(function() {
	    $("#date1").datepicker();
  });
  
  $(document).ready(function(){
	    $("select.sem").change(function(){
	        var selectedSem = $(".sem option:selected").val();
	        
	    });
	});
  </script>
  <style type="text/css">
	#serviceBox
{
    width:100%;
    margin: 0 auto;
    margin-top:75px;
    height:250px;
    border:;
    
}
.serviceBox1, .serviceBox2, .serviceBox3{
    float:left;
    width:10%;
    height: 250px; 
    background-color: ;
}
</style>
</head>

<form action="viewAttendance1.jsp" method="POST">
 <h2  align="center" ><font style="color: green;">Class Attendance</font></h2>
<table align="center" style="border-style: dashed; background: silver; height: 50px; width: 300px;">
 <tr>
 <td><input type="text" id="date" name="from" value="from"/></td>		
  <td><input type="text" id="date1" name="to" value="to"/></td>		
   <td><select name='branch'><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
  <td>&nbsp;</td>
  <td>
  	<select name="sem" >
				<option value="1/4Sem-I">1/4Sem-I</option>
				<option value="1/4Sem-II">1/4Sem-II</option>
				<option value="2/4Sem-I">2/4Sem-I</option>
				<option value="2/4Sem-II">2/4Sem-II</option>
				<option value="3/4Sem-I">3/4Sem-I</option>
				<option value="3/4Sem-II">3/4Sem-II</option>
				<option value="4/4Sem-I">4/4Sem-I</option>
				<option value="4/4Sem-II">4/4Sem-II</option>
			
			
			</select>
  </td>
  		<td><select name="section">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>	
 
  <td align="center"><input type="submit" value="Go" /></td>
  
  <td></td><td align="center"><a href="teacherHome.jsp">Home</a>  </td>
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
	ResultSet rs1=null;
	
	connection = dataSource.getConnection();
	String branch=request.getParameter("branch").toUpperCase();
	String section=request.getParameter("section");
	String sem=request.getParameter("sem");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	
	
	
    System.out.println("got connection from allocatedsubjects1 \t"+connection.getClass());
    Statement s=connection.createStatement();
    rs1=s.executeQuery("select distinct subject,period from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' ");
    
%>
<table align="center" border="2" style="border-style: dashed; background:gray;">

<tr>

<th><%= branch%> - <%= sem%> - <%= section%> - <%=from %> - <%=to %></th>
</tr>
</table>
<div id="serviceBox" align="center"> 

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
   <div class="serviceBox1">
 <table align="center" border="2" style="border-style: dashed; background:gray ;">
	
<tr>

<td align="center"><%=periodList.get(p) %>-<%=subjectList.get(p) %></td>
</tr>	
<%

rs=s.executeQuery("select *from attendance where branch='"+branch+"' and sem='"+sem+"' and date>='"+from+"' and date<='"+to+"' and section='"+section+"' and period='"+periodList.get(p)+"' and attendance=1");

while(rs.next()){
	 %>
 	<tr> 
<td><%=rs.getString("rollNumber") %></td>
</tr>
 
 <%
}
%>
</table>
</div>
<% 
}

connection.close();
System.out.println("connection closed");
%>
</div>
</body>