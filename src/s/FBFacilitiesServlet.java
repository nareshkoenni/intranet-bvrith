package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


import java.util.Calendar;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
 
public class FBFacilitiesServlet extends HttpServlet {
     
    
	private static final long serialVersionUID = 1L;
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
    int count,not;      
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
	    Connection connection=null;
        HttpSession session=req.getSession();
    	
        String section=req.getParameter("section");  
        String rollnumber=(String)session.getAttribute("rollnumber");  
        String branch=req.getParameter("branch");  
        String sem=req.getParameter("sem");  
        String acyear=req.getParameter("acyear");  
        String date=req.getParameter("date");  
        String mailId=req.getParameter("mailId");  
        
   
    	int teaching=Integer.parseInt(req.getParameter("teaching"));
    	int labs=Integer.parseInt(req.getParameter("labs-cr"));  
    	int library=Integer.parseInt(req.getParameter("library"));
    	int internet=Integer.parseInt(req.getParameter("internet"));
    	int tpc=Integer.parseInt(req.getParameter("tpc"));
    	int admin=Integer.parseInt(req.getParameter("admin"));
    	int medical=Integer.parseInt(req.getParameter("medical"));
    	int canteen=Integer.parseInt(req.getParameter("canteen"));
    	int transp=Integer.parseInt(req.getParameter("transp-hostel"));
    	int sports=Integer.parseInt(req.getParameter("sports"));
    	int extraact=Integer.parseInt(req.getParameter("extra-act"));
    	int ambience=Integer.parseInt(req.getParameter("ambience"));
    	int security=Integer.parseInt(req.getParameter("security"));
    	int counselling=Integer.parseInt(req.getParameter("counselling"));
    	int aminities=Integer.parseInt(req.getParameter("aminities"));
    	int overall=Integer.parseInt(req.getParameter("overall"));
    	
    	String comments=req.getParameter("comments");
    	java.util.Date d=new java.util.Date();
        int month=d.getMonth();
    	PrintWriter out=resp.getWriter();
        
        try {
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            
            count++;
            PreparedStatement ps=connection.prepareStatement("insert into fbFacilities(teaching,labs,library,internet,tpc,"
            		+ "admin,medical,canteen,transp,sports,extraact,ambience,security,counselling,aminities,overall,"
            		+ "section,rollnumber,branch,sem,acyear,date,mailId) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1,teaching);
            ps.setInt(2, labs);
            ps.setInt(3, library);
            ps.setInt(4, internet);
            ps.setInt(5, tpc);
            ps.setInt(6, admin);
            ps.setInt(7, medical);        
            ps.setInt(8,canteen);
            ps.setInt(9, transp);
            ps.setInt(10, sports);
            ps.setInt(11, extraact);
            ps.setInt(12, ambience);  
            ps.setInt(13, security);
            ps.setInt(14, counselling);
            ps.setInt(15, aminities);
            ps.setInt(16, overall);
            ps.setString(17, section);
            ps.setString(18, rollnumber);
            ps.setString(19, branch);
            ps.setString(20, sem);
            ps.setString(21, acyear);
            ps.setString(22, date);
            ps.setString(23, mailId);
            
            
            int noru= ps.executeUpdate();
           
        	//RequestDispatcher rd=req.getRequestDispatcher("courseEndFeedback.jsp");
    		//rd.include(req,resp);
         out.println("<script>alert('Feedback of "+rollnumber+" has been captured successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/facilitiesFeedback.jsp?rollnumber="+rollnumber+"' ;</script>"); 
			
    		System.out.println("facility feedback captured");
        } catch (Exception e) {
            e.printStackTrace();
	    System.out.println("not able to get the connection");
	    out.println("<script>alert('Failed. Pls check and Give');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/facilitiesFeedback.jsp?rollnumber="+rollnumber+"' ;</script>"); 
		  
	}finally{
	    try{    
	        connection.close();
		System.out.println("connection closed");
	    }				
	    catch(Exception e){}
		
	}
    }      
}