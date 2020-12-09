
<%@page import="java.util.ResourceBundle"%>
<link href="intranetcss/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="http://intranet.bvrithyderabad.edu.in:9000/intranet/intranetcss/style.css" rel="stylesheet" type="text/css" media="all" />

<script>
   
 $(document).ready(function()
 	{$( '.dropdown' ).hover(
function()
		{$(this).children('.sub-menu').slideDown(200);},


  function()
   {
$(this).children('.sub-menu').slideUp(200);});}); // end ready


</script>






<!-- banner -->
	<div class="banner1">
<div class="banner-info1">
<div class="container">
<nav class="navbar navbar-default">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">BVRIT navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
 </button>

<%
		
		String rollnumber=null;
 		if(session.getAttribute("rollnumber")== null){
			if(request.getParameter("rollnumber")!=null  || request.getParameter("rollnumber")!=""){
				rollnumber=request.getParameter("rollnumber");
				session.setAttribute("rollnumber", rollnumber);
				System.out.println("rollnumber captured------------->"+rollnumber);
			}else{ 
				response.sendRedirect("http://intranet.bvrithyderabad.edu.in:9000/intranet/student/logout.jsp");
			}
			
		}else{
			rollnumber=(String)session.getAttribute("rollnumber");
			System.out.println("session ------------->"+rollnumber);
		} 
			
		
	%>

<!-- Collect the nav links, forms, and other content for toggling -->
				

	<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1"> <!-- Brand and toggle get grouped for better mobile display -->
		<ul class="content clearfix" id="cl-effect-18">
			<li><a href="http://intranet.bvrithyderabad.edu.in/Student/Default.aspx">Home</a></li>
			<%if(!rollnumber.contains(".p")){ %>
					<li class="dropdown"><a class="dropdown-toggle" href="#">Feedback</a>
        	    		<ul class="sub-menu">
        	 				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/courseEndFeedback.jsp?rollnumber=<%=rollnumber%>">CourseEndSurvey</a></li>
						<!-- 	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/tlfeedback.jsp?rollnumber=<%=rollnumber%>">T-LFeedback</a></li>  -->
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/facilitiesFeedback.jsp?rollnumber=<%=rollnumber%>">FacilityFeedback</a></li>
							
						</ul>
        			</li>
					<%} %>
			<li class="dropdown"><a class="dropdown-toggle" href="#">StudentInfo</a>
        	    <ul class="sub-menu">
						
					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/studentMarks.jsp?rollnumber=<%=rollnumber%>">Marks</a></li>
					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/studentAttendance.jsp?rollnumber=<%=rollnumber%>">Attendance</a></li>
				    <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/achievements.jsp?rollnumber=<%=rollnumber%>">Achievements</a></li>
	            </ul>
        	</li>   
        	
		    <li class="dropdown"><a class="dropdown-toggle" href="#">Library</a>
        	    <ul class="sub-menu">
        	 		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/libProfile.jsp?rollnumber=<%=rollnumber%>">Profile</a></li>
        			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/searchBook.jsp?rollnumber=<%=rollnumber%>">BookSearch</a></li>
        		</ul>
        	</li>
        	   <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/ges.jsp?rollnumber=<%=rollnumber%>">GraduateExitSurvey</a></li>
	           <li class="dropdown"><a class="dropdown-toggle" href="#">Grievance</a>
        	 <ul class="sub-menu">
				   <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/grievance.jsp?rollnumber=<%=rollnumber%>">Raise</a></li>
          	       <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/viewGrievances.jsp?rollnumber=<%=rollnumber%>">View</a></li>
          
           
            </ul>
        </li>
        		
			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/about.jsp">About</a></li>
			
        <li class="dropdown"><a class="dropdown-toggle" href="#"><%=session.getAttribute("rollnumber")%></a>
        	 <ul class="sub-menu">
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/student/logout.jsp?rollnumber=<%=rollnumber%>">Logout</a></li>
            </ul>
        </li>
 	</ul>

</div>   <!-- Brand and toggle get grouped for better mobile display -->
</div>  

	<!-- /.navbar-collapse -->

</nav>
			</div>
		</div>
	</div>
<!-- //banner -->
<!-- for bootstrap working -->
	
<!-- //for bootstrap working -->
