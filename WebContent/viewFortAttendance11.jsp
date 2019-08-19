<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>


<!-- <body style="background: silver;"> -->
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
    width:35%;
    margin: 0 auto;
    margin-top:75px;
    height:100%;
    border:;
    
}
.serviceBox1, .serviceBox2, .serviceBox3, .serviceBox4, .serviceBox5, .serviceBox6, .serviceBox7, .serviceBox8, .serviceBox9{
    float:left;
    width:8%;
    height: 100%; 
    background-color: ;
}
</style>
</head>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewFortAttendance1.jsp?uid=<%=uid%>" method="POST" name="attendance1">
 <h3 align="center" class="bars">FortNight Attendance</h3>
<table align="center" style="  height: 50px; width: 300px;">
 <tr>
 <td><input type="text" id="date" name="from" placeholder="from"  required="required" class="form-control"/></td>		
  <td><input type="text" id="date1" name="to" placeholder="to" required="required" class="form-control"/></td>		
   <td><select name='branch' class="btn btn-default dropdown-toggle"><option value=''>Select Branch</option><option value='cse'>CSE</option><option value='it'>IT</option><option value='ece'>ECE</option><option value='eee'>EEE</option> </select></td>
  <td>&nbsp;</td>
  <td>
  	<select name="sem" class="btn btn-default dropdown-toggle">
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
  		<td><select name="section" class="btn btn-default dropdown-toggle">
				<option value="section1">Section1</option>
				<option value="section2 ">Section2</option>
			</select></td>	
 
  <td align="center"><input type="submit" value="Go" /></td>
  
  
  </tr>
</table>	 
 
</form>


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
	ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs4=null,rs5=null,rs6=null,rs7=null,rs8=null,rs9=null;
	ArrayList rollList=new ArrayList();
	ArrayList subjectList=new ArrayList();
	ArrayList s1List=new ArrayList();
	ArrayList s2List=new ArrayList();
	ArrayList s3List=new ArrayList();
	ArrayList s4List=new ArrayList();
	ArrayList s5List=new ArrayList();
	ArrayList s6List=new ArrayList();
	ArrayList s7List=new ArrayList();
	ArrayList s8List=new ArrayList();
//ArrayList rList=new ArrayList();
	connection = dataSource.getConnection();
	String branch=request.getParameter("branch").toUpperCase();
	String section=request.getParameter("section");
	String sem=request.getParameter("sem");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	Statement statement=connection.createStatement();
	rs=statement.executeQuery("select distinct subject from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and attendance=1");
	while(rs.next()){
		subjectList.add(rs.getString("subject"));
	}
	if(subjectList.contains("Choose")){
		subjectList.remove("Choose");
	}
	System.out.println("Slist"+subjectList);
	rs9=statement.executeQuery("select distinct rollNumber from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and attendance=1 order by rollNumber");
	while(rs9.next()){
		rollList.add(rs9.getString("rollNumber") );
	}
%>
<div id="serviceBox" align="center"> 

	<table align="center" border="2" style="border-style: dashed; background:gray; ">
		<tr>
			<th><%= branch%> - <%= sem%> - <%= section%> - <%=from %> - <%=to %></th>
		</tr>
	</table>	

<% 
	//if(subjectList.size()==8 ){
	for(int r=0;r<rollList.size();r++){	
		rs1=statement.executeQuery("select SUM(attendance)  from attendance where  date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"'  and rollNumber='"+rollList.get(r)+"' and  subject ='"+subjectList.get(0)+"' group by subject");
		while(rs1.next()){
			s1List.add(rs1.getInt("sum(attendance)"));
		}
	}
	System.out.println("sub"+subjectList);
	System.out.println(s1List.size());
	for(int r=0;r<rollList.size();r++){	
		rs2=statement.executeQuery("select sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(1)+"' group by subject");
		while(rs2.next()){
			s2List.add(rs2.getInt("sum(attendance)"));
		}
	}
	try{
	for(int r=0;r<rollList.size();r++){	
		rs3=statement.executeQuery("select sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"'  and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(2)+"' group by subject");
		while(rs3.next()){
			s3List.add(rs3.getInt("sum(attendance)"));
		}
	}
	} catch(Exception e){}
	try{
	for(int r=0;r<rollList.size();r++){	
		rs4=statement.executeQuery("select sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(3)+"' group by subject");
		while(rs4.next()){
			s4List.add(rs4.getInt("sum(attendance)"));
		}
	}
	} catch(Exception e){}
	try{
	for(int r=0;r<rollList.size();r++){	
		rs5=statement.executeQuery("select sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(4)+"' group by subject");
		while(rs5.next()){
			s5List.add(rs5.getInt("sum(attendance)"));
		}
	}
} catch(Exception e){}
	try{
	for(int r=0;r<rollList.size();r++){	
		rs6=statement.executeQuery("select sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(5)+"' group by subject");
		while(rs6.next()){
			s6List.add(rs6.getInt("sum(attendance)"));
		}
	}
	} catch(Exception e){}
	try{	
		for(int r=0;r<rollList.size();r++){	
		rs7=statement.executeQuery("select sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"'  and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(6)+"' group by subject");
		while(rs7.next()){
			s7List.add(rs7.getInt("sum(attendance)"));
		}
		}
	} catch(Exception e){}
	try{
	
	for(int r=0;r<rollList.size();r++){	
		rs8=statement.executeQuery("select sum(attendance) from attendance where date>='"+from+"' and date<='"+to+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and rollNumber='"+rollList.get(r)+"' and subject ='"+subjectList.get(7)+"' group by subject");
		while(rs8.next()){
			s8List.add(rs8.getInt("sum(attendance)"));
		}
	}
	} catch(Exception e){}
	
%>

<table align="center"  border="2" style="height: 100%;" > 
<tr>
 <th>Roll Number</th>
<%  
	int s1max = (Integer)s1List.get(0);
	for(int i = 0; i < s1List.size(); i++) {
    	int number1 = (Integer)s1List.get(i);
   	 if(number1 > s1max) s1max = number1;
	} 
   	 
   	int s2max = (Integer)s2List.get(0);
	for(int i = 0; i < s2List.size(); i++) {
    	int number2 = (Integer)s2List.get(i);
   	 if(number2 > s2max) s2max = number2;
	}
   	 
   	int s3max = (Integer)s3List.get(0);
	for(int i = 0; i < s3List.size(); i++) {
    	int number3 = (Integer)s3List.get(i);
   	 if(number3 > s3max) s3max = number3;
	}
   	 
   	int s4max = (Integer)s4List.get(0);
	for(int i = 0; i < s4List.size(); i++) {
    	int number4 = (Integer)s4List.get(i);
   	 if(number4 > s4max) s4max = number4;
	}
   	 
   	int s5max = (Integer)s5List.get(0);
	for(int i = 0; i < s5List.size(); i++) {
    	int number5 = (Integer)s5List.get(i);
   	 if(number5 > s5max) s5max = number5;
	}
	
	int s6max = (Integer)s6List.get(0);
	for(int i = 0; i < s6List.size(); i++) {
    	int number6 = (Integer)s6List.get(i);
   	 if(number6 > s6max) s6max = number6;
	}
	
	int s7max = (Integer)s7List.get(0);
	for(int i = 0; i < s7List.size(); i++) {
    	int number7 = (Integer)s7List.get(i);
   	 if(number7 > s7max) s7max = number7;
	}
	
	int s8max = (Integer)s8List.get(0);
	for(int i = 0; i < s8List.size(); i++) {
    	int number8 = (Integer)s8List.get(i);
   	 if(number8 > s8max) s8max = number8;
	}
	

%>
 <th><%=subjectList.get(0) %>(<%=s1max%>)</th>
 <th><%=subjectList.get(1) %>(<%=s2max%>)</th>
 <% try{ %><th><%=subjectList.get(2) %>(<%=s3max%>)</th><%}catch(Exception e){}%>
 <% try{ %><th><%=subjectList.get(3) %>(<%=s4max%>)</th><%}catch(Exception e){}%>
 <% try{ %><th><%=subjectList.get(4) %>(<%=s5max%>)</th><%}catch(Exception e){}%>
 <% try{ %><th><%=subjectList.get(5) %>(<%=s6max%>)</th><%}catch(Exception e){}%>
 <% try{ %><th><%=subjectList.get(6) %>(<%=s7max%>)</th><%}catch(Exception e){}%>
 <% try{ %><th><%=subjectList.get(7) %>(<%=s8max%>)</th><%}catch(Exception e){}%>
 
 </tr>
 <tr>
 <td>
 <div class="serviceBox1">
 <%
 
for(int i=0;i<rollList.size();i++){
		out.println(rollList.get(i));
	}
 %>
 
</div>
</td>
<td>
  <div class="serviceBox2">
 <%
for(int i=0;i<s1List.size();i++){
		out.println(s1List.get(i)+"<br>");
	}
 %>
</div>
</td>
<td>
 <div class="serviceBox3">
 <%
for(int i=0;i<s2List.size();i++){
		out.println(s2List.get(i)+"<br>");
	}
 %>
</div>
</td>
<td>

 <div class="serviceBox4">
 <%
for(int i=0;i<s3List.size();i++){
		out.println(s3List.get(i)+"<br>");
	}
 %>
</div>
</td>
<td>
 <div class="serviceBox5">
 <%
for(int i=0;i<s4List.size();i++){
		out.println(s4List.get(i)+"<br>");
	}
 %>
</div>
</td>
<td>
 <div class="serviceBox6">
 <%
for(int i=0;i<s5List.size();i++){
		out.println(s5List.get(i)+"<br>");
	}
 %>
</div>
</td>
<td>
 <div class="serviceBox7">
 <%
for(int i=0;i<s6List.size();i++){
		out.println(s6List.get(i)+"<br>");
	}
 %>
</div>
</td>
<td>
  <div class="serviceBox8">
 <%
for(int i=0;i<s7List.size();i++){
		out.println(s7List.get(i)+"<br>");
	}
 %>
</div>
</td>
<td>
  <div class="serviceBox9">
 <%
for(int i=0;i<s8List.size();i++){
		out.println(s8List.get(i)+"<br>");
	}
	//}else{
//		out.println("<script>alert('Attendance was not given to all subjects');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/viewFortAttendance.jsp?uid="+uid+"'</script>"); 
		
//	}
 %>
</div>
</td>
 </tr> 			 	
</table>
</div>
</div>

		</div>
		
	</div>
		
</div>
<%connection.close(); %>
