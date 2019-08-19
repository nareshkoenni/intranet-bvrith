<script type="text/javascript">
function f1(){
	var n=password.newp.value();
	var n1=password.newp1.value();
	if(n.match(n1) || (n.length!=n1.length()){
		alert("Password is not matched");		
		password.new1.focus();	
	}
	
	
}
</script>

<form action="cps" name="password" method="POST">
<h1 align="center" class="heading"><img src='images/clg.png' height=100 width=500 height="95"></h1>
 <hr/>
 <h2  align="center" ><font style="color: green;">Change Password</font></h2>
 <table align="center" style="border-style: dashed; background: silver; height: 150px; width: 300px;">
 <tr>
 <td>New Password</td><td><input type="password" name="newp"/></td>
 </tr>
 <tr>
 <td>Conform Password</td><td><input type="password" name="newp1" onblur="f1()"/></td>
 </tr>
 
 
<tr>
<td align="center"><a href="studentHome.jsp">Back</a></td>
<td align="center"><input type="submit" value="Update" /></td>
</tr>
</table>	 
 
</form>
