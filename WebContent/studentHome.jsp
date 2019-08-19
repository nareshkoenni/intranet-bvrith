<meta charset="ISO-8859-1">
<title>MRECW</title>
</head>
<body style="background-color: silver;">

<table align="center" style="border:none"  width="500">
<tr valign=top>
<td style="border:none"><img src="images/clg.png" width="500" height="95"></td>
 
</tr>

</table><hr>
<h2 align="center" style="color: blue;">STUDENT CORNER</h2>
<table>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td>
<h4><a href="changePassword.jsp">Change Password</a></h4>
<h4><a href="studentDet.jsp">Student Information</a></h4>
<h4><a href="section.jsp">Feedback</a></h4>
<h4><a href="feedback.jsp">Time Table</a></h4>
<h4><a href="feedback.jsp">Internal Marks</a></h4>
<h4><a href="feedback.jsp">External Marks</a></h4>
<h4><a href="index.html">Logout</a></h4>

</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td align="right">
<table >
<tr>
<td><img align="middle" src="images/<%=(String)session.getAttribute("rollno")%>.jpg" height="100" width="100"/></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td><%=(String)session.getAttribute("rollno")%> <br/><%=(String)session.getAttribute("sname") %> <br/><%=(String)session.getAttribute("sem")%><br/><%=(String)session.getAttribute("section") %></td>
</tr>
</table>

</td>
</tr>
</table>

