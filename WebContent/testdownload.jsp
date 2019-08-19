<%@ page import="java.io.*" %>
<%
	 File directory = new File("D:\\testupload/intranet");
        //get all the files from a directory
        File[] fList = directory.listFiles();
        for (File file : fList){
            if (file.isFile()){
            	String fname=file.getName();
                out.println("<a href='testdownload1.jsp?fn="+fname+"'>"+fname+"</a>"+"<br/>");
            }
        }
%>