
<%@page import="java.util.ResourceBundle"%>
<link href="intranetcss/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="intranetcss/style.css" rel="stylesheet" type="text/css" media="all" />

<script>
   
 $(document).ready(function()
 	{$( '.dropdown' ).hover(
function()
		{$(this).children('.sub-menu').slideDown(200);},


  function()
   {
$(this).children('.sub-menu').slideUp(200);});}); // end ready


</script>

<%
		
		ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
		String rollnumber=null;
 		if(session.getAttribute("rollnumber")== null){
			if(request.getParameter("rollnumber")!=null  || request.getParameter("rollnumber")!=""){
				rollnumber=request.getParameter("rollnumber");
				session.setAttribute("rollnumber", rollnumber);
				System.out.println("rollnumber captured------------->"+rollnumber);
			}else{ 
				response.sendRedirect("http://intranet.bvrithyderabad.edu.in:9000/intranet/logout.jsp");
			}
			
		}else{
			rollnumber=(String)session.getAttribute("rollnumber");
			System.out.println("session ------------->"+rollnumber);
		} 
			
		
	%>




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
<div style="width=150px;">
<a class="navbar-brand" href="index.html"><img src="images/logo.png" width="90" height="90" style="padding-left:0px; float:left;"></a>
<br/><br/><br/><br/><a class="navbar-brand" href="index.html">BVRITH</a>
</div>
</div>


<!-- Collect the nav links, forms, and other content for toggling -->
				

	<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1"> <!-- Brand and toggle get grouped for better mobile display -->
		<ul class="content clearfix" id="cl-effect-18">
			<li><a href="http://intranet.bvrithyderabad.edu.in/Student/Default.aspx">Home</a></li>
			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/courseEndFeedback.jsp?rollNumber=<%=rollnumber%>">Marks</a></li>
			
			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/getMarks.jsp?rollNumber=<%=rollnumber%>">Marks</a></li>
			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/getMarks.jsp?rollNumber=<%=rollnumber%>">Attendance</a></li>

		
 	    <li class="dropdown"><a class="dropdown-toggle" href="#">Library</a>
            <ul class="sub-menu">
         		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/libProfile.jsp?rollnumber=<%=rollnumber%>">Profile</a></li>
        		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/searchBook.jsp?rollnumber=<%=rollnumber%>">Book Search</a></li>
        	</ul>
        </li>
		<li class="dropdown"><a class="dropdown-toggle" href="#">News</a>
            <ul class="sub-menu">
				<li><a href="#">College News</a></li>
				<li><a href="#">Department News</a></li>
            </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#"><%=session.getAttribute("rollnumber")%></a>
        	 <ul class="sub-menu">
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/logout.jsp?rollnumber=<%=rollnumber%>">Logout</a></li>
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
