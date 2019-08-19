
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

<%
		response.setHeader("Pragma", "no-cache");
		response.setHeader( "Cache-Control", "no-cache" );
		response.setHeader( "Cache-Control", "no-store" );
		response.setDateHeader( "Expires", 0 );
		ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
		String uid=null;
 		if(session.getAttribute("uid")== null){
			if(request.getParameter("uid")!=null  || request.getParameter("uid")!=""){
				uid=request.getParameter("uid");
				session.setAttribute("uid", uid);
				System.out.println("uid captured------------->"+uid);
			}else{ 
				response.sendRedirect("http://intranet.bvrithyderabad.edu.in:9000/intranet/logout.jsp");
			}
			
		}else{
			uid=(String)session.getAttribute("uid");
			System.out.println("session ------------->"+uid);
		} 
			
		
	%>




<!-- banner -->
	<div class="banner1">
<div class="banner-info1">
  <div class="container"> 
<nav class="navbar navbar-default">
<!-- 
Brand and toggle get grouped for better mobile display 
<div class="navbar-header">
 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">BVRIT navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
 </button>
</div>
-->

<!-- Collect the nav links, forms, and other content for toggling -->
				

	<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1"> <!-- Brand and toggle get grouped for better mobile display -->
		<ul class="content clearfix" id="cl-effect-18">
			<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/Default.aspx">Home</a></li>
		    <li class="dropdown"><a href="#">Faculty</a>
				<ul class="sub-menu">
					<li class="dropdown"><a class="dropdown-toggle" href="#">Service Register</a>
	                  	<ul class="sub-menu">
							<li class="dropdown"><a class="dropdown-toggle" href="#">Update</a>
								<ul class="sub-menu">
				                    <li><a href="http://intranet.bvrithyderabad.edu.in/Secured/ServiceRegister.aspx">Personal Details</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/Facultyaddress.aspx">Address</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/FacultyBankDetails.aspx">Bank Details</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/FacultySalaryDetails.aspx">Salary Details</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/FacultyAcademicDetails.aspx">Academic Details</a></li>
									<li><a href="#">Time Table</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/ResultAnalysis.aspx">Result Analysis</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/FeedbackAnalysis.aspx">Student Feedback</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/ProfessionalExperience.aspx">Professional Experience</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/FacultyDocuments.aspx">Upload Document Proofs</a></li>
									<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/Achievements.aspx">Faculty Awards</a></li> 
				                </ul>
	                        </li>
							<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/FacltyDetails.aspx">Info</a></li>
                        </ul>
					</li>
					
                    <li class="dropdown"><a class="dropdown-toggle" href="#">Lesson Plan</a>
						<ul class="sub-menu">
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/coursePlan.jsp?uid=<%=uid%>">Add</a></li>
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/updateCoursePlan.jsp?uid=<%=uid%>">Update</a></li>
                        	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewCoursePlan.jsp?uid=<%=uid%>">View/Report</a></li>
                        	
                        	
						</ul>
 					</li>	
					<li class="dropdown"><a class="dropdown-toggle" href="#">Projects Guided</a>
						<ul class="sub-menu">
	                   		<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/ProjectGuided.aspx">Mini</a></li>
                        	<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/ProjectGuided.aspx">Major</a></li>
						</ul>
 					</li>	
					<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/UploadFiles.aspx">Assignments</a></li>
					<li class="dropdown"><a class="dropdown-toggle" href="#">Study Materials</a>
						<ul class="sub-menu">
	               	        <li><a href="http://intranet.bvrithyderabad.edu.in/Secured/Shareuploadedfiles.aspx">Share Files</a></li>
							<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/sharedviewuploadedfiles.aspx">View share Files</a></li>
							<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/UploadFiles.aspx">Upload and Share</a></li>
                        	<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/viewuploadedfiles.aspx">View and download</a></li>
							<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/DeleteFiles">Delete Files</a></li>
						</ul>
 					</li>
					<li class="dropdown"><a class="dropdown-toggle" href="#">Student Attendance</a>
						<ul class="sub-menu">
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/postAttendance.jsp?uid=<%=uid%>">Post Attendance</a></li>
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewAttendance.jsp?uid=<%=uid%>">View Day</a></li>
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewFortAttendance.jsp?uid=<%=uid%>">View FortNight</a></li>
							<%
 	    		 	
 	          		try{
 	    				if(rb.getString(uid).equals("classteacher")){
 	        				%>
 	        				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewAttendanceCT.jsp?uid=<%=uid%>">View Class</a></li>
 	        				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/assignSubject.jsp?uid=<%=uid%>">Assign Subject</a></li>
 	        				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/allocatedSubjects.jsp?uid=<%=uid%>">Allocated Subjects</a></li>
 	        				
 	        				<% 		
 	       	 			}
 	    				
 	    	 	  	}catch(Exception e){
 	       	 			//e.printStackTrace();
 	       	 		}
 	          		
 	    		%>
						</ul>
					</li>
					<li class="dropdown"><a class="dropdown-toggle" href="#">Course End Survey</a>
						<ul class="sub-menu">
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/courseEndSurvey.jsp?uid=<%=uid%>">CO Updation</a></li>
							<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewCourseEndSurvey.jsp?uid=<%=uid%>">Report</a></li>
						</ul>
					</li>	
					<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/SExitSurveyReportGeneration.aspx">Grad Exit Survey</a></li>
					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewTLFeedback.jsp?uid=<%=uid%>">T-L Feedback</a></li>
					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewFFB.jsp?uid=<%=uid%>">FaciltyFeedback Report</a></li>
	        	        
	         </ul>
		</li>
		<li class="dropdown"><a class="dropdown-toggle" href="#">Achievements</a>
            <ul class="sub-menu">
	            <li class="dropdown"><a class="dropdown-toggle" href="#" >Publications</a>
					<ul class="sub-menu">
	               		<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/Publications.aspx">Conferences</a></li>
                        <li><a href="http://intranet.bvrithyderabad.edu.in/Secured/JournalPublications.aspx">Journals</a></li>
					</ul>
               	</li>
             	<li class="dropdown"><a class="dropdown-toggle" href="#">Conducted</a>
					<ul class="sub-menu">
	               		<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/FacultyWorkshopConductionList.aspx">Update</a></li>
                        <li><a href="http://intranet.bvrithyderabad.edu.in/Secured/ConductionEdit.aspx">Report</a></li>
					</ul>
				</li>
                <li class="dropdown"><a class="dropdown-toggle" href="http://intranet.bvrithyderabad.edu.in/Secured/FacultyParticipations.aspx">Participation</a>
					
 				</li>	
 				
			</ul>
        </li>
		<li class="dropdown"><a class="dropdown-toggle" href="#">Student</a>
			<ul class="sub-menu">
	            <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/achievements.jsp?uid=<%=uid%>">Achievements</a></li>
                <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/studentProfile.jsp?uid=<%=uid%>">Profile</a></li>
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/studentMarks.jsp?uid=<%=uid%>">Marks</a></li>
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/studentAttendance.jsp?uid=<%=uid%>">Attendance</a></li>
				
 			</ul>
        </li>
   <!-- 
 	    <li class="dropdown"><a href="#">e-Leave</a>
 	    	<ul class="sub-menu">
 	    	
 	    		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveProfile.jsp?uid=<%=uid%>">Profile</a></li>
 	    		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveApply.jsp?uid=<%=uid%>">Apply</a></li>
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/adjustInbox.jsp?uid=<%=uid%>">Adjust Inbox</a></li>
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveRules.jsp?uid=<%=uid%>">Leave Rules</a></li>
 	    		<%
 	    			try{
 	    				if(rb.getString(uid).equals("hod")){
 	    		%>
 	        				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/hodLeaveInbox.jsp?uid=<%=uid%>">Leave Inbox</a></li>
 	        	<% 		
 	       	 			}
 	    				if(rb.getString(uid).equals("principal")){
 	    	 	%>
 	    	 	        	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/principalLeaveInbox.jsp?uid=<%=uid%>">Leave Inbox</a></li>
 	    	 	<% 		
 	    	 	       	 }
 	    				if(rb.getString(uid).equals("admin")){
 	    	 	%>
 	     	 	        	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/adminLeaveInbox.jsp?uid=<%=uid%>">Leave Inbox</a></li>
 	    	 	        	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveEntry.jsp?uid=<%=uid%>">Leave Entry</a></li>
 	    	 	        	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/trackLeaves.jsp?uid=<%=uid%>">Track Leaves</a></li>
 	    	 	        	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/leaveSummary.jsp?uid=<%=uid%>">Summary</a></li>
 	    	 	<% 		
 	    	 	    	 	       	 }
 	    	 	    	 	
 	    			}catch(Exception e){
 	       	 			//e.printStackTrace();
 	       	 		}
 	          		
 	    		%>
 	    		
            </ul>
 	    </li>
 	     -->
 	    <%
 	    		try{
 	    			if(rb.getString(uid).equals("hod") || rb.getString(uid).equals("classteacher") || rb.getString(uid).equals("principal") || rb.getString(uid).equals("admin")){
 	    			System.out.println("SMS:\t"+uid);
 	    %>
 	   				<li class="dropdown"><a href="#">SMS</a>
 	   					<ul class="sub-menu">
 	    					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/sendSMST.jsp?uid=<%=uid%>">Staff</a></li>	
 	   						<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/sendSMSSP.jsp?uid=<%=uid%>">Student/Parent</a></li>
 	    					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/sendASMS.jsp?uid=<%=uid%>">Specific Parents</a></li>
 	    					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/sendSMSSS.jsp?uid=<%=uid%>">Specific Students</a></li>
 	    					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/sendSMSExcel.jsp?uid=<%=uid%>">SMS Excel</a></li>
 	    					<li class="dropdown"><a href="#">Delivery Report</a>
 	  							<ul class="sub-menu">
	               					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/smsReport.jsp?uid=<%=uid%>">By Roll Number</a></li>
                       				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/smsReportDay.jsp?uid=<%=uid%>">By Date</a></li>
                       			</ul>
							</li>
						</ul>
               	
 	    				
 	   				</li>
 	    <% 		
 	    	 	    }
 	    		}catch(Exception e){
 	       	 			//e.printStackTrace();
 	       	 	}
 	          		
 	    %>
 	    
 	    <li class="dropdown"><a class="dropdown-toggle" href="#">Library</a>
            <ul class="sub-menu">
         		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/libProfile.jsp?uid=<%=uid%>">Profile</a></li>
        		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/searchBook.jsp?uid=<%=uid%>">Book Search</a></li>
            
            <%
 	    		try{
 	    			if(rb.getString(uid).equals("librarian")){
 	    	%>
 	 		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/fcirculation.jsp?uid=<%=uid%>">Faculty Circulation</a></li>
          	<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/scirculation.jsp?uid=<%=uid%>">Student Circulation</a></li>
          	<li class="dropdown"><a href="http://intranet.bvrithyderabad.edu.in/Secured/ProjectGuided.aspx">Entry</a>
          		<ul class="sub-menu">
         			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/book.jsp?uid=<%=uid%>">Book Entry</a></li>
					<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/journal.jsp?uid=<%=uid%>">Journal Entry</a></li>
          			<li><a href="http://intranet.bvrithyderabad.edu.in/Secured/ProjectGuided.aspx">Project Entry</a></li>
          		</ul>
          	</li>
          	<li class="dropdown"><a href="http://intranet.bvrithyderabad.edu.in/Secured/ProjectGuided.aspx">Track</a>
          		<ul class="sub-menu">
         			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/trackReturn.jsp?uid=<%=uid%>">Book Returns</a></li>
          			<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/trackIssue.jsp?uid=<%=uid%>">Book Issues</a></li>
          		</ul>
          	</li>
         
	   <% 		
 	    	 	    }
 	    		}catch(Exception e){
 	       	 			//e.printStackTrace();
 	       	 	}
 	          		
 	    %>
 	    </ul>
        </li>
		<li class="dropdown"><a class="dropdown-toggle" href="#">NoticeBoard</a>
        	 <ul class="sub-menu">
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewNoticeboard.jsp?uid=<%=uid%>">View</a></li>
          
            <%
 	    		try{
 	    			if(rb.getString(uid).equals("hod") || rb.getString(uid).equals("principal") || rb.getString(uid).equals("admin") || rb.getString(uid).equals("jpreddy.s")){
 	    	%>
 	    		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/noticeboard.jsp?uid=<%=uid%>">Post</a></li>
            
 	    	 <% 		
 	    	 	    }
 	    		}catch(Exception e){
 	       	 			//e.printStackTrace();
 	       	 	}
 	          		
 	    %>
            </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#">Grievance</a>
        	 <ul class="sub-menu">
				   <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/grievance.jsp?uid=<%=uid%>">Raise</a></li>
          	       <li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/viewGrievances.jsp?uid=<%=uid%>">View</a></li>
          
            <%
 	    		try{
 	    			if(rb.getString(uid).equals("hod") || rb.getString(uid).equals("principal") || rb.getString(uid).equals("admin") || rb.getString(uid).equals("jpreddy.s")){
 	    	%>
 	    		<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/grievanceInbox.jsp?uid=<%=uid%>">Inbox</a></li>
            
 	    	 <% 		
 	    	 	    }
 	    		}catch(Exception e){
 	       	 			//e.printStackTrace();
 	       	 	}
 	          		
 	    %>
            </ul>
        </li>
        <li class="dropdown"><a class="dropdown-toggle" href="#"><%=session.getAttribute("uid")%></a>
        	 <ul class="sub-menu">
				<li><a href="http://intranet.bvrithyderabad.edu.in:9000/intranet/logout.jsp?uid=<%=uid%>">Logout</a></li>
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
