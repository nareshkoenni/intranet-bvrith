package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
 
public class UpdateLeaveInboxServlet extends HttpServlet {
     
    private DataSource dataSource;
    
     
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
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
	    Connection connection=null;
	    
    	 PreparedStatement ps1=null, ps=null;
    	 PrintWriter out=resp.getWriter();
    	 
    	 HttpSession session=req.getSession();
         String uid=req.getParameter("uid");
         String status=req.getParameter("status");
         String leaveId=req.getParameter("leaveId");
         String reason=req.getParameter("reason");
         
       //  String adjustDate=req.getParameter("adjustDate");
         
         
     	try {      
			connection=dataSource.getConnection();
			int noru=0;
		
			ps=connection.prepareStatement("update leaves set hodstatus=?, rejectreason=?  where id=? ");
		    	ps.setString(1, status);
		    	ps.setString(2, reason);
	            ps.setString(3, leaveId);
                noru=ps.executeUpdate();
                System.out.println("noru"+noru);  
			if(noru==1){
				System.out.println("success");  
          	out.println("<script>alert('Successfully Updated Thank You'); window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/hodLeaveInbox.jsp?uid="+uid+"'</script>");
          	
           }  
            
			
			
        }catch (SQLException e) {
   		 	e.printStackTrace();
   		 	System.out.println("not able to get the connection");
   	 	 }
       
        
        try{
   		 connection.close();
   		 System.out.println("connection closed");
   	 	}catch(Exception e){}
   	 	
        
	}
}   