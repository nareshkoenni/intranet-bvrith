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
 
public class AddSubjectServlet extends HttpServlet {
     
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
        String subjectName=req.getParameter("subjectName");
        String subjectId=req.getParameter("subjectId");
        String branch=req.getParameter("branch");
        String sem=req.getParameter("sem");
        String section=req.getParameter("section");
        String regulation=req.getParameter("regulation");
              
        	
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            HttpSession session=req.getSession();
        	
            count++;
            Statement s=connection.createStatement();
            ResultSet rs=s.executeQuery("select * from subject where subjectid='"+subjectId+"' and section='"+section+"'");
            if(rs.next()){
            	RequestDispatcher rd=req.getRequestDispatcher("addSubject.jsp");
    			rd.include(req,resp);
    			out.println("<h4 align='center' style=\"color:red;\"> Subject\t" +subjectName.toUpperCase()+"\t with id \t"+subjectId+"\t for\t"+section +" already exists </h4>");
    		}else{
            PreparedStatement ps=connection.prepareStatement("insert into subject(subjectId,subjectName,branch,section,regulation,sem) values(?,?,?,?,?,?)");
            ps.setString(1, subjectId);
            ps.setString(2, subjectName);
            ps.setString(3, branch);
            ps.setString(4, section);
            ps.setString(5, regulation);
            ps.setString(6, sem);
            ps.executeUpdate();
        		RequestDispatcher rd=req.getRequestDispatcher("addSubject.jsp");
    			rd.include(req,resp);
    			out.println("<h4 align='center'> Subject\t" +subjectName.toUpperCase()+"-"+subjectId+ "\thas been added successfully </h4>");
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