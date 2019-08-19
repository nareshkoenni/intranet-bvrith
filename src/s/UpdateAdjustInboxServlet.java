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
 
public class UpdateAdjustInboxServlet extends HttpServlet {
     
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
         //String uid=req.getParameter("uid");
    	 String uid=(String)session.getAttribute("uid");
         String status=req.getParameter("status");
         String adjId=req.getParameter("adjId");
         String appId=req.getParameter("appId");
         int leaveId=Integer.parseInt(req.getParameter("leaveId"));
       //  String adjustDate=req.getParameter("adjustDate");
         
  	 
         
     	try {      
			connection=dataSource.getConnection();
			Statement s=connection.createStatement();
	  	   	ResultSet rs=s.executeQuery("select adjustcode from leaves where applicant_id='"+appId+"' and id='"+leaveId+"'");
	  	  int adjustcode=100;
	  	   	if(rs.next()){
				adjustcode=rs.getInt("adjustcode");   
			}
	  	   	int noru=0;
	  	   	System.out.println("adjcode before"+adjustcode);
			ps=connection.prepareStatement("update adjust set fadjuststatus=? where id=? ");
		    	
			ps.setString(1, status);
            ps.setString(2, adjId);  
               
                noru=ps.executeUpdate();
			  
			if(noru==1){
				if(status.equals("accepted")){
					adjustcode--;
					System.out.println("adj code"+adjustcode);     
					ps1=connection.prepareStatement("update leaves set adjustcode=? where applicant_id='"+appId+"' ");
					ps1.setInt(1, adjustcode);
					ps1.executeUpdate();
				}
				//RequestDispatcher rd=req.getRequestDispatcher("coursePlan.jsp");
				//rd.include(req, resp);
          	out.println("<script>alert('Successfully Updated! Thank You');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/adjustInbox.jsp?uid="+uid+"'</script>");
          	 System.out.println("Successfully Posted!");
         	System.out.println("adj code after"+adjustcode);     
			
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