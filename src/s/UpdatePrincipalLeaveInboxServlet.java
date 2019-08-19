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
 
public class UpdatePrincipalLeaveInboxServlet extends HttpServlet {
     
    private DataSource dataSource;
    
     
    public void init() throws ServletException {
        try {   
            // Get DataSource   
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource)envContext.lookup("jdbc/testmysql");
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
	    
    	 PreparedStatement ps1=null, ps=null;
    	 PrintWriter out=resp.getWriter();
    	 ResultSet rs1=null,rs2=null,rs3=null;
    	 HttpSession session=req.getSession();
         String uid=req.getParameter("uid").trim();
         String status=req.getParameter("status");
         String leaveId=req.getParameter("leaveId");
         String reason=req.getParameter("reason");
         System.out.println("reason"+reason);
         
     	try {      
			connection=dataSource.getConnection();
			int noru=0;
			ps=connection.prepareStatement("update leaves set principalstatus=?,rejectreason=?  where id=? ");
		    ps.setString(1, status);
		    ps.setString(2, reason);
		    ps.setString(3, leaveId);
            noru=ps.executeUpdate();  
            if(noru==1){
            	if(reason.equals("")){
        			
				Statement s=connection.createStatement();
				rs1=s.executeQuery("select leave_type,numdays,applicant_id from leaves where id='"+leaveId+"' ");
				rs1.next();
				String leaveType=rs1.getString("leave_type").trim();
				String applicant_id=rs1.getString("applicant_id").trim();
				double numdays=Double.parseDouble(rs1.getString("numdays").trim());
				if(leaveType.equals("Casual Leave (CL)")){
					rs2=s.executeQuery("select clcredit,cldebit,clbalance from leaveinfo where faculty='"+applicant_id+"'");
					rs2.next();
					double clcredit=Double.parseDouble(rs2.getString("clcredit").trim());
					double cldebit=Double.parseDouble(rs2.getString("cldebit").trim());
					double clbalance=Double.parseDouble(rs2.getString("clbalance").trim());
					cldebit=cldebit+numdays;
					clbalance=clcredit-cldebit;
					System.out.println("CLBAL"+clbalance+"=CLCRED"+clcredit+"-CLDEB"+cldebit);
					ps1=connection.prepareStatement("update leaveinfo set cldebit='"+cldebit+"' , clbalance='"+clbalance+"' where faculty='"+applicant_id+"'");
					ps1.executeUpdate();
				}else if(leaveType.equals("Earned Leave (EL)")){
					rs3=s.executeQuery("select elcredit,eldebit,elbalance from leaveinfo where faculty='"+applicant_id+"'");
					rs3.next();
					double elcredit=Double.parseDouble(rs3.getString("elcredit").trim());
					double eldebit=Double.parseDouble(rs3.getString("eldebit").trim());
					double elbalance=Double.parseDouble(rs3.getString("elbalance").trim());
					eldebit=eldebit+numdays;
					elbalance=elcredit-eldebit;
					System.out.println("ELBAL"+elbalance+"=ELCRED"+elcredit+"-ELDEB"+eldebit);
					ps1=connection.prepareStatement("update leaveinfo set eldebit='"+eldebit+"' , elbalance='"+elbalance+"' where faculty='"+applicant_id+"'");
					ps1.executeUpdate();
				}else if(leaveType.equals("Sick Leave (SL)")){
					rs2=s.executeQuery("select slcredit,sldebit,slbalance from leaveinfo where faculty='"+applicant_id+"'");
					rs2.next();
					double slcredit=Double.parseDouble(rs2.getString("slcredit").trim());
					double sldebit=Double.parseDouble(rs2.getString("sldebit").trim());
					double slbalance=Double.parseDouble(rs2.getString("slbalance").trim());
					sldebit=sldebit+numdays;
					slbalance=slcredit-sldebit;
					System.out.println("SLBAL"+slbalance+"=SLCRED"+slcredit+"-SLDEB"+sldebit);
					ps1=connection.prepareStatement("update leaveinfo set sldebit='"+sldebit+"' , slbalance='"+slbalance+"' where faculty='"+applicant_id+"'");
					ps1.executeUpdate();
				}else if(leaveType.equals("Academic Leave (AL)")){
					rs2=s.executeQuery("select alcredit,aldebit,albalance from leaveinfo where faculty='"+applicant_id+"'");
					rs2.next();
					double alcredit=Double.parseDouble(rs2.getString("alcredit").trim());
					double aldebit=Double.parseDouble(rs2.getString("aldebit").trim());
					double albalance=Double.parseDouble(rs2.getString("albalance").trim());
					aldebit=aldebit+numdays;
					albalance=alcredit-aldebit;
					System.out.println("ALBAL"+albalance+"=ALCRED"+alcredit+"-ALDEB"+aldebit);
					ps1=connection.prepareStatement("update leaveinfo set aldebit='"+aldebit+"' , albalance='"+albalance+"' where faculty='"+applicant_id+"'");
					ps1.executeUpdate();
				}else if(leaveType.equals("Compensatory Casual Leave(CCL)")){
					rs2=s.executeQuery("select cclcredit,ccldebit,cclbalance from leaveinfo where faculty='"+applicant_id+"'");
					rs2.next();
					double cclcredit=Double.parseDouble(rs2.getString("cclcredit").trim());
					double ccldebit=Double.parseDouble(rs2.getString("ccldebit").trim());
					double cclbalance=Double.parseDouble(rs2.getString("cclbalance").trim());
					ccldebit=ccldebit+numdays;
					cclbalance=cclcredit-ccldebit;
					System.out.println("CCLBAL"+cclbalance+"=CCLCRED"+cclcredit+"-CCLDEB"+ccldebit);
					ps1=connection.prepareStatement("update leaveinfo set ccldebit='"+ccldebit+"' , cclbalance='"+cclbalance+"' where faculty='"+applicant_id+"'");
					ps1.executeUpdate();
				}
				out.println("<script>alert('Successfully Updated Thank You');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/principalLeaveInbox.jsp?uid="+uid+"'</script>");
				System.out.println("Successfully Updated!");
           }else{
       		out.println("<script>alert('Successfully Updated Thank You');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/principalLeaveInbox.jsp?uid="+uid+"'</script>");
    	   }
          }//noru
      	}catch (Exception e) {
   		 	e.printStackTrace();
   		 	System.out.println("not able to get the connection");
   	 	 }
        try{
   		 connection.close();
   		 System.out.println("connection closed");
   	 	}catch(Exception e){}
   	}
}   