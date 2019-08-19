package s;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
public class SMSExcelTPOServlet extends HttpServlet {
     
    private DataSource dataSource;
    static String message;
    
    public void init() throws ServletException {
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
    int count;
    
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	PrintWriter out=response.getWriter();
        Connection connection=null;
	    response.setContentType("text/html");
        ResultSet resultSet = null;
        ArrayList mobileList=null;
        ArrayList smsList=null;
       String fname=request.getParameter("fname");
     //  FileInputStream f=new FileInputStream(new File(fname).getAbsoluteFile());
        System.out.println(fname);       
        DiskFileItemFactory factory = new DiskFileItemFactory();
        String contextRoot = request.getServletContext().getContextPath();
        
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
            HttpSession session=request.getSession();
           
            String strMobileList=mobileList.toString().replace("[", "").replace("]", "").replace(", ", ",");
            System.out.println(mobileList);
            System.out.println(smsList);
            
            System.out.println(strMobileList); 
            
    		//out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileList+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
        	for(int i=0;i<mobileList.size();i++){
            message= "http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+mobileList.get(i)+"&message="+smsList.get(i)+"&senderid=BVRITH&accusage=1";
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
    }
}