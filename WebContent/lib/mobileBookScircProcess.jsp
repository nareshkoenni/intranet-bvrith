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
	//String from_date= request.getParameter("from_date");
	String type= request.getParameter("type").trim();
	if(type.equals("issue")){
		String user= request.getParameter("rollNo").trim();
		// from_date is to be changed to to_date
		int no_of_books=0;
		Statement s1=connection.createStatement();
		rs1=s1.executeQuery("select count(user) from book_issue where  user='"+user+"' and status='issue'");
		if(rs1.next()){
			no_of_books=rs1.getInt(1);
		}
		System.out.println("nob:"+no_of_books);
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
					int noru=ps.executeUpdate();
					PreparedStatement ps1=msconnection.prepareStatement("update Book set status='issue' where accno='"+accno+"' ");
					ps1.executeUpdate();
					System.out.println("sucess in lib issue\t"+noru);
					out.println("Successfully Issued book"+accno); 
				}else{
					out.println("Sorry book might be already issued"); 
				}
			}else{
				out.println("Sorry book is not available"); 
			}
		}else{
			out.println("Sorry Your books Limit is exceeded"); 
		}
	}else if(type.equals("renewal")){
		Statement s=connection.createStatement();
		Statement s1=msconnection.createStatement();
		rs=s1.executeQuery("select status from Book where  accno='"+accno+"'");
		if(rs.next()){
			if(rs.getString("status").contains("issue")){
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
				if(penalty<0){
					penalty=0;
				}
				System.out.println("ren penalty:"+penalty);
					PreparedStatement ps=connection.prepareStatement("update book_issue set status='issue',from_date=CURRENT_DATE,ren_date=CURRENT_DATE,penalty="+penalty+",penalty_status='paid',to_date=CURRENT_DATE + interval 14 DAY where accnum='"+accno+"' ");
					ps.executeUpdate();
					out.println("Renewal Success "+accno); 
			}else{
				out.println("Sorry book cannot be Renewed"); 
			}
		}else{
			out.println("Sorry book is not available"); 
		}
	}else{
		Statement s=connection.createStatement();
		Statement s1=msconnection.createStatement();
		rs=s1.executeQuery("select status from Book where  accno='"+accno+"'");
		if(rs.next()){
			if(rs.getString("status").contains("issue")){
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
				System.out.println("ret"+penalty);
				PreparedStatement ps=connection.prepareStatement("update book_issue set status='available',ret_date=CURRENT_DATE,penalty="+penalty+",penalty_status='paid' where accnum='"+accno+"' ");
				ps.executeUpdate();
				PreparedStatement ps1=msconnection.prepareStatement("update Book set status='available' where accno='"+accno+"' ");
				ps1.executeUpdate();
				out.println("Successfully Returned book"+accno); 
			}else{
				out.println("Sorry book cannot be Returned"); 
			}
   		}else{
   			out.println("Sorry book is not available"); 
		}
	}
	connection.close();
	System.out.println("connection closed");
%>
