package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import org.apache.catalina.connector.Request;
 
public class SubjectAllocationServlet extends HttpServlet {
     
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
    int count;
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
	    Connection connection=null;
    	Statement statement=null;
        ResultSet resultSet = null;
        HttpSession session=req.getSession();
        String uid=(String)session.getAttribute("uid");
        String faculty=req.getParameter("faculty");
        String subject=req.getParameter("subject");
        String section=req.getParameter("section");
        String branch=req.getParameter("branch");
        session.setAttribute("branch", branch);
        @SuppressWarnings("unused")
		String facultyId=faculty.substring(faculty.indexOf('-')+1);
        System.out.println(facultyId);
        String sem=(String)session.getAttribute("sem");
        ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
		String acyear=rb.getString(sem);
        	
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
           
        	
            count++;
             Statement s=connection.createStatement();
            ResultSet rs=s.executeQuery("select * from subjectallocation  where tid='"+facultyId+"' and  subjectid='"+subject+"' and  section='"+section+"' and branch='"+branch+"'");
            if(rs.next()){
            	//RequestDispatcher rd=req.getRequestDispatcher("subjectAllocation.jsp");
    			//rd.include(req,resp);
    		//	out.println("<h4 align='center' style=\"color:red;\"> Faculty\t" +faculty.toUpperCase()+"\t was already assigned with\t"+subject+ " \tfor\t "+section+"</h4>");
            	out.println("<script>alert(' Faculty\t" +faculty.toUpperCase()+"\t was already assigned with\t"+subject+ " \tfor\t "+section+"');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/subjectAllocation.jsp?uid="+uid+"'</script>"); 
        		
            }else{ 
            PreparedStatement ps=connection.prepareStatement("insert into subjectallocation(tid,tname,branch,subjectid,section,sem,acyear) values(?,?,?,?,?,?,?)");
            ps.setString(1, facultyId);
            ps.setString(2, faculty);
            ps.setString(3, branch);
            ps.setString(4, subject);
            ps.setString(5, section);
            ps.setString(6, sem);
            ps.setString(7, acyear);
            ps.executeUpdate();
        		//RequestDispatcher rd=req.getRequestDispatcher("subjectAllocation.jsp");
    		//	rd.include(req,resp);
    		//	out.println("<h4 background align='center'> Faculty\t" +faculty.toUpperCase()+ "\t has been assigned with\t" +subject+ "\tto\t"+section+" </h4>");
        	out.println("<script>alert(' Faculty\t" +faculty.toUpperCase()+ "\t has been assigned with\t" +subject+ "\t to \t"+section+"');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/subjectAllocation.jsp?uid="+uid+"'</script>"); 
        	
            }
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