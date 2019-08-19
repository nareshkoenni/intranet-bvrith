<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
 
<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<%@ page import="java.text.* " %>
<%@ page import="java.net.*" %>
<%! private DataSource dataSource,msdataSource;
 %>
 
<%!
public void jspInit(){
    try {
        // Get DataSource
        
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
        msdataSource = (DataSource)envContext.lookup("jdbc/testmysql");
        
    } catch (NamingException e) {
        e.printStackTrace();
    }
}

%>
<%
	//response.setContentType("text/html");
	Connection connection=null,msconnection=null;
	ResultSet rs=null,rs1=null;
	connection = dataSource.getConnection();
	msconnection = msdataSource.getConnection();
	
	String accno= request.getParameter("accno").trim();
	//String from_date= request.getParameter("date");
	String type= request.getParameter("type").trim();
	System.out.println("in student - type:"+type);
if(type.equals("issue")){
	String user= request.getParameter("rollNo").trim();
	
	// from_date is to be changed to to_date
	int no_of_books=0;
	Statement s1=connection.createStatement();
	rs1=s1.executeQuery("select count(user) from book_issue where  user='"+user+"' and status='issue'");
	if(rs1.next()){
		no_of_books=rs1.getInt(1);
	}
	if(no_of_books<3){
		Statement s=msconnection.createStatement();
		rs=s.executeQuery("select status,title from Book where  accno='"+accno+"'");
		if(rs.next()){
			if(rs.getString("status").contains("available")){
				no_of_books++;
				PreparedStatement ps=connection.prepareStatement("insert into book_issue(accnum,status,from_date,user,issuer,to_date,no_of_books,title) values(?,?,CURRENT_DATE,?,?,CURRENT_DATE + interval 14 DAY,?,?)");
				ps.setString(1, accno);
				ps.setString(2, "issue");
				ps.setString(3, user);
				ps.setString(4, "naresh.k");
				ps.setInt(5, no_of_books);
				ps.setString(6, rs.getString("title"));
				String title=rs.getString("title")+"-"+accno;
				int noru=ps.executeUpdate();
				PreparedStatement ps1=msconnection.prepareStatement("update Book set status='issue' where accno='"+accno+"' ");
				ps1.executeUpdate();
				System.out.println("sucess in lib issue\t"+noru);
				out.println("<script>alert(' "+title+" is Issued Successfully ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
			}else{
				out.println("<script>alert('Sorry book might be already issued');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
			}
		}else{
			out.println("<script>alert('Sorry book is not available');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
		}
	}else{
		out.println("<script>alert('Sorry Your books Limit is exceeded');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
	}
}else if(type.equals("renewal")){
	Statement s=connection.createStatement();
	Statement s1=msconnection.createStatement();
	ResultSet rs2=s1.executeQuery("select status,title from Book where  accno='"+accno+"'");
	if(rs2.next()){
		if(rs2.getString("status").contains("issue")){
	// from_date is to be changed to to_date
			rs=s.executeQuery("select CURRENT_DATE - to_date from book_issue where  accnum='"+accno+"' ");
			int days=0,penalty=0;
			if(rs.next()){
	 		  days=Integer.parseInt(rs.getString(1));
			}
			if(days<=15){
				penalty=days*2;
			}else if(days>15){
				penalty=days*4;
			}
			rs.close();
			String title=rs2.getString("title")+"-"+accno;
			System.out.println("ren penalty:"+penalty);
			PreparedStatement ps=connection.prepareStatement("update book_issue set status='issue',from_date=CURRENT_DATE,ren_date=CURRENT_DATE,penalty="+penalty+",penalty_status='paid',to_date=CURRENT_DATE + interval 14 DAY where accnum='"+accno+"' ");
			ps.executeUpdate();
			out.println("<script>alert('Renewal Success "+title+" ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
		}else{
			out.println("<script>alert('Sorry book cannot be Renewed');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
		}
	}
}else if(type.equals("return")){
	Statement s=connection.createStatement();
	Statement s1=msconnection.createStatement();
	ResultSet rs3=s1.executeQuery("select status,title from Book where  accno='"+accno+"'");
	if(rs3.next()){
		if(rs3.getString("status").contains("issue")){
			rs=s.executeQuery("select CURRENT_DATE - from_date from book_issue where  accnum='"+accno+"' ");
			int days=0,penalty=0;
			if(rs.next()){
	 		  days=Integer.parseInt(rs.getString(1));
			}
			if(days<=15){
				penalty=days*2;
			}else if(days>15){
				penalty=days*4;
			}
			rs.close();
			String title=rs3.getString("title")+"-"+accno;
			System.out.println("ret"+penalty);
			PreparedStatement ps=connection.prepareStatement("update book_issue set status='available',ret_date=CURRENT_DATE,penalty="+penalty+",penalty_status='paid' where accnum='"+accno+"' ");
			ps.executeUpdate();
			PreparedStatement ps1=msconnection.prepareStatement("update Book set status='available' where accno='"+accno+"' ");
			ps1.executeUpdate();
			out.println("<script>alert('Successfully Returned book "+title+" ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
		}else{
			System.out.println("can not be returned in student");
			out.println("<script>alert('Sorry book cannot be Returned');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
		}
   }else{
		out.println("<script>alert('Sorry book is not available');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
		
   }
}
	connection.close();
	System.out.println("connection closed");
%>
