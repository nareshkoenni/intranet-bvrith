<%
	//session.setAttribute("uid", null);
	//session.invalidate();
	session.removeAttribute("uid");
	session.invalidate();
	response.sendRedirect("http://intranet.bvrithyderabad.edu.in/Secured/Logout.aspx");
	
	
	
%>