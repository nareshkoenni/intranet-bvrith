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
 
public class AddFacultyServlet extends HttpServlet {
     
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
        String name=req.getParameter("name");
        String id=req.getParameter("id");
        String branch=req.getParameter("branch");
              
        	
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            HttpSession session=req.getSession();
        	
            count++;
            Statement s=connection.createStatement();
            ResultSet rs=s.executeQuery("select * from teacher where id='"+id+"' ");
            if(rs.next()){
            	RequestDispatcher rd=req.getRequestDispatcher("addFaculty.jsp");
    			rd.include(req,resp);
    			out.println("<h4 align='center' style=\"color:red;\"> Faculty\t"+id+ "\t already exists with name\t"+name.toUpperCase()+"</h4>");
    		}else{
            PreparedStatement ps=connection.prepareStatement("insert into teacher(id,name,branch,doj) values(?,?,?,?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, branch);
            String doj=new Date().toString();
            ps.setString(4, doj);
            ps.executeUpdate();
        		RequestDispatcher rd=req.getRequestDispatcher("addFaculty.jsp");
    			rd.include(req,resp);
    			out.println("<h4 align='center'> Faculty\t" +name.toUpperCase()+"-"+id+ "\thas been added successfully </h4>");
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