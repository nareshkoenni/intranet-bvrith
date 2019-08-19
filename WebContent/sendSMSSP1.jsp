<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<%@ page import="java.text.* " %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>


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
	
	
	connection = dataSource.getConnection();
	
	Statement s = connection.createStatement();

	String category= request.getParameter("category");
	String branch= request.getParameter("branch");
	String section= request.getParameter("section");
	String year= request.getParameter("year");
	String message= request.getParameter("message").trim();
	
	
	java.util.Date d=new java.util.Date();
	SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
	String toDay=ft.format(d);
	 ResourceBundle rb1 = ResourceBundle.getBundle("s.acyear");
     String batch=rb1.getString(year);
	
	ArrayList rollList=new ArrayList();

	//rs1=s.executeQuery("select ")
	if(category.equals("student")){
		//rs=s.executeQuery("select distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"' ");
		if(section.equals("all")){
			ResultSet rs=s.executeQuery("select  distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"' ");
			System.out.println("select  distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"'");
			while(rs.next()){
				rollList.add(rs.getString("Username"));
			}
		}else{
			ResultSet rs=s.executeQuery("select  distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"' and role='"+section+"'");
			while(rs.next()){
				rollList.add(rs.getString("Username"));
			}	
		}
		for(int i=0; i<rollList.size();i++){
			ResultSet rs=s.executeQuery("select  distinct MobileNumber from studentsmobiledata  where username='"+rollList.get(i)+"' ");
			if(rs.next()){
				//mobileSet.add("+91"+rs.getString("MobileNumber"));
				String studentMobile=rs.getString("MobileNumber");
				//Your user name
			    String username = "BVRITH";
			    //Your authentication key
			    String authkey = "258f8ca44bXX";
			    //Sender ID,While using route4 sender id should be 6 characters long.
			    String senderId = "BVRITH";
			    //define route
			    String accusage="1";
			    //Prepare Url
			    URLConnection myURLConnection=null;
			    URL myURL=null;
			    //BufferedReader reader=null;
			    //encoding message
			    String encoded_message=URLEncoder.encode(message);
			    //Send SMS API
			    String mainUrl="http://www.webprossms.webprosindia.com/submitsms.jsp?";
			    //Prepare parameter string
			    StringBuilder sbPostData= new StringBuilder(mainUrl);
			    sbPostData.append("user="+username);
			    sbPostData.append("&key="+authkey);
			    sbPostData.append("&mobile="+studentMobile);
			    sbPostData.append("&message="+encoded_message);
			    sbPostData.append("&accusage="+accusage);
			    sbPostData.append("&senderid="+senderId);
			    //final string
			    mainUrl = sbPostData.toString();
			    try
			    {
			    //prepare connection
				    myURL = new URL(mainUrl);
				    myURLConnection = myURL.openConnection();
				    myURLConnection.connect();
				    Scanner reader1=new Scanner(new InputStreamReader(myURLConnection.getInputStream()));
				    String resp=reader1.next();
				   System.out.println(resp);
				    PreparedStatement ps=connection.prepareStatement("insert into smsReport(rollNumber,message,parentMobile,messageStatus,deliveryDate) values(?,?,?,?,?)");
				   	ps.setString(1, (String)rollList.get(i));
				   	ps.setString(2, message);
				   	ps.setString(3, studentMobile);
				   	ps.setString(4, resp);
				   	ps.setString(5, toDay);
				    ps.executeUpdate();
					reader1.close();
				}catch (Exception e){
			    	e.printStackTrace();
			    }
			}
		}	 
				out.println("<script>alert('Sent Successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/sendSMSSP.jsp?uid="+uid+"'</script>");
				connection.close();
				System.out.println("connection closed");

			
			//mobileSet.add(rs.getString("Username"));
			 
		
		//strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
		//out.println(mobileSet.size());
		//out.println(strMobileSet);
		//out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
		//out.println(message);
		rollList.clear();
	//	mobileSet.clear();
		
	}else if(category.equals("parent")){
		//rs=s.executeQuery("select distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"' ");
		if(section.equals("all")){
			ResultSet rs=s.executeQuery("select  distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"' ");
			System.out.println("select  distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"'");
			while(rs.next()){
				rollList.add(rs.getString("Username"));
			}
		}else{
			ResultSet rs=s.executeQuery("select  distinct Username  from logindetails  where  Year='"+year+"' and Dept='"+branch+"' and batch='"+batch+"' and role='"+section+"'");
			while(rs.next()){
				rollList.add(rs.getString("Username"));
			}	
		}
		for(int i=0; i<rollList.size();i++){
			ResultSet rs=s.executeQuery("select  distinct ParentMobileNumber from studentsmobiledata  where username='"+rollList.get(i)+"' ");
			if(rs.next()){
				//mobileSet.add("+91"+rs.getString("MobileNumber"));
				String parentMobile=rs.getString("ParentMobileNumber");
				//Your user name
			    String username = "BVRITH";
			    //Your authentication key
			    String authkey = "258f8ca44bXX";
			    //Sender ID,While using route4 sender id should be 6 characters long.
			    String senderId = "BVRITH";
			    //define route
			    String accusage="1";
			    //Prepare Url
			    URLConnection myURLConnection=null;
			    URL myURL=null;
			    //BufferedReader reader=null;
			    //encoding message
			    String encoded_message=URLEncoder.encode(message);
			    //Send SMS API
			    String mainUrl="http://www.webprossms.webprosindia.com/submitsms.jsp?";
			    //Prepare parameter string
			    StringBuilder sbPostData= new StringBuilder(mainUrl);
			    sbPostData.append("user="+username);
			    sbPostData.append("&key="+authkey);
			    sbPostData.append("&mobile="+parentMobile);
			    sbPostData.append("&message="+encoded_message);
			    sbPostData.append("&accusage="+accusage);
			    sbPostData.append("&senderid="+senderId);
			    //final string
			    mainUrl = sbPostData.toString();
			    try
			    {
			    //prepare connection
				    myURL = new URL(mainUrl);
				    myURLConnection = myURL.openConnection();
				    myURLConnection.connect();
				    Scanner reader1=new Scanner(new InputStreamReader(myURLConnection.getInputStream()));
				    String resp=reader1.next();
				    System.out.println(resp);
				    PreparedStatement ps=connection.prepareStatement("insert into smsReport(rollNumber,message,parentMobile,messageStatus,deliveryDate) values(?,?,?,?,?)");
				   	ps.setString(1, (String)rollList.get(i));
				   	ps.setString(2, message);
				   	ps.setString(3, parentMobile);
				   	ps.setString(4, resp);
				   	ps.setString(5, toDay);
				    ps.executeUpdate();
					reader1.close();
				}catch (Exception e){
			    	e.printStackTrace();
			    }
			}
		}	 
				out.println("<script>alert('Sent Successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/sendSMSSP.jsp?uid="+uid+"'</script>");
				connection.close();
				System.out.println("connection closed");
				rollList.clear();
	}
%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
