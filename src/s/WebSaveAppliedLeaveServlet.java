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
import javax.xml.ws.Response;
 
public class WebSaveAppliedLeaveServlet extends HttpServlet {
     
    private DataSource dataSource,dataSource1;
    
     
    public void init() throws ServletException {   
        try {
            // Get DataSource
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
            dataSource1 = (DataSource)envContext.lookup("jdbc/testmysql");
          //  System.out.println(dataSource);
             
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
     	HttpSession sess=req.getSession();
     	String leaveType=req.getParameter("leaveType");
     	String noOfDays=req.getParameter("noOfDays").trim();
        String fromDate=req.getParameter("fromDate");
        String toDate=req.getParameter("toDate");
        String purpose=req.getParameter("purpose");
        
        
        String department[]=req.getParameterValues("dept[]");
        String sem[]=req.getParameterValues("sem[]");
        String section[]=req.getParameterValues("section[]");
        String adjustedDate[]=req.getParameterValues("date[]");
        String session[]=req.getParameterValues("session[]");
        String period[]=req.getParameterValues("period[]");
        String adjustedWithFaculty[]=req.getParameterValues("faculty[]");
        String uid=(String)sess.getAttribute("uid");
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
    		   ResultSet rs2=s.executeQuery("select count(*) as nohrpcount from leaves  where applicant_id ='"+uid+"' and leave_type='OneHrPerm' and applicant_dept='"+dept+"' and nohrpmonth='"+month+"'");
    		   if(rs2.next()){
    			   
    			   if(rs2.getInt("nohrpcount")>=2){
        			 out.println("<script>alert('Sorry! You already have availed Two One Hour Permissons in this month');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid="+uid+"'</script>");
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
    					   if(department[i].equals("-Select-") && sem[i].equals("-Select-") && section[i].equals("-Select-") && session[i].equals("-Select-") && period[i].equals("-Select-") && adjustedWithFaculty[i].equals("-Select-")){
    						   out.println("<script>alert('Successfully Applied');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid="+uid+"'</script>");
    					   }else{
    						   a=ps1.executeUpdate();
    					   }
    				   }
    				   if(a==1 && l==1){
    					   out.println("<script>alert('Successfully Applied');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid="+uid+"'</script>");
    				   }else{
    					   out.println("<script>alert('Failed in Applying Leave!');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid="+uid+"'</script>");
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
                	 if(department[i].equals("-Select-") && sem[i].equals("-Select-") && section[i].equals("-Select-") && session[i].equals("-Select-") && period[i].equals("-Select-") && adjustedWithFaculty[i].equals("-Select-")){
                	 }else{
                		 noOfAdjustments++;
                	 }
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
                 if(department[i].equals("-Select-") && sem[i].equals("-Select-") && section[i].equals("-Select-") && session[i].equals("-Select-") && period[i].equals("-Select-") && adjustedWithFaculty[i].equals("-Select-")){
                	 //out.println("<script>alert('Successfully Applied');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid="+uid+"'</script>");
                 }else{
                	 a=ps1.executeUpdate();
                 }
                 }
               out.println("<script>alert('Successfully Applied');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid="+uid+"'</script>");
             	
                
             
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