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


String branch=(String)session.getAttribute("branch");
for(int i=0;i<abs.length;i++){
	absSet.add(abs[i]);
}
ArrayList absList=new ArrayList();
absList.addAll(absSet);
String strMobileSet=null;

String section =(String)session.getAttribute("section");
String semister =(String)session.getAttribute("sem");

String message=request.getParameter("message").trim();
String parentMobile=null;
String studentName=null;
java.util.Date d=new java.util.Date();
SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
String toDay=ft.format(d);

for(int i=0;i<absList.size();i++){
	rs=s.executeQuery("select  ParentMobileNumber from studentsmobiledata where  UserName='"+absList.get(i)+"' ");
	if(rs.next()){
		parentMobile=rs.getString("ParentMobileNumber").trim();
	} 
	//Your user name
    String username = "BVRITH";
    //Your authentication key
    String authkey = "258f8ca44bXX";
    //Sender ID,While using route4 sender id should be 6 characters long.
    String senderId = "BVRITH";
    //Your message to send, Add URL encoding here.
    //define route
    String accusage="1";
    //Prepare Url
    URLConnection myURLConnection=null;
    URL myURL=null;
   // BufferedReader reader=null;
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
    PreparedStatement ps=connection.prepareStatement("insert into smsReport(rollNumber,message,parentMobile,messageStatus,deliveryDate) values(?,?,?,?,?)");
   	ps.setString(1, (String)absList.get(i));
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
	out.println("<script>alert('Sent Successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/sendASMS.jsp?uid="+uid+"'</script>");
	connection.close();
	System.out.println("connection closed");
%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
