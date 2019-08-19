<%@page import="org.eclipse.jdt.internal.compiler.ast.ThisReference"%>
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


java.util.Date d=new java.util.Date();
SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
String toDay=ft.format(d);


ArrayList mobList=new ArrayList();
mobList.add("9989803310");
mobList.add("7799999843");
mobList.add("7799999573");

String strMobileSet=null;




String message=null,message1=null;
String parentMobile=null;
String studentName=null;

ArrayList periodList=new ArrayList();
for(int i=0;i<mobList.size();i++){
	/*rs3=s1.executeQuery("select  distinct period from attendance where rollNumber='"+absList.get(i)+"' and date='"+from.trim()+"' and attendance=0 ");
	//System.out.println("select  distinct period from attendance where rollNumber='15wh1a0532' and date='"+from.trim()+"'");
	while(rs3.next()){
		periodList.add(rs3.getString("period"));    
	}
	Collections.sort(periodList);
	*/
	message= "http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+mobList.get(i)+"&message=Dear Parent your ward("+studentName+") is absent for periods:"+periodList+" on:"+toDay+"&senderid=BVRITH&accusage=1";
	
	System.out.println(i+"."+message);
	
	%>
	 <div id="demo"></div>
	<script>
	//alert("hi");
		
		var request = new XMLHttpRequest();
			request.onreadystatechange=function(){
			if(this.readyState == 4 && this.status == 200){
					document.getElementById("demo").innerHTML=this.responseText;
				}
			};
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


%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
