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
 
public class CourseEndFeedbackServlet extends HttpServlet {
     
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
    	
    	int tlp1=Integer.parseInt(req.getParameter("tlp1"));
    	int tlp2=Integer.parseInt(req.getParameter("tlp2"));  
    	int tlp3=Integer.parseInt(req.getParameter("tlp3"));
    	int tlp4=Integer.parseInt(req.getParameter("tlp4"));
    	int tlp5=Integer.parseInt(req.getParameter("tlp5"));
    	int tlp6=Integer.parseInt(req.getParameter("tlp6"));
    	int tlp7=Integer.parseInt(req.getParameter("tlp7"));
    	int tlp8=Integer.parseInt(req.getParameter("tlp8"));
    	
    	int p1=Integer.parseInt(req.getParameter("p1"));
    	int p2=Integer.parseInt(req.getParameter("p2"));  
    	int p3=Integer.parseInt(req.getParameter("p3"));
    	String p4s=req.getParameter("p4");
    	String p5s=req.getParameter("p5");
    	String p6s=req.getParameter("p6");
    	String p7s=req.getParameter("p7");
    	String p8s=req.getParameter("p8");
    	int p4=0;
    	if(p4s!=null){
    		p4=Integer.parseInt(p4s);   
    	}        
    	int p5=0;
    	if(p5s!=null){
    		p5=Integer.parseInt(p5s);
    	}
    	int p6=0;
    	if(p6s!=null){
    		p6=Integer.parseInt(p6s);
    	}
    	int p7=0;
    	if(p7s!=null){
    		p7=Integer.parseInt(p7s);
    	}
    	int p8=0;
    	if(p8s!=null){
    		p8=Integer.parseInt(p8s);
    	}
    	
    	String comments=req.getParameter("comments");
    	
    	System.out.println(p1);
   // 	int result=(p1+p2+p3+p4+p5+p6+p7+p8+p9+p10)/10;
    //	System.out.println(section+"-"+"-"+tname+"-"+subjectid+"-"+branch);
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            
            count++;
            PreparedStatement ps=connection.prepareStatement("insert into courseEndFeedback(program,branch,sem,section,course,nt,rollNumber,p1,p2,p3,p4,p5,p6,p7,p8,date,tlp1,tlp2,tlp3,tlp4,tlp5,tlp6,tlp7,tlp8,faculty,acyear,comments) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,"btech");
            ps.setString(2, branch);
            ps.setString(3, sem);
            ps.setString(4, section);
            ps.setString(5, course);
            ps.setInt(6, 1);
            ps.setString(7, rollNumber);        
            ps.setInt(8, p1);
            ps.setInt(9, p2);
            ps.setInt(10, p3);
            ps.setInt(11, p4);
            ps.setInt(12, p5);
            ps.setInt(13, p6);
            ps.setInt(14, p7);
            ps.setInt(15, p8);
            ps.setString(16,date);
            ps.setInt(17, tlp1);
            ps.setInt(18, tlp2);
            ps.setInt(19, tlp3);
            ps.setInt(20, tlp4);
            ps.setInt(21, tlp5);
            ps.setInt(22, tlp6);
            ps.setInt(23, tlp7);
            ps.setInt(24, tlp8);
            ps.setString(25, faculty);
            ps.setString(26, acyear);
            ps.setString(27, comments);


           int noru= ps.executeUpdate();
           
        	//RequestDispatcher rd=req.getRequestDispatcher("courseEndFeedback.jsp");
    		//rd.include(req,resp);
         out.println("<script>alert('Feedback of "+course+" has been captured successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/courseEndFeedback.jsp?rollnumber="+rollNumber+"' ;</script>"); 
			
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