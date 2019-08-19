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
 
public class AndroidSaveAppliedLeaveServlet extends HttpServlet {
     
    private DataSource dataSource,dataSource1;
    
     
    public void init() throws ServletException {
        try {
            // Get DataSource
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
            dataSource1 = (DataSource)envContext.lookup("jdbc/testmysql");
        
             
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }     
    int count;
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
	    Connection connection=null,connection1=null;
	    
    	 PreparedStatement ps=null,ps1=null;
    	 PrintWriter out=resp.getWriter();
     	try {      
			connection = dataSource.getConnection();
			connection1 = dataSource1.getConnection();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
     	String uid=req.getParameter("userId");
      	String leaveType=req.getParameter("leaveType");
        String noOfDays=req.getParameter("noOfDays");
        String fromDate=req.getParameter("fromDate");
        String toDate=req.getParameter("toDate");
        String purpose=req.getParameter("purpose");
        int length=Integer.parseInt(req.getParameter("length"));
        String department[]=new String[10];
        String sem[]=new String[10];
        String section[]=new String[10];
        String adjustedDate[]=new String[10];
        String session[]=new String[10];
        String period[]=new String[10];
        String adjustedWithFaculty[]=new String[10];
       for(int i=0;i<length;i++){
    	   department[i]=req.getParameter("dept"+i);
    	   sem[i]=req.getParameter("sem"+i);
    	   section[i]=req.getParameter("section"+i);
    	   adjustedDate[i]=req.getParameter("adjustedDate"+i);
    	   session[i]=req.getParameter("session"+i);
    	   period[i]=req.getParameter("period"+i);
    	   adjustedWithFaculty[i]=req.getParameter("faculty"+i);
       }
       java.util.Date t=new java.util.Date();
       int month=t.getMonth();
      String dept=null;
		try {
			 Statement s = connection1.createStatement();
			ResultSet rs=s.executeQuery("select Dept from logindetails where  username='"+uid+"' ");
			if(rs.next()){
				dept=rs.getString("Dept");
				//System.out.println("dddddddddd"+dept);  
			}
		
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
      try {
			
   	   Statement s = connection.createStatement();
   	   if(leaveType.equals("OneHrPerm")){
   		   ResultSet rs2=s.executeQuery("select sum(numdays)  from leaves  where applicant_id ='"+uid+"' and leave_type='OneHrPerm' and applicant_dept='"+dept+"' and nohrpmonth='"+month+"'");
   		   if(rs2.next()){
   			   if(rs2.getInt("sum(numdays)")>=2){
       			 out.println("One Hour Permissons Limit is exceeded");
   			   }else{
   				   System.out.println("in save leave else");
   				   ps=connection.prepareStatement("insert into leaves(applicant_id,leave_type,numDays,fromdate,toDate,purpose,applicant_dept,adjustcode,nohrpmonth) values(?,?,?,?,?,?,?,?,?)");
   				   ps.setString(1, uid);
   				   ps.setString(2, leaveType);
   				   ps.setString(3, noOfDays);
   				   ps.setString(4, fromDate);
   				   ps.setString(5, toDate);
   				   ps.setString(6, purpose);
   				   ps.setString(7, dept);
   				   ps.setInt(8, 0);
   				   ps.setInt(9, month);
   				   int l=ps.executeUpdate();
   				   int leaveId=0;
   				   ResultSet rs1=s.executeQuery("select id from leaves where applicant_id='"+uid+"' and leave_type='"+leaveType+"' and numDays='"+noOfDays+"' and fromdate='"+fromDate+"' and  toDate='"+toDate+"' and purpose='"+purpose+"' and applicant_dept='"+dept+"' and adjustcode='"+adjustedDate.length+"' ");
   				   if(rs1.next()){
   					   leaveId=rs1.getInt("id");
   				   }
   				   System.out.println("leaveid of"+uid+"is"+leaveId); 
   				   ps1=connection.prepareStatement("insert into adjust(applicant_id,adj_with_id,department,sem,section,adj_date,session,period,applicant_dept,leaveId) values(?,?,?,?,?,?,?,?,?,?)");
   				   int a=0;
   				   for(int i=0;i<adjustedDate.length;i++){
   					   ps1.setString(1, uid);
   					   ps1.setString(2, adjustedWithFaculty[i]);
   					   ps1.setString(3, department[i]);
   					   ps1.setString(4, sem[i]);
   					   ps1.setString(5, section[i]);
   					   ps1.setString(6, adjustedDate[i]);
   					   ps1.setString(7, session[i]);
   					   ps1.setString(8, period[i]);
   					   ps1.setString(9, dept);
   					   ps1.setInt(10, leaveId);  
   					// no adjustments for one Hr permissions
   					   a=ps1.executeUpdate();
   				   }
   				   if(a==1 && l==1){
   					   out.println("Success");
   				   }else{
   					   out.println("Failed");
   				   }
   			   }
   		   }
   	   }else{
   	   
       	   System.out.println("in save leave else");
       		 ps=connection.prepareStatement("insert into leaves(applicant_id,leave_type,numDays,fromdate,toDate,purpose,applicant_dept,adjustcode,nohrpmonth) values(?,?,?,?,?,?,?,?,?)");
       		 ps.setString(1, uid);
       		 ps.setString(2, leaveType);
                ps.setString(3, noOfDays);
                ps.setString(4, fromDate);
                ps.setString(5, toDate);
                ps.setString(6, purpose);
                ps.setString(7, dept);
                int noOfAdjustments=0;
                for(int i=0;i<adjustedDate.length;i++){
               		 noOfAdjustments++;
                }   
                ps.setInt(8, noOfAdjustments);
                ps.setInt(9, month);
                
                int l=ps.executeUpdate();
                int leaveId=0;
                ResultSet rs1=s.executeQuery("select id from leaves where applicant_id='"+uid+"' and leave_type='"+leaveType+"' and numDays='"+noOfDays+"' and fromdate='"+fromDate+"' and  toDate='"+toDate+"' and purpose='"+purpose+"' and applicant_dept='"+dept+"' and adjustcode='"+adjustedDate.length+"' ");
               if(rs1.next()){
               	leaveId=rs1.getInt("id");
               }
               System.out.println("leaveid of"+uid+"is"+leaveId); 
    			ps1=connection.prepareStatement("insert into adjust(applicant_id,adj_with_id,department,sem,section,adj_date,session,period,applicant_dept,leaveId) values(?,?,?,?,?,?,?,?,?,?)");
                int a=0;
                for(int i=0;i<adjustedDate.length;i++){
                ps1.setString(1, uid);
                ps1.setString(2, adjustedWithFaculty[i]);
                ps1.setString(3, department[i]);
                ps1.setString(4, sem[i]);
                ps1.setString(5, section[i]);
                ps1.setString(6, adjustedDate[i]);
                ps1.setString(7, session[i]);
                ps1.setString(8, period[i]);
                ps1.setString(9, dept);
                ps1.setInt(10, leaveId);  
                a=ps1.executeUpdate();
                }
                if(a==1 && l==1) {
                	out.println("Success");
                }else {
                	out.println("Failed");
                }
           }    
		 }catch (SQLException e) {
  		 	e.printStackTrace();
  		 	System.out.println("not able to get the connection");
  	 	 }
      
            
       finally{
  		 try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		 System.out.println("connection closed");
  	 	}
	}
}
       
       
       
     /*   
        try {
			//Statement s=connection.createStatement();
			
        	ps=connection.prepareStatement("insert into leaves(applicant_id,leave_type,numDays,fromdate,toDate,purpose) values(?,?,?,?,?,?)");
        	ps.setString(1, uid);
        	ps.setString(2, leaveType);
            ps.setString(3, noOfDays);
            ps.setString(4, fromDate);
            ps.setString(5, toDate);
            ps.setString(6, purpose);
            int l=ps.executeUpdate();
            
            ps1=connection.prepareStatement("insert into adjust(applicant_id,adj_with_id,department,sem,section,adj_date,session,period) values(?,?,?,?,?,?,?,?)");
            int a=0;
            for(int i=0;i<length;i++){
            ps1.setString(1, uid);
            ps1.setString(2, adjustedWithFaculty[i]);
            ps1.setString(3, department[i]);
            ps1.setString(4, sem[i]);
            ps1.setString(5, section[i]);
            ps1.setString(6, adjustedDate[i]);
            ps1.setString(7, session[i]);
            ps1.setString(8, period[i]);
        
            a=ps1.executeUpdate();
            }
            if(a==1 && l==1){
            	out.println("Successfully Applied");
		    }else{
            	out.println("Failed in Applying!");
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
}   */