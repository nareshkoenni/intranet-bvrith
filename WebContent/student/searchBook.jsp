<html>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>

function showBooks(str) {
	var ss=sb.ssone.value;
	var str=sb.sstwo.value;
	
    if (str == "") {
        document.getElementById("bookInfo").innerHTML = "";
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
                document.getElementById("bookInfo").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","mobileSearch.jsp?sstwo="+str+"&ssone="+ss,true);
        xmlhttp.send();
    }
}
</script>
</head>
<body>
<%@include file="studentHeader.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		<h3 align="center" class="bars">Book Search</h3><br>
<form action="searchBookProcess.jsp" name='sb'>
<table align="center">
<tr>
	<td><select name='ssone' class="btn btn-default dropdown-toggle"> 
			<option value='1'>Title</option>
			<option value='2'>Author</option>
			<option value='3'>Subject</option>
			<option value='4'>AccNo</option>
			
		</select>
	</td>
	<td></td><td></td>
<tr>
<tr>
	<td><input type="text" name="sstwo" placeholder="content" class="form-control"/></td><td>&nbsp;</td>
	<td><input type="button" value='Search' onclick="showBooks()" class="form-control"/></td>
<tr>

</table>

<div id="bookInfo" align="center"><b>Book info will be displayed here...</b></div>
</form>
</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>