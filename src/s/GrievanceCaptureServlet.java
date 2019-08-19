package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
 
public class GrievanceCaptureServlet extends HttpServlet {
     
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
    	
        String comments=req.getParameter("comments");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy.HH.mm.ss");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String date=sdf.format(timestamp);
        String mailID=req.getParameter("mailID");
        String dept=req.getParameter("dept");
        String uid=req.getParameter("uid");
        String category=req.getParameter("category");
        String message=req.getParameter("message");
        String status=req.getParameter("status");
        
    	  
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            
            count++;
            PreparedStatement ps=connection.prepareStatement("insert into grievance(uid,mailID,dept,category,message,date,status,comments,fixedBy) values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1,uid);
            ps.setString(2, mailID);
            ps.setString(3, dept);
            ps.setString(4, category);
            ps.setString(5, message);
            ps.setString(6, date);
            ps.setString(7, status);        
            ps.setString(8,"");
            ps.setString(9, "");
            int noru= ps.executeUpdate();
           
        	//RequestDispatcher rd=req.getRequestDispatcher("courseEndFeedback.jsp");
    		//rd.include(req,resp);
         out.println("<script>alert('Your Grievance has been registered successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/grievance.jsp?uid="+uid+"' ;</script>"); 
			
    		System.out.println("Grievance captured");
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