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
 
public class AndroidPostAttendenceServlet extends HttpServlet {
     
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
	    
    	 PreparedStatement ps=null;
    	 PrintWriter out=resp.getWriter();
     	try {      
			connection = dataSource.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        String date=req.getParameter("date");
        String sem=req.getParameter("sem");
        String branch=req.getParameter("branch");
        String section=req.getParameter("section");
        String subject=req.getParameter("subject");
        String period=req.getParameter("period");
        String topic=req.getParameter("topic");
        
        try {
			Statement s=connection.createStatement();
			ResultSet rs= s.executeQuery("select *from attendance where period='"+period+"' and date='"+date+"' and branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' ");
			if(rs.next() && !subject.contains("LAB")){
				out.println("Already Posted!");
			}else{
			int length=Integer.parseInt(req.getParameter("length"));
			ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
			String acyear=rb.getString(sem);
			for(int i=0;i<length;i++){
				String at=req.getParameter("v"+i);
				String parts[]=at.split("-",2);
        		 ps=connection.prepareStatement("insert into attendance(rollNumber,date,sem,branch,section,subject,period,attendance,acyear,topic) values(?,?,?,?,?,?,?,?,?,?)");
                 ps.setString(1, parts[0]);
                 ps.setString(2, date);
                 ps.setString(3, sem);
                 ps.setString(4, branch);
                 ps.setString(5, section);
                 ps.setString(6, subject);
                 ps.setString(7, period);
                 ps.setInt(8,Integer.parseInt(parts[1]));
                 ps.setString(9, acyear);
                 ps.setString(10,topic);
                 
                 ps.executeUpdate();
                 out.println("Successfully Posted!");
			} 
			}
        }catch (SQLException e) {
   		 	e.printStackTrace();
   		 	System.out.println("not able to get the connection");
   	 	 }
       
        
        try{
   		 connection.close();
   		 System.out.println("connection closed");
   	 	}catch(Exception e){}
	}
}