<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<%@ page import="java.text.* " %>
<%@ page import="java.net.*" %>


<%! private DataSource dataSource;
 %>
 
<%!
public void jspInit(){
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

%>
<%
	//response.setContentType("text/html");
	Connection connection=null;
	ResultSet rs=null;
	String title=request.getParameter("title");
	String subject=request.getParameter("subject");
	String dept=request.getParameter("dept");
	String author=request.getParameter("author");
	String publisher=request.getParameter("publisher");
	String place=request.getParameter("place");
	String prefix=request.getParameter("prefix");
	String accno=request.getParameter("accno");
	String classno=request.getParameter("classno");
	String callno=request.getParameter("callno");
	String noofcopies=request.getParameter("noofcopies");
	String invoiceno=request.getParameter("invoiceno");
	String invoicedate=request.getParameter("invoicedate");
	String year=request.getParameter("year");
	String typeofbinding=request.getParameter("typeofbinding");
	String language=request.getParameter("language");
	String pages=request.getParameter("pages");
	String edition=request.getParameter("edition");
	String cost=request.getParameter("cost");
	String discout=request.getParameter("discount");	
	String volume=request.getParameter("volume");	
	String rack=request.getParameter("rack");
	String course=request.getParameter("course");
	String supplier=request.getParameter("supplier");
	String remarks=request.getParameter("remarks");
	String issuebooks=request.getParameter("issuebooks");
	String refbooks=request.getParameter("refbooks");
	String category=request.getParameter("category");
	String type=request.getParameter("type");
	String enclose=request.getParameter("enclose");
	String isbn=request.getParameter("isbn");
	String uid=(String)session.getAttribute("uid");
	connection = dataSource.getConnection();
	PreparedStatement ps=connection.prepareStatement("insert into Book(title,subject,dept,author,publisher,place,prefix,accno,classno,callno,no_of_copies,invoiceno,invoice_date,year,type_of_binding,language,pages,edition,cost,discount,volume,course,supplier,remarks,no_of_issue_books,no_of_ref_books,category,type,enclose,isbn,creator,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,title);
	ps.setString(2,subject);
	ps.setString(3,dept);
	ps.setString(4,author);
	ps.setString(5,publisher);
	ps.setString(6,place);
	ps.setString(7,prefix);
	ps.setString(8,accno);
	ps.setString(9,classno);
	ps.setString(10,callno);
	ps.setString(11,noofcopies);
	ps.setString(12,invoiceno);
	ps.setString(13,invoicedate);
	ps.setString(14,year);
	ps.setString(15,typeofbinding);
	ps.setString(16,language);
	ps.setString(17,pages);
	ps.setString(18,edition);
	ps.setString(19,cost);
	ps.setString(20,discout);
	ps.setString(21,volume);
	ps.setString(22,course);
	ps.setString(23,supplier);
	ps.setString(24,remarks);
	ps.setString(25,issuebooks);
	ps.setString(26,refbooks);
	ps.setString(27,category);
	ps.setString(28,type);
	ps.setString(29,enclose);
	ps.setString(30,isbn);
	ps.setString(31,uid);
	ps.setString(32,"available");
	
	int noru=ps.executeUpdate();
	if(noru==1){
	 	 out.println("<script>alert('Successfully inserted ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/book.jsp?uid="+uid+"'</script>");
       	 System.out.println("Successfully Posted!");
      
	}else{
		 out.println("<script>alert('Failed ');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/book.jsp?uid="+uid+"'</script>");
	      
	}
	connection.close();
	System.out.println("connection closed");
%>
<br>

</body>
