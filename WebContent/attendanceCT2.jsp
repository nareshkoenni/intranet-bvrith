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
 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
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
	Statement s = connection.createStatement();

	String abs[]= request.getParameterValues("absenties");
	HashSet absSet=new HashSet();
	
	String parentMobile=null;
	String studentName=null;
	java.util.Date d=new java.util.Date();
	SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
	String toDay=ft.format(d);
	String branch=(String)session.getAttribute("branch");
	for(int i=0;i<abs.length;i++){
		absSet.add(abs[i]);
	}
	
	String strMobileSet=null;
	HashSet mobileSet=new HashSet();
	for(int i=0;i<absSet.size();i++){
		
		rs=s.executeQuery("select  ParentMobileNumber, StudentName from studentsmobiledata where  UserName='"+abs[i]+"' ");
		if(rs.next()){
			mobileSet.add("+91"+rs.getString("ParentMobileNumber"));
			//studentName=rs.getString("StudentName");
			//out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+parentMobile+"&message=Dear Parent your ward("+studentName+") is absent for the day:"+toDay+"&senderid=BVRITH&accusage=1'</script>");
		} 
	}
	if(branch.equals("CSE")){
		mobileSet.add("+918885510777");
		mobileSet.add("+919989803310");
		strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
		out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message=Dear Parent your ward is absent for the day:"+toDay+"&senderid=BVRITH&accusage=1'</script>");
	}else if(branch.equals("EEE")){
		mobileSet.add("+919676124655");
		strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
		out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message=Dear Parent your ward is absent for the day:"+toDay+"&senderid=BVRITH&accusage=1'</script>");
		
	}else if(branch.equals("ECE")){
		mobileSet.add("+919848805545");
		strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
		out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message=Dear Parent your ward is absent for the day:"+toDay+"&senderid=BVRITH&accusage=1'</script>");
		
	}else if(branch.equals("IT")){
		mobileSet.add("+919553605898");
		strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
		out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message=Dear Parent your ward is absent for the day:"+toDay+"&senderid=BVRITH&accusage=1'</script>");
	}
	

	//out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+dummystr+"&message=Dear Parent your ward is absent for the day:"+toDay+"&senderid=BVRITH&accusage=1'</script>");
//	out.println(strMobileSet);
%>
	<script>
	//alert('SMS are sent Successfully Thank You');	
	//window.location = 'http://123.176.47.87:9000/intranet/viewAttendance.jsp';
			</script>
	
<% 
	

	connection.close();
	System.out.println("connection closed");
%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
