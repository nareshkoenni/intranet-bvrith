<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>

<%! private DataSource dataSource;

 %>
 
<%!
public void jspInit(){
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
%>
<body  style="background: silver;">

<%
String subject=request.getParameter("subject");
String subjectname=subject.substring(0, subject.lastIndexOf('-'));
String section=(String)session.getAttribute("section");
String rollno=(String)session.getAttribute("rollno");
int month=new java.util.Date().getMonth();
System.out.println("0:"+subject);
System.out.println("1:"+section);
System.out.println("2:"+subjectname);
System.out.println("3:"+rollno);

Connection connection=null;
ResultSet rs=null,rs1=null;  
connection = dataSource.getConnection();    
System.out.println("got connection from \t"+connection.getClass());
Statement s=connection.createStatement();

rs1=s.executeQuery("select rollno,nt,month from feedback where subject='"+subject+"' and section='"+section+"' and rollno='"+rollno+"'");
if(rs1.next()){     
    System.out.println("inside first if");
	if(rs1.getInt("nt")==1 && rs1.getInt("month")==month  )  {
		RequestDispatcher rd=request.getRequestDispatcher("section.jsp");
		rd.include(request, response);
		out.println("<h4 align='center' style='color:red;'>You already have given feedback to\t"+subjectname+ "\t in this month </h4>");

	}
}else{                                 
      
	Statement s1=connection.createStatement();
	rs=s1.executeQuery("select distinct tid,tname,subjectid,branch,sem from subjectallocation where section='"+section+"' and subjectid='"+subject+"' ");
	rs.next();
	String tid=rs.getString("tid").toUpperCase();
	String tname1=rs.getString("tname").substring(0, rs.getString("tname").indexOf('-')).toUpperCase();
	String subjectid=rs.getString("subjectid");
	session.setAttribute("tname",rs.getString("tname"));
	session.setAttribute("subjectid", subjectid);
	session.setAttribute("branch", rs.getString("branch"));
	session.setAttribute("sem", rs.getString("sem"));
	
	System.out.println(tid);
%>
<form action="fcs" method="POST" name="fb">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500 height="95"></h1><hr>
<h2 align="center"><font color="#6B90A0">STUDENT FEEDBACK FORM</font></h2>

<table border="">
<tr>
<th>Section</th>
<td colspan="6"><%=section %></td>
</tr>
<tr>
<th>Subject-code</th>
<td colspan="6"><%=subject %></td>
</tr>
<tr>

<th>Subject</th>
<td colspan="6"><%=subjectname %> </td>
</tr>
<tr>
<th>Faculty Name</th>
<td colspan="5"><img src='images/<%=tid%>.jpg' height="100" width="100"/></td>
<td bgcolor="yellow"><%=tid %> <br/> <%=tname1 %></td>
</tr>
<tr>
<th>&nbsp;</th>
<td colspan="6">Your frank and unbiased evaluation of the Teacher/Teaching helps the Teacher as well as the Department to improve Teaching-Learning Process. <b>You are requested to select only the registered subjects.</b> </td>
</tr>
<tr>
<th>Q.No</th>
<th>Question</th>
<th>Poor</th>
<th>Average</th>
<th>Good</th>
<th>Very Good</th>
<th>Excellent</th>
</tr>
<tr>
<td align="center">1</td>
<td>Knowledge in Subject</td>
<td align="center"><input type="radio" name="subjecKnowledge" value="6" /> </td>
<td align="center"><input type="radio" name="subjecKnowledge" value="7" /> </td>
<td align="center"><input type="radio" name="subjecKnowledge" value="8" /> </td>
<td align="center"><input type="radio" name="subjecKnowledge" value="9" /> </td>
<td align="center"><input type="radio" name="subjecKnowledge" value="10" /> </td>
</tr>
<tr>
<td align="center">2</td>
<td>Teaching Ability</td>
<td align="center"><input type="radio" name="ability" value="6"/> </td>
<td align="center"><input type="radio" name="ability" value="7"/> </td>
<td align="center"><input type="radio" name="ability" value="8"/> </td>
<td align="center"><input type="radio" name="ability" value="9"/> </td>
<td align="center"><input type="radio" name="ability" value="10"/> </td>
</tr>
<tr>
<td align="center">3</td>
<td>Clarification of Doubts</td>
<td align="center"><input type="radio" name="doubt" value="6"/> </td>
<td align="center"><input type="radio" name="doubt" value="7"/> </td>
<td align="center"><input type="radio" name="doubt" value="8"/> </td>
<td align="center"><input type="radio" name="doubt" value="9"/> </td>
<td align="center"><input type="radio" name="doubt" value="10"/> </td>
</tr>

<tr>
<td align="center">4</td>
<td>Efficiency in Communication</td>
<td align="center"><input type="radio" name="communicationSkills" value="6"/> </td>
<td align="center"><input type="radio" name="communicationSkills" value="7"/> </td>
<td align="center"><input type="radio" name="communicationSkills" value="8"/> </td>
<td align="center"><input type="radio" name="communicationSkills" value="9"/> </td>
<td align="center"><input type="radio" name="communicationSkills" value="10"/> </td>
</tr>
<tr>
<td align="center">5</td>
<td>Syllabus Coverage</td>
<td align="center"><input type="radio" name="syllabus" value="6"/> </td>
<td align="center"><input type="radio" name="syllabus" value="7"/> </td>
<td align="center"><input type="radio" name="syllabus" value="8"/> </td>
<td align="center"><input type="radio" name="syllabus" value="9"/> </td>
<td align="center"><input type="radio" name="syllabus" value="10"/> </td>
</tr>
<tr>
<td align="center">6</td>
<td>Standard of Question Paper</td>
<td align="center"><input type="radio" name="standard" value="6"/> </td>
<td align="center"><input type="radio" name="standard" value="7"/> </td>
<td align="center"><input type="radio" name="standard" value="8"/> </td>
<td align="center"><input type="radio" name="standard" value="9"/> </td>
<td align="center"><input type="radio" name="standard" value="10"/> </td>
</tr>

<tr>
<td align="center">7</td>
<td>Maintenance of Discipline</td>
<td align="center"><input type="radio" name="controll" value="6"/> </td>
<td align="center"><input type="radio" name="controll" value="7"/> </td>
<td align="center"><input type="radio" name="controll" value="8"/> </td>
<td align="center"><input type="radio" name="controll" value="9"/> </td>
<td align="center"><input type="radio" name="controll" value="10"/> </td>
</tr>
<tr>
<td align="center">8</td>
<td>Motivation & Encouragement</td>
<td align="center"><input type="radio" name="encouragement" value="6"/> </td>
<td align="center"><input type="radio" name="encouragement" value="7"/> </td>
<td align="center"><input type="radio" name="encouragement" value="8"/> </td>
<td align="center"><input type="radio" name="encouragement" value="9"/> </td>
<td align="center"><input type="radio" name="encouragement" value="10"/> </td>
</tr>
<tr>
<td align="center">9</td>
<td>Rapport with Students</td>
<td align="center"><input type="radio" name="rapport" value="6"/> </td>
<td align="center"><input type="radio" name="rapport" value="7"/> </td>
<td align="center"><input type="radio" name="rapport" value="8"/> </td>
<td align="center"><input type="radio" name="rapport" value="9"/> </td>
<td align="center"><input type="radio" name="rapport" value="10"/> </td>
</tr>
<tr>
<td align="center">10</td>
<td>Regularity in taking class</td>
<td align="center"><input type="radio" name="regularity" value="6"/> </td>
<td align="center"><input type="radio" name="regularity" value="7"/> </td>
<td align="center"><input type="radio" name="regularity" value="8"/> </td>
<td align="center"><input type="radio" name="regularity" value="9"/> </td>
<td align="center"><input type="radio" name="regularity" value="10"/> </td>
</tr>

<tr>
<td colspan="2" align="center"><a href="section.jsp">Back</a></td>
<th colspan="5" align="center"><input type="submit"  style=" background-color: red;" value="Submit"/></th>

</tr>
</table>
</form>
<%
	}

connection.close();
System.out.println("connection closed");

%>
</body>