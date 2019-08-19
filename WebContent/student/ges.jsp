
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker().datepicker("setDate", new Date());
  });
  </script>
  <script type="text/javascript">
  	function courseValid(){
  		var course=postattendance.course.value;
  		if(course=="choose"){
  			alert("Please Choose Course");
  			//postattendance.course.focus();
  			//return true;  
  		}
  		
  	}
  </script>

</head>
<!-- <h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500></h1><h4 align="right"><a href="index.html">Logout</a></h4> -->

<body>
<%@include file="studentHeader.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
<form action="http://intranet.bvrithyderabad.edu.in:9000/intranet/gescs?rollnumber=<%=rollnumber%>" name="postattendance" method="post" style="flex: content;">
	<h3 align="center" class="bars">Graduate Exit Survey</h3><br>
	
	<table align='center' border="1"  width="60%">	
		<tr>
			<td align="center" colspan="3"><input type="button" style="color: blue; font-weight: bold;" value="A.General Information" class="form-control"/></td>		
		</tr>
		<tr>
			<td><input type="text"  name="name" placeholder="Student Name" class="form-control" required="required"/></td>		
		   	<td><input type="text"  name="email" placeholder="email" class="form-control" required="required"/></td>		
		    <td><select name="branch" required="required" class="btn btn-default dropdown-toggle">
				<option value="">Choose Dept</option>
				<option value="CSE">CSE</option>
				<option value="ECE">ECE</option>
				<option value="EEE">EEE</option>
				<option value="IT">IT</option>
			</select>
			</td>
		</tr>
		<tr>
			<td><select name="grad_year" required="required" class="btn btn-default dropdown-toggle">
				<option value="">Choose Grad_Yr</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				</select>
			</td>
			<td><input type="text"  name="mobile" placeholder="mobile" class="form-control" required="required"/></td>		
			<td><select name="pl_status"  required="required" class="btn btn-default dropdown-toggle">
				<option value="">Placement Status</option>
				<option value="yes">YES</option>
				<option value="no">NO</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><select name="pg_adm_det"  required="required" class="btn btn-default dropdown-toggle">
				<option value="">Higher Studies</option>
				<option value="NO">NO</option>
				<option value="GATE">GATE</option>
				<option value="GRE">GRE</option>
				<option value="TOEFL">TOEFL</option>
				<option value="GMAT">GMAT</option>
				<option value="JMET">JMET</option>
				<option value="CAT">CAT</option>
				<option value="OTHERS">OTHERS</option>
				</select>
			</td>
			<td><input type="text" value="" name="higher_studies_score" placeholder="higher_studies_score" class="form-control" required="required"/></td>		
			<td><input type="text"  name="adm_det"  placeholder="PG Admission Details" class="form-control" required="required"/></td>		
		</tr>
		</table><br>
		<table align='center' border="1" width="89%">
	  
		<tr>
			<td align="center" colspan="3"><input type="button" style="color: blue; font-weight: bold;" value="B.Evaluation of Programme Effectiveness" class="form-control"/></td>		
		</tr>
		<tr>
			<td  colspan="3"> <p>As a graduate, I able to</p></td>		
		</tr>
		  <tr>
			<th>S.No</th>
			<th>Parameters</th>
			<th>&nbsp;</th>
		</tr>
		<tr>
			<td>1</td>
			<td>Identify, formulate and analyze complex <br> engineering problems by applying knowledge  in basic sciences, <br> interdisciplinary subjects and core subjects.</td>
			<td>
				<input type="radio" name="pe1" value='5' required="required">Strongly Agree
				<input type="radio" name="pe1" value='4'>Agree
				<input type="radio" name="pe1" value='3'>Neutral
				<input type="radio" name="pe1" value='2'>Disagree
				<input type="radio" name="pe1" value='1'>Strongly Disagree
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Comprehend the knowledge to design and <br>develop the solutions for complex problems that meet the specified <br>needs of societal, cultural, safety and environmental issues.</td>
			<td>
				<input type="radio" name="pe2" value='5' required="required">Strongly Agree
				<input type="radio" name="pe2" value='4'>Agree
				<input type="radio" name="pe2" value='3'>Neutral
				<input type="radio" name="pe2" value='2'>Disagree
				<input type="radio" name="pe2" value='1'>Strongly Disagree
			</td>
		</tr>
    	<tr>
			<td>3</td>
			<td>Apply research based approach using innovative <br>tools and techniques in the various fields of Engineering.</td>
			<td>
				<input type="radio" name="pe3" value='5' required="required">Strongly Agree
				<input type="radio" name="pe3" value='4'>Agree
				<input type="radio" name="pe3" value='3'>Neutral
				<input type="radio" name="pe3" value='2'>Disagree
				<input type="radio" name="pe3" value='1'>Strongly Disagree
			</td>
		</tr>
    	<tr>
			<td>4</td>
			<td>Demonstrate the knowledge of the engineering and<br> management principles while working individually or as a team.</td>
			<td>
				<input type="radio" name="pe4" value='5' required="required">Strongly Agree
				<input type="radio" name="pe4" value='4'>Agree
				<input type="radio" name="pe4" value='3'>Neutral
				<input type="radio" name="pe4" value='2'>Disagree
				<input type="radio" name="pe4" value='1'>Strongly Disagree
			</td>
		</tr>
    	<tr>
			<td>5</td>
			<td>Communicate effectively in both verbal and written <br>form to develop intrapersonal and interpersonal skills</td>
			<td>
				<input type="radio" name="pe5" value='5' required="required">Strongly Agree
				<input type="radio" name="pe5" value='4'>Agree
				<input type="radio" name="pe5" value='3'>Neutral
				<input type="radio" name="pe5" value='2'>Disagree
				<input type="radio" name="pe5" value='1'>Strongly Disagree
			</td>
		</tr>
    	<tr>
			<td>6</td>
			<td>Develop competencies through self-education for lifelong learning</td>
			<td>
				<input type="radio" name="pe6" value='5' required="required">Strongly Agree
				<input type="radio" name="pe6" value='4'>Agree
				<input type="radio" name="pe6" value='3'>Neutral
				<input type="radio" name="pe6" value='2'>Disagree
				<input type="radio" name="pe6" value='1'>Strongly Disagree
			</td>
		</tr>
    	<tr>
			<td>7</td>
			<td>Secure employment or be an entrepreneur with ability <br> to apply professional knowledge with ethical responsibility</td>
			<td>
				<input type="radio" name="pe7" value='5' required="required">Strongly Agree
				<input type="radio" name="pe7" value='4'>Agree
				<input type="radio" name="pe7" value='3'>Neutral
				<input type="radio" name="pe7" value='2'>Disagree
				<input type="radio" name="pe7" value='1'>Strongly Disagree
			</td>
		</tr>
    	<tr>
			<td>8</td>
			<td>Acquire knowledge to pursue higher studies if I want</td>
			<td>
				<input type="radio" name="pe8" value='5' required="required">Strongly Agree
				<input type="radio" name="pe8" value='4'>Agree
				<input type="radio" name="pe8" value='3'>Neutral
				<input type="radio" name="pe8" value='2'>Disagree
				<input type="radio" name="pe8" value='1'>Strongly Disagree
			</td>
		</tr>
		</table><br>
    	<table align='center' border="1"  width="58%">
	  
		<tr>
			<td align="center" colspan="3"><input type="button" style="color: blue; font-weight: bold;" value="C.	Additional Information" class="form-control"/></td>		
		</tr>
		  <tr>
			<th>S.No</th>
			<th>Parameters</th>
			<th>&nbsp;</th>
		</tr>
		<tr>
			<td>1</td>
			<td>Are there any other skills or knowledge you would  <br> like to have, the UG programme offer, to current <br> students to ensure their preparedness for <br> employment and/ or higher studies? If YES, please specify</td>
	 	 	<td><input type="text"  name="suggestions" class="form-control" required="required"/>
		</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Total number of courses or training programs taken  <br>during the programme</td>
			<td><input type="number"  name="training_program" placeholder="no_special_chars" class="form-control" required="required"/>
		</tr>
    	<tr>
			<td>3</td>
			<td>Total number of conferences, workshops, professional  <br>meetings etc. attended</td>
			<td><input type="number"  name="workshop" class="form-control" placeholder="number only" required="required"/>
		</tr>
    	<tr>
			<td>4</td>
			<td>Total number of sports and cultural activities participated</td>
			<td><input type="number"  name="sports" class="form-control" placeholder="no_special_chars" required="required"/>
		</tr>
    	<tr>
			<td>5</td>
			<td>Specify details regarding your achievements in  <br>curricular / non-curricular activities</td>
			<td><input type="text"  name="achievement" class="form-control" required="required"/>
		</tr>
    </table>
    <br>
    <table align='center' border="1"  width="60%">
	  
		<tr>
			<td align="center" colspan="3"><input type="button" style="color: blue; font-weight: bold;" value="D.Answer the Following with a Statement" class="form-control"/></td>		
		</tr>
		  <tr>
			<th>S.No</th>
			<th>Parameters</th>
			<th>&nbsp;</th>
		</tr>
	
		<tr>
			<td>1</td>
			<td>Mention one value that you picked up in BVRITH</td>
			<td><textarea  name="bvrith_pickedup" cols="50" class="form-control" required="required"></textarea>
		</tr>
    	<tr>
			<td>2</td>
			<td>What you liked the most in BVRITH?</td>
			<td><textarea   name="bvrith_like_most" cols="50" class="form-control" required="required"></textarea>
		</tr>
    
	
	</table>
	<br>
    <table align='center' border="1"  width="70%">
	  
		<tr>
			<td align="center" colspan="4"><input type="button" style="color: blue; font-weight: bold;" value="E. Pls Rate the Following" class="form-control"/></td>		
		</tr>
		<tr>
			<th>Parameter</th>
			<th>Evaluation</th>
			<th>Parameter</th>
			<th>Evaluation</th>
		</tr>
		<tr>
			<td>1.Principal</td>
			<td>
				<input type="radio" name="principal" value='3' required="required">Very Good
				<input type="radio" name="principal" value='2'>Good
				<input type="radio" name="principal" value='1'>Moderate
			</td>
			<td>2.HoD</td>
			<td>
				<input type="radio" name="hod" value='3' required="required">Very Good
				<input type="radio" name="hod" value='2'>Good
				<input type="radio" name="hod" value='1'>Moderate
			</td>
			
		</tr>
    	<tr>
			<td>3.Supporting Staff</td>
			<td>
				<input type="radio" name="non_teaching" value='3' required="required">Very Good
				<input type="radio" name="non_teaching" value='2'>Good
				<input type="radio" name="non_teaching" value='1'>Moderate
			</td>
			<td>4.Teaching Faculty</td>
			<td>
				<input type="radio" name="teaching" value='3' required="required">Very Good
				<input type="radio" name="teaching" value='2'>Good
				<input type="radio" name="teaching" value='1'>Moderate
			</td>
			
		</tr>
		<tr>
			<td>5.Amenities</td>
			<td>
				<input type="radio" name="Amenities" value='3' required="required">Very Good
				<input type="radio" name="Amenities" value='2'>Good
				<input type="radio" name="Amenities" value='1'>Moderate
			</td>
			<td>6.Library</td>
			<td>
				<input type="radio" name="Library" value='3' required="required">Very Good
				<input type="radio" name="Library" value='2'>Good
				<input type="radio" name="Library" value='1'>Moderate
			</td>
			
		</tr>
		<tr>
			<td>7.Laboratories</td>
			<td>
				<input type="radio" name="labs" value='3' required="required">Very Good
				<input type="radio" name="labs" value='2'>Good
				<input type="radio" name="labs" value='1'>Moderate
			</td>
			<td>8.Exam Cell</td>
			<td>
				<input type="radio" name="exam" value='3' required="required">Very Good
				<input type="radio" name="exam" value='2'>Good
				<input type="radio" name="exam" value='1'>Moderate
			</td>
			
		</tr>
		<tr>
			<td>9.Administration</td>
			<td>
				<input type="radio" name="Administration" value='3' required="required">Very Good
				<input type="radio" name="Administration" value='2'>Good
				<input type="radio" name="Administration" value='1'>Moderate
			</td>
			<td>10.Training & Placements</td>
			<td>
				<input type="radio" name="training" value='3' required="required">Very Good
				<input type="radio" name="training" value='2'>Good
				<input type="radio" name=training value='1'>Moderate
			</td>
			
		</tr>
		<tr>
			<td>11.Discipline</td>
			<td>
				<input type="radio" name="Discipline" value='3' required="required">Very Good
				<input type="radio" name="Discipline" value='2'>Good
				<input type="radio" name="Discipline" value='1'>Moderate
			</td>
			<td>12.Ambience</td>
			<td>
				<input type="radio" name="Ambience" value='3' required="required">Very Good
				<input type="radio" name="Ambience" value='2'>Good
				<input type="radio" name=Ambience value='1'>Moderate
			</td>
			
		</tr>
		<tr>
			<td>13.Classrooms</td>
			<td>
				<input type="radio" name="Classrooms" value='3' required="required">Very Good
				<input type="radio" name="Classrooms" value='2'>Good
				<input type="radio" name="Classrooms" value='1'>Moderate
			</td>
			<td>14.Medical Facilities</td>
			<td>
				<input type="radio" name="Medical" value='3' required="required">Very Good
				<input type="radio" name="Medical" value='2'>Good
				<input type="radio" name=Medical value='1'>Moderate
			</td>
			
		</tr>
	</table>
	<br>
	<table align="center" border="1"  width="70%">
		<tr>
			<td colspan="" align="center">Overall Rating</td>
			<td colspan="" align="center">
				<input type="radio" name="Overall" value='3' required="required">Very Good
				<input type="radio" name="Overall" value='2'>Good
				<input type="radio" name="Overall" value='1'>Moderate
			</td>
		</tr>
		<tr>
			
			<td colspan="2"><textarea  cols="108" name="sugg_for_improve"  class="form-control" required="required" placeholder="Your suggestion(s) for improvement"></textarea>
		</tr>
	</table>
    <br>
    <table align="center">	
    	<tr>
    		
			<td><input type="reset" value="Clear" class="form-control"> </td>
			<td><input type="submit" class="form-control" /></td>
		</tr>
	</table>


</form>
	
		</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>