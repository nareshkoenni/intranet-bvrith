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
 
public class CourseEndSurveyServlet extends HttpServlet {
    private DataSource dataSource;
    public void init() throws ServletException {
        try {
            // Get DataSource
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource)envContext.lookup("jdbc/testmysql"); 
        } catch (NamingException e) {                                
            e.printStackTrace();        
        }
    }
    int count;
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");  
       
	    Connection connection=null;
    	Statement statement=null;
        ResultSet resultSet = null;
        String branch=req.getParameter("branch");
        String sem=req.getParameter("sem");
        String section=req.getParameter("section");
        String course=req.getParameter("course");
        String p1=req.getParameter("p1");
        String p2=req.getParameter("p2");
        String p3=req.getParameter("p3");
        String p4=req.getParameter("p4");
        String p5=req.getParameter("p5");
        String p6=req.getParameter("p6");
        String p7=req.getParameter("p7");
        String p8=req.getParameter("p8");
        HttpSession session=req.getSession();
        String uid=(String)session.getAttribute("uid");   
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            
        	PreparedStatement ps=connection.prepareStatement("update courseSurvey set p1=?, p2=?, p3=?, p4=?,p5=?,p6=?,p7=?,p8=? where branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' and course='"+course+"' ");
            ps.setString(1, p1);
            ps.setString(2, p2);
            ps.setString(3, p3);     
            ps.setString(4, p4);
            ps.setString(5, p5);
            ps.setString(6, p6);
            ps.setString(7, p7);
            ps.setString(8, p8);
            int noru=ps.executeUpdate();
            if(noru==1){
        	//	RequestDispatcher rd=req.getRequestDispatcher("courseEndSurvey.jsp");
    		//	rd.include(req,resp);        
    			out.println("<script>alert(' Course\t" +course+"\thas been updated successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/courseEndSurvey.jsp?uid="+uid+"'</script>"); 
    				
    		//	out.println("<h4 align='center'> Course\t" +course+"\thas been updated successfully </h4>");
    		}else{
    			
    			//out.println("<h4 align='center'> Failed in updating\t"+course+" </h4>");
    			out.println("<script>alert(' Failed in updating\t"+course+" ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/courseEndSurvey.jsp?uid="+uid+"'</script>"); 
    			
    		}
        } catch (SQLException e) {
            e.printStackTrace();
	    System.out.println("not able to get the connection in courseSurvey");
	}finally{
	    try{
	        connection.close();
		System.out.println("connection closed");     
	    }				
	    catch(Exception e){}
		
	}
    }
}