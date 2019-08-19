<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
 <%@include file="/header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
		<h3 align="center" class="bars">Journal Entry</h3><br>
<form action="journalStore.jsp" name="journalStore" method="post">
	
	
<table width="100%" class="gvStyle">
           
            <tr>
                <td align="center">
                    <div id="divSearch">
                        <table width="75%"  cellspacing="0" cellpadding="2">
                            <tr>
                                <td style="width: 40%" align="right">
                                    Department</td>
                                
                                <td align="left">
            <select name="1" required="required">
				<option value="cse">CSE</option>
				<option value="ece">ECE</option>
				<option value="eee">EEE</option>
				<option value="it">IT</option>
				<option value="bsh">BSH</option>
				<option value="mech">MECH</option>
				<option value="mba">Management</option>
				
			</select>		
	

</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Periodicity</td>
                                <td>
                    <select name="2">
					<option value="0">-Select-</option>
					<option value="7">BI-Monthly</option>
					<option value="8">Daily</option>
					<option value="2">Fortnight</option>
					<option value="5">Halfyearly</option>
					<option value="3">Monthly</option>
					<option value="4">Quarterly</option>
					<option value="1">Weekly</option>
					<option value="6">Yearly</option>
			
					</select></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Title</td>
                                <td>
                                   <input type="text" name="3" />
                               </td>
                                
                            </tr>
                            <tr>
                                <td ></td>
                                <td align="left">
                                    <input type="submit" value="Go.."/></td>
                            </tr>
                        </table>
                    </div>
                    
                </td>
            </tr>
        </table>


</form>
	

</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>