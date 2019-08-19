package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
 
public class GESCaptureServlet extends HttpServlet {
     
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
    int count,not;
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
	    Connection connection=null;
    	Statement statement=null;
        ResultSet resultSet = null;
        HttpSession session=req.getSession();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy.HH.mm.ss");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String date=sdf.format(timestamp);
        
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String rollnumber=req.getParameter("rollnumber");
        String branch=req.getParameter("branch");
        String grad_year=req.getParameter("grad_year");
        String mobile=req.getParameter("mobile");
        String pg_adm_det=req.getParameter("pg_adm_det");
        String higher_studies_score=req.getParameter("higher_studies_score");
        String adm_det=req.getParameter("adm_det");
        String pl_status=req.getParameter("pl_status");
        int pe1=Integer.parseInt(req.getParameter("pe1"));
        int pe2=Integer.parseInt(req.getParameter("pe2"));
        int pe3=Integer.parseInt(req.getParameter("pe3"));
        int pe4=Integer.parseInt(req.getParameter("pe4"));
        int pe5=Integer.parseInt(req.getParameter("pe5"));
        int pe6=Integer.parseInt(req.getParameter("pe6"));
        int pe7=Integer.parseInt(req.getParameter("pe7"));
        int pe8=Integer.parseInt(req.getParameter("pe8"));
        
        String suggestions=req.getParameter("suggestions");
       
        int training_program=Integer.parseInt(req.getParameter("training_program"));
        int workshop=Integer.parseInt(req.getParameter("workshop"));
        int sports=Integer.parseInt(req.getParameter("sports"));
        
        String achievement=req.getParameter("achievement");
        String bvrith_pickedup=req.getParameter("bvrith_pickedup");
        String bvrith_like_most=req.getParameter("bvrith_like_most");
        String principal=req.getParameter("principal");
        
        String hod=req.getParameter("hod");
        String non_teaching=req.getParameter("non_teaching");
        String teaching=req.getParameter("teaching");
        String Amenities=req.getParameter("Amenities");
        String Library=req.getParameter("Library");
        String labs=req.getParameter("labs");
        String exam=req.getParameter("exam");
        String Administration=req.getParameter("Administration");
        
        String training=req.getParameter("training");
        String Discipline=req.getParameter("Discipline");
        String Ambience=req.getParameter("Ambience");
        String Classrooms=req.getParameter("Classrooms");
        String Medical=req.getParameter("Medical");
        String Overall=req.getParameter("Overall");
        String sugg_for_improve=req.getParameter("sugg_for_improve");
       
        try {
        	PrintWriter out=resp.getWriter();
         // Get Connection and Statement
        	connection = dataSource.getConnection();
            System.out.println("got connection:"+count+":\t"+connection.getClass());
            
            count++;
            PreparedStatement ps=connection.prepareStatement("insert into ges("
            		+ "rollnumber,name,dept,grad_year,placement_info,higher_studies_test,higher_studies_score,pg_admission_det,"
            		+ "email,mobile,pe1,pe2,pe3,pe4,pe5,pe6,pe7,pe8,suggestions,training_program,workshop,sports,"
            		+ "achievement,bvrith_pickedup,bvrith_like_most,principal,"
            		+ "hod,teaching,non_teaching,amenties,library,labs,exam_cell,administration,training_placement,discipline,"
            		+ "ambience,classrooms,medical_facililty,overall,improvements,survey_date) values"
            		+ "	(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,rollnumber);
            ps.setString(2, name);
            ps.setString(3, branch);
            ps.setString(4, grad_year);
            ps.setString(5, pl_status);
            ps.setString(6, pg_adm_det);
            ps.setString(7, higher_studies_score);        
            ps.setString(8,adm_det);
            ps.setString(9, email);
            ps.setString(10,mobile);
            ps.setInt(11, pe1);
            ps.setInt(12, pe2);
            ps.setInt(13, pe3);
            ps.setInt(14, pe4);
            ps.setInt(15, pe5);
            ps.setInt(16, pe6);
            ps.setInt(17, pe7);
            ps.setInt(18, pe8);
            ps.setString(19,suggestions);
            ps.setInt(20,training_program);
            ps.setInt(21,workshop);
            ps.setInt(22,sports);
            ps.setString(23,achievement);
            ps.setString(24,bvrith_pickedup);
            ps.setString(25,bvrith_like_most);
            ps.setString(26,principal);
            ps.setString(27,hod);
            ps.setString(28,teaching);
            ps.setString(29,non_teaching);
            ps.setString(30,Amenities);
            ps.setString(31,Library);
            ps.setString(32,labs);
            ps.setString(33,exam);
            ps.setString(34,Administration);
            ps.setString(35,training);
            ps.setString(36,Discipline);
            ps.setString(37,Ambience);
            ps.setString(38,Classrooms);
            ps.setString(39,Medical);
            ps.setString(40,Overall);
            ps.setString(41,sugg_for_improve);
            ps.setString(42,date);
            
            
            
            
            int noru= ps.executeUpdate();
           
        	//RequestDispatcher rd=req.getRequestDispatcher("courseEndFeedback.jsp");
    		//rd.include(req,resp);
         out.println("<script>alert('Your Exit Survey has been captured successfully');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/student/ges.jsp?rollnumber="+rollnumber+"' ;</script>"); 
			
    		System.out.println("GES captured");
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