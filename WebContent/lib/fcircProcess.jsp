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
        
        System.out.println(dataSource);
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
	//String from_date= request.getParameter("from_date");
	String type= request.getParameter("type").trim();
	System.out.println("in fac type:"+type);

if(type.equals("issue")){
	String user= request.getParameter("user");
	int no_of_books=0;
	Statement s1=connection.createStatement();
	rs1=s1.executeQuery("select count(user) from book_issue where  user='"+user+"' and status='issue'");
	if(rs1.next()){
		no_of_books=rs1.getInt(1);
	}
	System.out.println("noofbooks"+no_of_books);
	if(no_of_books<6){
		Statement s=msconnection.createStatement();
		// from_date is to be changed to to_date
		rs=s.executeQuery("select status,title from Book where  accno='"+accno+"'");
		if(rs.next()){
			if(rs.getString("status").contains("available")){
				no_of_books++;
				PreparedStatement ps=connection.prepareStatement("insert into book_issue(accnum,status,from_date,user,issuer,to_date,no_of_books,title) values(?,?,CURRENT_DATE,?,?,CURRENT_DATE + interval 15 DAY,?,?)");
				ps.setString(1, accno);
				ps.setString(2, "issue");
				ps.setString(3, user);
				ps.setString(4, "naresh.k");
				ps.setInt(5,no_of_books);
				ps.setString(6, rs.getString("title"));
				int noru=ps.executeUpdate();
				PreparedStatement ps1=msconnection.prepareStatement("update Book set status='issue' where accno='"+accno+"' ");
				ps1.executeUpdate();
				System.out.println("sucess in lib issue\t"+noru);
				out.println("<script>alert(' Successfully Isseud book "+accno+" ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/fcirculation.jsp'</script>"); 
			}else{
				out.println("<script>alert('Sorry book might be already issued');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/fcirculation.jsp'</script>"); 
			}
		}else{
			out.println("<script>alert('Sorry book is not available');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/fcirculation.jsp'</script>"); 
		}
	}else{
		out.println("<script>alert('Sorry Your books Limit is exceeded');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
	}
}else if(type.equals("return")){
	Statement s=connection.createStatement();
	Statement s1=msconnection.createStatement();
	rs=s1.executeQuery("select status from Book where  accno='"+accno+"'");
	if(rs.next()){
		if(rs.getString("status").contains("issue")){
			rs=s.executeQuery("select CURRENT_DATE - from_date from book_issue where  accnum='"+accno+"' ");
			int penalty=0;
			PreparedStatement ps=connection.prepareStatement("update book_issue set status='available',ret_date=CURRENT_DATE,penalty="+penalty+",penalty_status='paid' where accnum='"+accno+"' ");
			ps.executeUpdate();
			PreparedStatement ps1=msconnection.prepareStatement("update Book set status='available' where accno='"+accno+"' ");
			ps1.executeUpdate();
			out.println("<script>alert('Successfully Returned book "+accno+" ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/fcirculation.jsp'</script>"); 
		}else{
			System.out.println("returned in faculty");
			out.println("<script>alert('Sorry book cannot be Returned');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
		}
	}else{
		out.println("<script>alert('Sorry book is not available');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp'</script>"); 
	}
}
	connection.close();
	System.out.println("connection closed");
%>
