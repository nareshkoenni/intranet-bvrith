package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
 
public class PostAttendenceServletR extends HttpServlet {
     
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
    	 ResultSet rs = null,rs1=null;
    	 
        String date=req.getParameter("date");
        String sem=req.getParameter("sem");
        String branch=req.getParameter("branch");
        String section=req.getParameter("section");
        String subject=req.getParameter("subject");
        String period=req.getParameter("period");
        String absenties[]=req.getParameterValues("absenties");
        HttpSession session=req.getSession();
        ArrayList rollList=(ArrayList)session.getAttribute("rollList");
        System.out.println(rollList);
        Integer attendance[]=new Integer[rollList.size()];
        	
        try {
        	PrintWriter out=resp.getWriter();
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            PreparedStatement ps=null,ps1=null;
            int k=2;
            Statement s=connection.createStatement();
             rs=s.executeQuery("select courseId from courseInfo where sem='"+sem+"' and branch='"+branch+"' and section='"+section+"' and courseName='"+subject+"' ");
            rs.next();
            String courseId=rs.getString("courseId");
            for (int i=0;i<rollList.size();i++){
            	for(int j=0;j<absenties.length;j++){
                    	    
                    if(absenties[j].toString().trim().contains(rollList.get(i).toString().trim())){
                   		k=0;
            	    	j=rollList.size()+10;
            	    }else if(j==absenties.length-1){
            	    	k=1;
            	    }	
                    	
            	}
                //    	System.out.print("absentees"+absenties[0]+"\t"+absenties[1]);
                        
                  //  	System.out.println("attendance"+rollList.get(i)+""+k);
            	rs1=s.executeQuery("select *from attendanceR where sem='"+sem+"' and branch='"+branch+"' and section='"+section+"' and date='"+date+"'");
            	if(rs1.next()){
            		ps=connection.prepareStatement("insert into attendanceR(rollNumber,date,sem,branch,section,subject,period,s1,s2,s3,s4,s5,s6,s7,s8) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setString(1, (String)rollList.get(i));
                    ps.setString(2, date);
                    ps.setString(3, sem);
                    ps.setString(4, branch);
                    ps.setString(5, section);
                    ps.setString(6, subject);
                    ps.setString(7, period);
                    ps.setInt(8,0);
                    ps.setInt(9,0);
                    ps.setInt(10,0);
                    ps.setInt(11,0);
                    ps.setInt(12,0);
                    ps.setInt(13,0);
                    ps.setInt(14,0);
                    ps.setInt(15,0);
                    int noru=ps.executeUpdate();
                    if(noru==1){
                    	
                    	ps=connection.prepareStatement("update attendanceR set  ");
                        
                    }
            	}else{
            		
            	}
            	
            }
           
            
        //    if(==1){
            	RequestDispatcher rd=req.getRequestDispatcher("postAttendance.jsp");
            	rd.include(req,resp);
            	out.println("<h4 align='center'> Attendance was posted successfully for Period-"+period+"("+subject+") </h4>");
     
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