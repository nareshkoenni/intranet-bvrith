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
 
public class TLFeedbackServlet extends HttpServlet {
     
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
    	Statement statement=null;
        ResultSet resultSet = null;
        HttpSession session=req.getSession();
        String uid=(String)session.getAttribute("uid");
    	
        String section=(String)session.getAttribute("section");      
        String course=(String)session.getAttribute("course");
    	String branch=(String)session.getAttribute("branch");
    	String sem=(String)session.getAttribute("sem");
    	String rollNumber=(String)session.getAttribute("rollNumber");
    	String date=(String)session.getAttribute("date");
    	String faculty=(String)session.getAttribute("faculty");
    	String acyear=(String)session.getAttribute("acyear");  
    	String fbnum=(String)session.getAttribute("fbnum");
   
    	System.out.println("fbnum" +fbnum); 
    	
    	int tlp1=Integer.parseInt(req.getParameter("tlp1"));
    	int tlp2=Integer.parseInt(req.getParameter("tlp2"));  
    	int tlp3=Integer.parseInt(req.getParameter("tlp3"));
    	int tlp4=Integer.parseInt(req.getParameter("tlp4"));
    	int tlp5=Integer.parseInt(req.getParameter("tlp5"));
    	int tlp6=Integer.parseInt(req.getParameter("tlp6"));
    	int tlp7=Integer.parseInt(req.getParameter("tlp7"));
    	int tlp8=Integer.parseInt(req.getParameter("tlp8"));
    	
    	String comments=req.getParameter("comments");
    	java.util.Date d=new java.util.Date();
        int month=d.getMonth();
        
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            
            count++;
            PreparedStatement ps=connection.prepareStatement("insert into tlfeedback(program,branch,sem,section,course,nt,rollNumber,date,tlp1,tlp2,tlp3,tlp4,tlp5,tlp6,tlp7,tlp8,faculty,acyear,comments,month,fbno) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,"btech");
            ps.setString(2, branch);
            ps.setString(3, sem);
            ps.setString(4, section);
            ps.setString(5, course);
            ps.setInt(6, 1);
            ps.setString(7, rollNumber);        
            ps.setString(8,date);
            ps.setInt(9, tlp1);
            ps.setInt(10, tlp2);
            ps.setInt(11, tlp3);
            ps.setInt(12, tlp4);  
            ps.setInt(13, tlp5);
            ps.setInt(14, tlp6);
            ps.setInt(15, tlp7);
            ps.setInt(16, tlp8);
            ps.setString(17, faculty);
            ps.setString(18, acyear);
            ps.setString(19, comments);
            ps.setInt(20, month);
            ps.setString(21, fbnum);
            
            int noru= ps.executeUpdate();
           
        	//RequestDispatcher rd=req.getRequestDispatcher("courseEndFeedback.jsp");
    		//rd.include(req,resp);
         out.println("<script>alert('Feedback of "+course+" has been captured successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/tlfeedback.jsp?rollnumber="+rollNumber+"' ;</script>"); 
			
    		System.out.println("feedback captured");
        } catch (SQLException e) {
            e.printStackTrace();
	    System.out.println("not able to get the connection");
	}finally{
	    try{
	        connection.close();
		System.out.println("connection closed");
	    }				
	    catch(Exception e){}
		
	}
    }
}