package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
 
public class AddStudentServlet extends HttpServlet {
     
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
    	PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
	    Connection connection=null;
	    ArrayList rollList=null,nameList=null;
        ResultSet resultSet = null;
        String fname=req.getParameter("fname");
        String brnch=req.getParameter("branch");
        String sem=req.getParameter("sem");
        String section=req.getParameter("section");
       
      //  String f="C:\\Users\\Administrator\\Desktop\\"+fname;
        
        System.out.println(fname);      
        try {
			 rollList=ReadExcelFile.readRollList(fname);
			 nameList=ReadExcelFile.readNameList(fname);
			 Set rollSet=new HashSet();
			 rollSet.addAll(rollList);
			 rollList.clear();
			 rollList.addAll(rollSet);
			System.out.println(rollList);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println("not able to get the list from readexcelfile");
			e1.printStackTrace();
		}
        try {   
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            HttpSession session=req.getSession();
        	
            count++;
            if(fname == null || fname.equals("")){
            	  RequestDispatcher rd=req.getRequestDispatcher("addStudent.jsp");
          		rd.include(req,resp);
          		out.println("<h4 align='center' style=\"color:green;\"> File Name can't be null or empty</h4>");
            }else{
            	PreparedStatement ps=connection.prepareStatement("insert into student(roll,passwd,sname,count,branch,section,sem) values(?,?,?,?,?,?,?)");
            	int noru=0;
            	for(int j=0;(j<rollList.size() || j<nameList.size()) ;j++){
                	ps.setString(1,(String) rollList.get(j));
                	ps.setString(2,(String) rollList.get(j));
                	ps.setString(3,(String) nameList.get(j));
                    ps.setInt(4, 0);
                    ps.setString(5, brnch);
                    ps.setString(6, section);
                    ps.setString(7, sem);
                    noru=ps.executeUpdate();    
            	}
            
            	if(noru==1){
            		RequestDispatcher rd=req.getRequestDispatcher("addStudent.jsp");
            		rd.include(req,resp);
            		out.println("<h4 align='center' style=\"color:green;\"> List of students are uploaded successfully</h4>");
            	}
			}
            
    	}catch (SQLException e) {
    			e.printStackTrace();
    			System.out.println("not able to get the connection in add student");
    	}finally{    
    			try{
    					rollList.clear();
    					nameList.clear();
    					
    					connection.close();
    					System.out.println("connection closed");
    			}				  
    			catch(Exception e){}
	
    	}
    }
}