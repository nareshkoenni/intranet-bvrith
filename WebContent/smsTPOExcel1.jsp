<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<%@ page import="java.text.* " %>
<%@ page import="java.net.*" %>
<%@ page import="s.ReadSMSExcel1" %>
<%@ page import="s.ReadSMSExcel1" %>
<%@ page import="java.io.* " %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>

<%@ page import="org.apache.commons.fileupload.FileUploadException" %>

<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>

<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>



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
Connection connection=null;
response.setContentType("text/html");
ResultSet resultSet = null;
ArrayList mobileList=null;
ArrayList smsList=null;
//String fname=request.getParameter("fname");
// FileInputStream f=new FileInputStream(new File(fname).getAbsoluteFile());
//System.out.println("hello"+fname);       
DiskFileItemFactory factory = new DiskFileItemFactory();
String contextRoot = request.getServletContext().getContextPath();
contextRoot="D:\\SOftwares"+contextRoot;
factory.setRepository(new File(contextRoot));
ServletFileUpload upload = new ServletFileUpload(factory);
System.out.println("path"+contextRoot);   
String fileName=null;
File saveFile=null;
try {
    List<FileItem> items = upload.parseRequest(request);
    for (FileItem item : items) {  
        if (!item.isFormField()) {
            // Process form file field (input type="file").
            //System.out.println("Field name: " + item.getFieldName());
            //System.out.println("File name: " + item.getName());
            //System.out.println("File size: " + item.getSize());
            //System.out.println("File type: " + item.getContentType());

            fileName = item.getName();
            System.out.println(contextRoot+"//"+fileName);
            try {
            	saveFile = new File(contextRoot+"//"+fileName);
                saveFile.createNewFile();
                item.write(saveFile);
                
                
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();   
            }
        }
     /*  if(item.isFormField()){
        	if(item.getFieldName().equals("message")){
        		message=item.getString();
        	}
        }  */
    
    }
    mobileList=ReadSMSExcel1.readRollList(contextRoot+"//"+fileName);
    smsList=ReadSMSExcel1.readRollList1(contextRoot+"//"+fileName);
    
    saveFile.delete();
    } catch (Exception e) {
    try {
        throw new ServletException("Cannot parse multipart request.", e);
    } catch (ServletException e1) {
        // TODO Auto-generated catch block
        e1.printStackTrace();
    }
}
	
try {   
 // Get Connection and Statement
	
	connection = dataSource.getConnection();
   String message=null;
    String strMobileList=mobileList.toString().replace("[", "").replace("]", "").replace(", ", ",");
    
    
    System.out.println(strMobileList); 
    
	//out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileList+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
	for(int i=0;i<mobileList.size();i++){
    	message= "http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+mobileList.get(i)+"&message="+smsList.get(i)+"&senderid=BVRITH&accusage=1";
    	System.out.println(message);
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
	}
    
}catch (SQLException e) {
		e.printStackTrace();
		System.out.println("not able to get the connection in SMSExcelTPOServlet");
}finally{    
		try{
				connection.close();
				System.out.println("connection closed");
		}				  
		catch(Exception e){}

}

out.println("<script>alert('Sent Successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/sendSMSExcel.jsp?uid="+uid+"'</script>");
	connection.close();
	System.out.println("connection closed");
%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
