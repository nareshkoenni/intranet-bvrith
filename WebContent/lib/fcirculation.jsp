<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
 

<script type="text/javascript">
function getFaculty(){
	xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    var x=document.getElementById("fac");
	 //  alert(x.length);
	  //  var option=document.createElement("option");
	    var te=this.responseText;
	    var a=te.split(",");
	    for(var i=0;i<a.length-1;i++){
	   // alert(a);
	    var option=document.createElement("option");
		option.text=a[i].toString();
	    for(i=0;i<x.length;i++){
			x.add(option);
	    }
	    }
	    }
	  };
	  xhttp.open("GET", "http://intranet.bvrithyderabad.edu.in:9000/intranet/getFacultyWeb.jsp", true);
	  xhttp.send();
} 
function getFacultyDetails() {
	var user=fcirc.user.value;
	  if (user === "") {
        document.getElementById("facultyInfo").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                
            	document.getElementById("facultyInfo").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","getFacultyDetails.jsp?user="+user,true);
        xmlhttp.send();
    }
}
function userValid(){
	var rollno=fcirc.user.value;
	if(rollno == ""){
		alert("Please enter User Id");
		
	}
}
</script>
</head>

<%@include file="/header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		<h3 align="center" class="bars">Faculty Circulation</h3><br>

	<form name = "fcirc" method="post"  action="http://intranet.bvrithyderabad.edu.in:9000/intranet/lib/fcircProcess.jsp">
		<table align="center" width="270" >
			
   			<tr>
    			<td>Faculty</td>
        		<td>  <select  id="fac" onclick="getFaculty()" name="user"  class="btn btn-default dropdown-toggle" required="required">
				          <option>-Select-</option>
				         </select>
				  </td>
				  <td><input type="button" value="Get Details" onclick="getFacultyDetails()" class="form-control"/> </td>
  		
  			</tr>
  			<tr>
    			<td>AccNo</td>
        		<td>  <input type="text"  name="accno" required="required" class="form-control">
				          
				  </td>
				   <td>&nbsp;</td>
  			</tr>
  			
  			<tr>
  			 <td>&nbsp;</td>
    			<td><input type="submit"  name="type" value='issue' onclick="userValid()" class="form-control"></td>
        		<td> <input type="submit"  name="type" value='return' class="form-control"></td>
				          
				  
  			</tr>
		</table>
	</form>
<br/>
		<div id="facultyInfo" align="center"><b>Faculty info will be displayed here...</b></div>
	

</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>