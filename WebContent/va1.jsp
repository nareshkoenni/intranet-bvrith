<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
 


 
<%
	DataSource dataSource=null;

   try {
        // Get DataSource
        
        Context initContext  = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        dataSource = (DataSource)envContext.lookup("jdbc/mysql");
        System.out.println(dataSource);
    } catch (NamingException e) {
        e.printStackTrace();
    }



	//response.setContentType("text/html");
	Connection connection=null;
	ResultSet rs=null;
	ResultSet rs1=null;
	
	connection = dataSource.getConnection();
	String branch=request.getParameter("branch").toUpperCase();
	String section=request.getParameter("section");
	String sem=request.getParameter("sem");
	String date=request.getParameter("date");
	
	
    System.out.println("got connection from allocatedsubjects1 \t"+connection.getClass());
    Statement s=connection.createStatement();
    rs1=s.executeQuery("select distinct subject,period from attendance where date='"+date+"' and  branch='"+branch+"' and sem='"+sem+"' and section='"+section+"' ");
    

ArrayList periodList=new ArrayList();
ArrayList subjectList=new ArrayList();

while(rs1.next()){
	
	periodList.add(rs1.getString("period"));
	subjectList.add(rs1.getString("subject"));
}
//Iterator itr=periodSet.iterator();
for(int p=0;p<periodList.size();p++){
	session.setAttribute("periodList",periodList);
	session.setAttribute("subjectList",subjectList);
	


rs=s.executeQuery("select *from attendance where branch='"+branch+"' and sem='"+sem+"' and date='"+date+"' and section='"+section+"' and period='"+periodList.get(p)+"'");

while(rs.next()){
	out.println(rs.getString("absenties"));
 
}

}

connection.close();
System.out.println("connection closed");
%>
