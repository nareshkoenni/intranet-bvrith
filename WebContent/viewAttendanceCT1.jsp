
<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<body>
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
   	width:12%;
    height: 250px; 
    background-color: ;
}
</style>
  <style>
         blink {
           color:red;
           -webkit-animation: blink 1s step-end infinite;
           animation: blink 1s step-end infinite
         }
 
          @-webkit-keyframes blink {
          67% { opacity: 0 }
         }
 
         @keyframes blink {
         67% { opacity: 0 }
        }
      </style>
</head>
<body>
<%@include file="header.jsp" %>
<!--<form name="absenteesCT" action="dummyAttendanceCT2.jsp"> -->
 <form name="absenteesCT" action="sendDayAttendanceSMS.jsp">  

<div class="single">
	<div class="container">
		<div class="single-grid">
		<h3 align="center" class="bars">Class Attendance</h3>



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
	ResultSet rs2=null,rs3=null;
	
	connection = dataSource.getConnection();
	String branch=request.getParameter("branch").toUpperCase();
	String section=request.getParameter("section");
	session.setAttribute("section", section);
	String sem=request.getParameter("sem");
	session.setAttribute("semister", sem);
	
	String from=request.getParameter("from");
	session.setAttribute("from", from);
//	String to=request.getParameter("to");

	session.setAttribute("branch",branch);
	ArrayList subjectList=new ArrayList();
	Statement s=connection.createStatement();
	rs2=s.executeQuery("select distinct subject from attendance where date='"+from+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' ");

	while(rs2.next()){
		
			 subjectList.add(rs2.getString("subject").trim());
		
	}
	
	
  //  System.out.println("got connection from allocatedsubjects1 \t"+connection.getClass());
    Statement s1=connection.createStatement();
    rs3=s1.executeQuery("select distinct period from attendance where date='"+from+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' ");
    ArrayList periodList=new ArrayList();
    while(rs3.next()){
    	
    	periodList.add(rs3.getString("period"));
//    	subjectList.add(rs1.getString("subject"));
    }
    rs1=s1.executeQuery("select distinct rollNumber from attendance where date='"+from+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' order by rollNumber");
    
%>

<table align="center" border="" style=" background:silver;">

<tr>

<th><%= branch%> - <%= sem%> - <%= section%> - <%=from %> - Absentees</th>
</tr>

</table>
	
	<div id="serviceBox" align="center"> 
	
	
<%

ArrayList rollList=new ArrayList();
ArrayList absList=new ArrayList();
while(rs1.next()){
	rollList.add(rs1.getString("rollNumber"));
	
}
//Iterator itr=periodSet.iterator();
System.out.println(rollList);
System.out.println(subjectList);

for(int i=0;i<subjectList.size();i++){
	%>
	
	<div class="serviceBox1">
	
	<table align="center" border="2" style="background:silver ;">
	<tr><td align="center"><%=subjectList.get(i)%></td></tr>
	<% 
	//out.println(i);
	rs=s.executeQuery("select distinct rollNumber from attendance where branch='"+branch+"' and sem='"+sem+"' and date='"+from+"' and section='"+section+"' and subject='"+subjectList.get(i)+"' and attendance=0 order by rollNumber");
		while(rs.next()){
		absList.add(rs.getString("rollNumber"));
	}
	for(int p=0;p<rollList.size();p++){
		//out.println(rollList.get(p));
			if(absList.size()==0){
			%>
			
			<tr><td><%=rollList.get(p) %><input type="checkbox" name="absenties" value="<%=rollList.get(p)%>" /></td></tr>
			
			<%	
			}
			for(int a=0;a<absList.size();a++){
		
		//	out.println((String)rollList.get(p)+"\t"+ rs.getString("rollNumber"));
				if(rollList.get(p).equals(absList.get(a))){
					
		 %>
		 	
		 	<tr> 
				<td><%=rollList.get(p) %><input type="checkbox" name="absenties" value="<%=rollList.get(p)%>" checked="checked"/></td>
			</tr>
		 
		 <%
				break;
				}else{ 
					if(a==absList.size()-1){
						 %>
						 	
						 	<tr> 
								<td><%=rollList.get(p) %><input type="checkbox" name="absenties" value="<%=rollList.get(p)%>" /></td>
							</tr>
						 
						 <%
					}
	
				}
			} 

	}
	absList.clear();
	%>
	
	</table>
	
	</div>
	
	<% 
}
connection.close();
System.out.println("connection closed");
%><br>

			<input type="submit" value="Send SMS" />
</div>

		</div>
		
	</div>

</div>
</form>
</body>