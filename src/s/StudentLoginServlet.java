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
 
public class StudentLoginServlet extends HttpServlet {
     
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
        String rollno=req.getParameter("rollno").toUpperCase();
        String pwd=req.getParameter("pwd");
     
        	
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            HttpSession session=req.getSession();
        	
            count++;
            statement = connection.createStatement();
            
            ResultSet rs=statement.executeQuery("select * from student where roll='"+rollno+"' and passwd='"+pwd+"' ");
    		
            if(rs.next()){
    		//	int not=rs.getInt("count");	
    	/*		if(not==0){
    				not++;
    				session.setAttribute("rollno", rs.getString("roll") );
    				session.setAttribute("section", rs.getString("section") );
    				session.setAttribute("sname", rs.getString("sname").toUpperCase() ); 
    				session.setAttribute("sem", rs.getString("sem") );
    				
    				Statement st=connection.createStatement();
    				st.executeUpdate("update student set count='"+not+"' where roll='"+rollno+"'");
    				RequestDispatcher rd=req.getRequestDispatcher("changePassword.jsp");
        			rd.forward(req,resp);
        	
    			}else {   */
    				
    				session.setAttribute("rollno", rs.getString("roll") );
    				session.setAttribute("section", rs.getString("section") );
    				session.setAttribute("sname", rs.getString("sname").toUpperCase() ); 
    				session.setAttribute("sem", rs.getString("sem") );    
        			
    				RequestDispatcher rd=req.getRequestDispatcher("courseEndFeedback.jsp");
    				rd.forward(req,resp);
    		//	}
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