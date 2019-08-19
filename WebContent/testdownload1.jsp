<%@ page import="java.io.*" %>
<%
	response.setContentType("text/html");  
	 
	String filename = request.getParameter("fn");   
	String filepath = "D:\\testupload/intranet/";   
	response.setContentType("APPLICATION/OCTET-STREAM");   
	response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
	  
	FileInputStream fileInputStream = new FileInputStream(filepath + filename);  
            
	int i;   
	while ((i=fileInputStream.read()) != -1) {  
		out.write(i);   
	}   
	fileInputStream.close();   
	out.close();
%>