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
DiskFileItemFactory factory = new DiskFileItemFactory();
String contextRoot = request.getServletContext().getContextPath();
contextRoot="D:\\testupload"+contextRoot;
factory.setRepository(new File(contextRoot));
ServletFileUpload upload = new ServletFileUpload(factory);
System.out.println("path"+contextRoot);   
String fileName=null;
File saveFile=null;
try {
    List<FileItem> items = upload.parseRequest(request);
    for (FileItem item : items) {  
    	
        if (!item.isFormField()) {
           
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
        if(item.isFormField()){
        	String title=request.getParameter("projname");
        	System.out.println("proj title"+title);

        }
     /*  if(item.isFormField()){
        	if(item.getFieldName().equals("message")){
        		message=item.getString();
        	}
        }  */
    
    }
    
    } catch (Exception e) {
    try {
        throw new ServletException("Cannot parse multipart request.", e);
    } catch (ServletException e1) {
        // TODO Auto-generated catch block
        e1.printStackTrace();
    }
}
	


out.println("<script>alert('Uploaded Sussessfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/testupload.jsp?uid="+uid+"'</script>");
%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
