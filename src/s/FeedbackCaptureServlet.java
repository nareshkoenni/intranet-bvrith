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
 
public class FeedbackCaptureServlet extends HttpServlet {
     
    private DataSource dataSource;
    
     
    public void init() throws ServletException {
        try {
            // Get DataSource
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource)envContext.lookup("jdbc/mysql");
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
        String tname=(String)session.getAttribute("tname");
    	String subjectid=(String)session.getAttribute("subjectid");
    	String branch=(String)session.getAttribute("branch");
    	String sem=(String)session.getAttribute("sem");
    	String rollno=(String)session.getAttribute("rollno");
    	
    	int month=new Date().getMonth();
    	int p1=Integer.parseInt(req.getParameter("subjecKnowledge"));
    	int p2=Integer.parseInt(req.getParameter("ability"));
    	int p3=Integer.parseInt(req.getParameter("doubt"));
    	int p4=Integer.parseInt(req.getParameter("communicationSkills"));
    	int p5=Integer.parseInt(req.getParameter("syllabus"));
    	int p6=Integer.parseInt(req.getParameter("standard"));
    	int p7=Integer.parseInt(req.getParameter("controll"));
    	int p8=Integer.parseInt(req.getParameter("encouragement"));
    	int p9=Integer.parseInt(req.getParameter("rapport"));
    	int p10=Integer.parseInt(req.getParameter("regularity"));
    	System.out.println(p1);
   // 	int result=(p1+p2+p3+p4+p5+p6+p7+p8+p9+p10)/10;
    	System.out.println(section+"-"+"-"+tname+"-"+subjectid+"-"+branch);
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            
            count++;
            Statement s=connection.createStatement();
            
            PreparedStatement ps=connection.prepareStatement("insert into feedback(teacherid,subject,section,branch,sem,year,month,nt,rollno,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, tname);
            ps.setString(2, subjectid);
            ps.setString(3, section);
            ps.setString(4, branch);
            ps.setString(5, sem);
                        
            String year=new Date().toString();
            ps.setString(6, year);
            ps.setInt(7, month);
            ps.setInt(8, 1);
            ps.setString(9, rollno);
            ps.setDouble(10, p1);
            ps.setDouble(11, p2);
            ps.setDouble(12, p3);
            ps.setDouble(13, p4);
            ps.setDouble(14, p5);
            ps.setDouble(15, p6);
            ps.setDouble(16, p7);
            ps.setDouble(17, p8);
            ps.setDouble(18, p9);
            ps.setDouble(19, p10);   

            ps.executeUpdate();
        //	RequestDispatcher rd=req.getRequestDispatcher("section.jsp");
    	//	rd.include(req,resp);
    	//	out.println("<h2 align='center'>Feedback of \t"+subjectid+"\t-"+tname+"\t"+"\t has been captured successfully</h2>" );
    		out.println("<script>alert(' Feedback of \t"+subjectid+"\t-"+tname+"\t"+"\t has been captured successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/section.jsp?uid="+uid+"'</script>"); 
			
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