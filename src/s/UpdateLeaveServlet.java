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
 
public class UpdateLeaveServlet extends HttpServlet {
     
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
    	 String uid=(String)session.getAttribute("uid");
         String faculty=req.getParameter("faculty").trim();
         String clCredit=req.getParameter("clCredit").trim();
         String clDebit=req.getParameter("clDebit").trim();
         String clBal=req.getParameter("clBal").trim();
         
         String slCredit=req.getParameter("slCredit").trim();
         String slDebit=req.getParameter("slDebit").trim();
         String slBal=req.getParameter("slBal").trim();
         
         String elCredit=req.getParameter("elCredit").trim();
         String elDebit=req.getParameter("elDebit").trim();
         String elBal=req.getParameter("elBal").trim();
         
         String alCredit=req.getParameter("alCredit").trim();
         String alDebit=req.getParameter("alDebit").trim();
         String alBal=req.getParameter("alBal").trim();
          
         String cclCredit=req.getParameter("cclCredit").trim();
         String cclDebit=req.getParameter("cclDebit").trim();
         String cclBal=req.getParameter("cclBal").trim();
         
         String vacation=req.getParameter("vacation").trim();
         String lsId=req.getParameter("lsId").trim();
          
     	try {      
			connection=dataSource.getConnection();
			int noru=0;
		    Statement s=connection.createStatement();
		    s.executeUpdate("delete from leaveinfo where lsId='"+lsId+"' ");
		    System.out.println("deleted");
			ps=connection.prepareStatement("insert into leaveInfo(faculty,clcredit,cldebit,clbalance,elcredit,eldebit,elbalance,alcredit,aldebit,albalance,slcredit,sldebit,slbalance,cclcredit,ccldebit,cclbalance,vacation) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    	ps.setString(1, faculty);
		     	ps.setString(2, clCredit);
		     	ps.setString(3, clDebit);
		     	ps.setString(4, clBal);
		     	ps.setString(5, elCredit);
		     	ps.setString(6, elDebit);
		     	ps.setString(7, elBal);
		     	ps.setString(8, alCredit);
		     	ps.setString(9, alDebit);
		     	ps.setString(10, alBal);
		     	ps.setString(11, slCredit);
		     	ps.setString(12, slDebit);
		     	ps.setString(13, slBal);
		     	ps.setString(14, cclCredit);
		     	ps.setString(15, cclDebit);
		     	ps.setString(16, cclBal);
		     	ps.setString(17, vacation);
		       noru=ps.executeUpdate();
                System.out.println("noru"+noru);  
			if(noru==1){
				System.out.println("success, inserted");  
				out.println("<script>alert('Successfully updated Thank You'); window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveSummary.jsp?uid="+uid+"'</script>");
          	}else{
        		System.out.println("failed");  
				out.println("<script>alert('Failed'); window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveSummary.jsp?uid="+uid+"'</script>");
       	}
            
			
			
        }catch (SQLException e) {
   		 	e.printStackTrace();
   		 	System.out.println("not able to get the connection");
   	 	 }
       
        
        try{
   		 connection.close();
   	 	}catch(Exception e){}
   	 	
        
	}
}   