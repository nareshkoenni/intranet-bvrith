<%@ page import="javax.naming.* " %>
<%@ page import="java.sql.* " %>
<%@ page import="javax.sql.* " %>
<%@ page import="java.util.* " %>
<%@ page import="java.text.* " %>
<%@ page import="java.net.*" %>


<body>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#date").datepicker();
  });
  $(document).ready(function() {
	    $("#date1").datepicker();
  });
  
  $(document).ready(function(){
	    $("select.sem").change(function(){
	        var selectedSem = $(".sem option:selected").val();
	        
	    });
	});
  </script>
  <script type="text/javascript">
  	
  
  </script>
  <style type="text/css">
	#serviceBox
{
  	width:100%;
    margin: 0 auto;
    margin-top:75px;
    height:250px;
    border:;
    
}
.serviceBox1, .serviceBox2, .serviceBox3{
    float:left;
   	width:12%;
    height: 250px; 
    background-color: ;
}
</style>
</head>
<%@include file="header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		



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
	connection = dataSource.getConnection();
	Statement s = connection.createStatement();
	String category= request.getParameter("category");
	String branch= request.getParameter("branch");
	String message= request.getParameter("message").trim();
	
	String strMobileSet=null;
	HashSet mobileSet=new HashSet();
	
	//rs1=s.executeQuery("select ")
	if(category.equals("T")){
		if(branch.equals("ALL")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='T' ");
				while(rs.next()){
					mobileSet.add("+91"+rs.getString("mobilenumber"));
				} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
		//	out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("CSE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='T' and branch='CSE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
		//	out.println(mobileSet.size());
		//	out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("ECE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='T' and branch='ECE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			out.println(mobileSet.size());
			out.println(strMobileSet);
			//out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("EEE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='T' and branch='EEE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("HBS")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='T' and branch='HBS' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("IT")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='T' and branch='IT' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}
	}else if(category.equals("NT")){
		if(branch.equals("ALL")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='NT' ");
				while(rs.next()){
					mobileSet.add("+91"+rs.getString("mobilenumber"));
				} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("CSE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='NT' and branch='CSE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("ECE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='NT' and branch='ECE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("EEE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='NT' and branch='EEE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("admin")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='NT' and branch='admin' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("HBS")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='NT' and branch='HBS' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("IT")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where role='NT' and branch='IT' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}
	}else if(category.equals("ALL")){
		if(branch.equals("ALL")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData");
				while(rs.next()){
					mobileSet.add("+91"+rs.getString("mobilenumber"));
				} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("CSE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where branch='CSE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("ECE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where branch='ECE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("EEE")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where branch='EEE' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("admin")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where branch='admin' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("HBS")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where branch='HBS' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}else if(branch.equals("IT")){
			ResultSet rs=s.executeQuery("select  distinct mobilenumber from FacultyMobileData  where branch='IT' ");
			while(rs.next()){
				mobileSet.add("+91"+rs.getString("mobilenumber"));
			} 
			strMobileSet=mobileSet.toString().replace("[", "").replace("]", "").replace(", ", ",");
			//out.println(mobileSet.size());
			//out.println(strMobileSet);
			out.println("<script>window.location = 'http://webprossms.webprosindia.com/submitsms.jsp?user=BVRITH&key=258f8ca44bXX&mobile="+strMobileSet+"&message="+message+"&senderid=BVRITH&accusage=1'</script>");
			//out.println(message);
			mobileSet.clear();
		}
	}
	connection.close();
	System.out.println("connection closed");
%>
<br>

</div>
		</div>
		
	</div>


<%@include file="footer.html" %>
</body>
