<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<%@ page import="java.text.* " %>
<%@ page import="java.net.*" %>


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
  <script type="text/javascript">
  function f1(){
		var check=confirm("It needs Internet to send SMS? Cancel for Internet Login or OK to go");
		if(check==true){
		}else{
			//alert('Click on OK for Internet Connection');
			window.location = 'http://192.168.1.1:8090/httpclient.html';
			
		}
	}
  f1();
  
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
 
</head>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		



<%! private DataSource dataSource;
private DataSource dataSource1;
 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
        dataSource1 = (DataSource)envContext.lookup("jdbc/mysql");
        System.out.println(dataSource);
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>
<%
	//response.setContentType("text/html");
//response.setContentType("text/html");
Connection connection=null, connection1=null;



connection = dataSource.getConnection();
Statement s = connection.createStatement();
connection1 = dataSource1.getConnection();
Statement s1 = connection1.createStatement();
ResultSet rs=null,rs3=null;

String abs[]= request.getParameterValues("absenties");
HashSet absSet=new HashSet();

java.util.Date d=new java.util.Date();
SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
String toDay=ft.format(d);
String branch=(String)session.getAttribute("branch");
for(int i=0;i<abs.length;i++){
	absSet.add(abs[i]);
}
ArrayList absList=new ArrayList();
absList.addAll(absSet);
String strMobileSet=null;


String from =(String)session.getAttribute("from");
String section =(String)session.getAttribute("section");
String semister =(String)session.getAttribute("semister");


String message=null,message1=null;
String parentMobile=null;
String studentName=null;

ArrayList periodList=new ArrayList();
for(int i=0;i<absList.size();i++){
	rs3=s1.executeQuery("select  distinct period from attendance where rollNumber='"+absList.get(i)+"' and date='"+from.trim()+"' and attendance=0 ");
	//System.out.println("select  distinct period from attendance where rollNumber='15wh1a0532' and date='"+from.trim()+"'");
	while(rs3.next()){
		periodList.add(rs3.getString("period"));    
	}
	Collections.sort(periodList);
	rs=s.executeQuery("select  ParentMobileNumber, StudentName from studentsmobiledata where  UserName='"+absList.get(i)+"' ");
	if(rs.next()){
		studentName=rs.getString("StudentName").trim();
		parentMobile=rs.getString("ParentMobileNumber").trim();
	} 
	message= "http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+parentMobile+"&message=Dear Parent your ward("+studentName+") is absent for periods:"+periodList+" on:"+toDay+"&senderid=BVRITH&accusage=1";
message1= "http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile=9989803310&message=Dear Parent your ward(abc) is absent for periods:"+periodList+" on:"+toDay+"&senderid=BVRITH&accusage=1";
	
	System.out.println(i+"."+message);
	
	%>
	 
	<script>
	
		var request = new XMLHttpRequest();
		try{  
			request.open("GET","<%=message%>",true);    
			request.send();   
		}catch(e){
			alert("Unable to connect to server"); 
			alert(e.toString());
		}  
		
	</script> 
	<% 
	periodList.clear();
 }
if(branch.equals("CSE")){ 
%>
<script>
		var request1 = new XMLHttpRequest();
		try{  
			request1.open("GET","http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile=9989803310,9553202023&message=SMS from intranet for<%=semister%>-<%=section%> on<%=toDay%>and absent count is<%=absList.size()%> &senderid=BVRITH&accusage=1",true);    
			request1.send();   
		}catch(e){
			alert("Unable to connect to server"); 
			alert(e.toString());
		}  
	
	</script>
<%
}
out.println("<script>alert('Sent Successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/viewAttendanceCT.jsp?uid="+uid+"'</script>");
	connection.close();
	System.out.println("connection closed");
%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
