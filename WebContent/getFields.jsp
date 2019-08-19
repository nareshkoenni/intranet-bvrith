<% 
	int dynID=Integer.parseInt(request.getParameter("dynId"));
%>
<tr class="tr_clone_<?=$dynId?>">

		<td><input type="text" name="sessionNo" value="sessionNo" class="form-control"> </td>
		<td><input type="text" name="topic" value="Topic to be covered" class="form-control"> </td>
		<td><input type="text" name="textBook" value="Text/Reference Book" class="form-control"> </td>
		<td><input type="text" name="webResource" value="Web Resources" class="form-control"> </td>
		<td><input type="text" name="co" value="CO Achieved" class="form-control"> </td>
		
		<td><button name="addfield" class="btn btn-primary tr_clone_add" type="button" onClick="javascript:add_row()" >Add</button></td>
</tr>