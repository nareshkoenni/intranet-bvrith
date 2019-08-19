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
import java.util.Enumeration;
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
 
public class PostAttendenceServlet extends HttpServlet {
     
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
    	 ResultSet resultSet = null;
        String date=req.getParameter("date");
        String sem=req.getParameter("sem");
        String branch=req.getParameter("branch");
        String section=req.getParameter("section");
        String subject=req.getParameter("course");
        String period=req.getParameter("period");
        String absenties[]=req.getParameterValues("absenties");
        HttpSession session=req.getSession();
        String uid=(String)session.getAttribute("uid");
        String topic=req.getParameter("topic");
        ArrayList rollList=(ArrayList)session.getAttribute("rollList");
        System.out.println(rollList);
      //  Integer attendance[]=new Integer[rollList.size()];
        ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
        String acyear=rb.getString(sem);
        System.out.println("acyear-----:"+acyear);
        PrintWriter out=resp.getWriter();
    	
        if(period.equals("choose")){
			out.println("<script>alert('Period can not be Empty');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/postAttendance.jsp?uid="+uid+"'</script>"); 
		}
        try {
        	connection = dataSource.getConnection();
         //   System.out.println("got connection:"+count+":\t"+connection.getClass());
            PreparedStatement ps=null,ps1=null;
            Statement s=connection.createStatement();
			ResultSet rs= s.executeQuery("select *from attendance where period='"+period+"' and date='"+date+"' and sem='"+sem+"' and section='"+section+"' and branch='"+branch+"' ");
			if(rs.next() && !subject.contains("LAB")){
					out.println("<script>alert(' Attendance was already posted  for Period-"+period+" ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/postAttendance.jsp?uid="+uid+"'</script>"); 
			}else{  
            int k=2;
            for (int i=0;i<rollList.size();i++){
            	if(absenties==null){
            		k=1;
            	}else{
            		for(int j=0;j<absenties.length;j++){
            			if(absenties[j].toString().trim().contains(rollList.get(i).toString().trim())){
            				k=0;
            				j=rollList.size()+10;
            			}else if(j==absenties.length-1){
            				k=1;
            			}	
            		}
            	}
            	ps=connection.prepareStatement("insert into attendance(rollNumber,date,sem,branch,section,subject,period,attendance,acyear,topic) values(?,?,?,?,?,?,?,?,?,?)");
                 ps.setString(1, (String)rollList.get(i));
                 ps.setString(2, date);
                 ps.setString(3, sem);
                 ps.setString(4, branch);
                 ps.setString(5, section);
                 ps.setString(6, subject);
                 ps.setString(7, period);
                 ps.setInt(8,k);
                 ps.setString(9, acyear);
                 ps.setString(10, topic);
                 
                 
                 ps.executeUpdate();
            }
           
            
        //    if(==1){
            	//RequestDispatcher rd=req.getRequestDispatcher("postAttendance.jsp");
            //	rd.include(req,resp);   
            //	out.println(" <script type='text/javascript'>alert('Attendance was posted successfully for Period-"+period+"("+subject+")')</script>  ");
            out.println("<script>alert(' Attendance was posted successfully for Period-"+period+"("+subject+") ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/postAttendance.jsp?uid="+uid+"'</script>"); 
			System.out.println("Attendence was posted by"+uid);   
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