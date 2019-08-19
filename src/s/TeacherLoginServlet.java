package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


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
 
public class TeacherLoginServlet extends HttpServlet {
     
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
        String uname=req.getParameter("uname");
        String pwd=req.getParameter("pwd");
              
        	
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            HttpSession session=req.getSession();
        	
            count++;
            statement = connection.createStatement();
            ResultSet rs=statement.executeQuery("select * from teacher where id='"+uname+"' and name='"+pwd+"' ");    
    		if(rs.next()){
    			session.setAttribute("teacherName",uname);
    			RequestDispatcher rd=req.getRequestDispatcher("teacherHome.jsp");
    			rd.forward(req,resp);
    		}else{
    			RequestDispatcher rd=req.getRequestDispatcher("index.html");
    			rd.include(req,resp);
    			out.println("<h3 align='center' style=\"color:red;\">wrong credentials</h3>");
    			
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