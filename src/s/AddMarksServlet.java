package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
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
 
public class AddMarksServlet extends HttpServlet {
     
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
	    ArrayList rollList=null,s1List=null,s2List=null,s3List=null,s4List=null,s5List=null,s6List=null,s7List=null,s8List=null;
        ResultSet resultSet = null;
        String fname=req.getParameter("fname");
        String branch=req.getParameter("branch");
        String sem=req.getParameter("sem");
        String section=req.getParameter("section");
        String examType=req.getParameter("examType");
        
       
        String f="/Users/nareshk/Desktop/"+fname;
        
        System.out.println(f);      
        try {
			 rollList=ReadMarksExcelFile.readRollList(f);
			 s1List=ReadMarksExcelFile.readS1List(f);
			 s2List=ReadMarksExcelFile.readS2List(f);
			 s3List=ReadMarksExcelFile.readS3List(f);
			 s4List=ReadMarksExcelFile.readS4List(f);
			 s5List=ReadMarksExcelFile.readS5List(f);
			 s6List=ReadMarksExcelFile.readS6List(f);
			 s7List=ReadMarksExcelFile.readS7List(f);
			 s8List=ReadMarksExcelFile.readS8List(f);
				 
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
            	PreparedStatement ps=connection.prepareStatement("insert into Y3S2In(rollNumber,branch,sem,section,wt,ia,infsec,ooad,mefa,stm,wtlab,acslab) values(?,?,?,?,?,?,?,?,?,?,?,?)");
            	int noru=0;
            	for(int j=0;j<rollList.size() ;j++){
            		
                	ps.setString(1,(String) rollList.get(j));
                	ps.setString(2,branch);
                	ps.setString(3,sem);
                    ps.setString(4, section);
                    ps.setInt(5,(Integer)s1List.get(j) );
                    ps.setInt(6,(Integer)s2List.get(j) );
                    ps.setInt(7,(Integer)s3List.get(j) );
                    ps.setInt(8,(Integer)s4List.get(j) );
                    ps.setInt(9,(Integer)s5List.get(j) );
                    ps.setInt(10,(Integer)s6List.get(j) );
                    ps.setInt(11,(Integer)s7List.get(j) );
                    ps.setInt(12,(Integer)s8List.get(j) );
                    
                      noru=ps.executeUpdate();    
            	}
            
            	if(noru==1){
            		RequestDispatcher rd=req.getRequestDispatcher("addStudent.jsp");
            		rd.include(req,resp);
            		out.println("<h4 align='center' style=\"color:green;\"> List of students are uploaded successfully</h4>");
            	}else{
            		RequestDispatcher rd=req.getRequestDispatcher("addMarks.jsp");
            		rd.include(req,resp);
            		out.println("<h4 align='center' style=\"color:red;\"> Failed in loading Marks</h4>");
            	}
			}
            
    	}catch (SQLException e) {
    			e.printStackTrace();
    			System.out.println("not able to get the connection in add student");
    	}finally{    
    			try{
    					rollList.clear();
    					
    					connection.close();
    					System.out.println("connection closed");
    			}				  
    			catch(Exception e){}
	
    	}
    }
}