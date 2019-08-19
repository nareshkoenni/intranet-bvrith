<html>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>

function showReturns() {
	var from=tr.from.value;
	var to=tr.to.value;

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
        xmlhttp.open("GET","bookReturns.jsp?from="+from+"&to="+to,true);
        xmlhttp.send();
    
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		<h3 align="center" class="bars">Track Book Returns </h3><br>
<!-- <form action="searchBookProcess.jsp" name='bookReturn'>  -->
<form action="#" name='tr'>
<table align="center">
<tr>
	<td><input type="date" name="from" placeholder="from"/></td><td>&nbsp;</td>

	<td><input type="date" name="to" placeholder="to"/></td><td>&nbsp;</td>
	<td><input type="button" value='Show' onclick="showReturns()"/></td>
<tr>

</table>
<br>
<div id="bookInfo" align="center"><b>Book info will be displayed here...</b></div>
</form>

</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>