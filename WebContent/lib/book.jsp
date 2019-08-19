<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>


<%@include file="/header.jsp" %>
<div class="single">
	<div class="container">
		<div class="single-grid">
	<h3 align="center" class="bars">Book Entry</h3><br>
<center>

<form action="bookStore.jsp" method="post">
<table width="100%" cellpadding="2" cellspacing="0">
<tr><td align="left" style="width:10%">Title</td>
    <td align="left" style="width:40%"><input type="text"  name="title" style="width:95%" required="required"/></td>
    <td align="left" style="width:10%">Subject</td>
    <td align="left"><input type="text" id="txtsubject" name="subject" style="width:90%" required="required"/></td>
</tr>
 <tr><td colspan="2" valign="top">
        
        <div id="divdepartments">
        	
			Branch<select name="dept" required="required">
				<option value="cse">CSE</option>
				<option value="ece">ECE</option>
				<option value="eee">EEE</option>
				<option value="it">IT</option>
				<option value="bsh">BSH</option>
				<option value="mech">MECH</option>
				<option value="mba">Management</option>
				
			</select>		
		  
        </div>
    </td>
    <td valign="top" colspan="2">
        <table width="100%" cellpadding="2" cellspacing="0">
            <tr><td align="left">Author</td><td align="left"><input type="text" id="txtauthor" name="author" style="width:90%" onkeypress="addNewAuthor()" required="required"/></td></tr>
            <tr><td></td><td align="left" ><table id="tblauthors" class="popupTable" width="100%"></table></td></tr>
            <tr><td align="left" style="width:20%">Publisher</td><td align="left"><input type="text" id="txtpublisher" name="publisher" style="width:90%"/></td></tr>
            <tr><td align="left">Place</td><td align="left"><input type="text" id="txtplace" name="place" style="width:90%"/></td></tr>    
        </table>
    </td>
</tr>
        </table>
   
</center>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0" class="popupTable">
                    <tr >
                        <td align="right">
                            Prefix</td>
                        <td align="left">
                            <input type="text" id="txtPrefix" name="prefix" maxlength="4" onblur="_getCurrentAccNo()" required="required" /></td>
                        <td align="right">
                            Acc No</td>
                        <td align="left">
                             <input type="text" id="accno" name="accno" required="required"/> 
                        </td>
                    </tr>
                    <tr align="left">
                        <td style="width: 15%" align="right">
                            Class.No</td>
                        <td style="width: 35%">
                            <input type="text" id="txtCallNo" name="classno" style="width: 30%" />
                        </td>
                        <td style="width: 15%" align="right">
                            Call.No</td>
                        <td style="width: 35%">
                            <input type="text" id="txtCallNo1" name="callno" required="required"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            No.Of Copies</td>
                        <td align="left">
                            <input type="text" id="txtCopies" name="noofcopies" style="width: 40%" required="required"/></td>
                    </tr>
                    <tr>
                        <td align="right">
                            Invoice.No</td>
                        <td align="left">
                            <input type="text" id="txtInvNo" name="invoiceno" required="required"/></td>
                        <td align="right">
                            Invoice Date</td>
                        <td align="left">
                            <input type="date" id="date"  name="invoicedate" class="datePicker" required="required"/>
                            </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Year</td>
                        <td>
                            <input type="text" id="txtYear" name="year" maxlength='4' required="required"/></td>
                        <td align="right">
                            Size & Type of Binding</td>
                        <td align="left">
                            <input type="text" name="typeofbinding" id="txtSize" required="required"/></td>
                    </tr>
                    <tr>
                        <td align="right">
                            Language</td>
                        <td align="left">
                            <select id="ddlLanguage" name='language' required="required">
                                <option value="1">English</option>
                                <option value="2">Telugu</option>
                            </select>
                        </td>
                        <td align="right">
                            Pages
                        </td>
                        <td align="left">
                            <input type="text" id="txtPages" name="pages" required="required" /></td>
                    </tr>
                    <tr>
                        <td align="right">
                            Edition</td>
                        <td>
                            <input type="Text" id="txtEdition" name="edition" required="required"/></td>
                        <td align="right">
                            Cost
                        </td>
                        <td>
                            <input type="text" id="txtCost" style="text-align: right" name="cost" required="required"/>
                            <select id="ddlCurrency">
                                <option value="Rs">Rs</option>
                                <option value="DL">$</option>
                                <option value="PN">&pound;</option>
                            </select>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right">
                            Discount</td>
                        <td align="left">
                            <input type="text" id="txtDiscount" style="text-align: right" name="discount" required="required"/>&nbsp;(%)</td>
                        <td align="right">
                            Volume</td>
                        <td>
                            <input type="text" id="txtVolume" name="volume" required="required"/></td>
                    </tr>
                    <tr align="left">
                        <td align="right">
                            Rack No</td>
                        <td>
                            <div style="float: left">
                                <input type="text" id="txtRackNo" style="width: 15%" name="rack" /></div>
                            <div style="float: left; width: 15px">
                            </div>
                            <div style="float: left">
                                Sub-Rack No</div>
                            <div style="float: left">
                                <input type="text" id="txtSubRackNo" style="width: 35%" /></div>
                        </td>
                        <td align="right">
                            Course
                        </td>
                        <td>
                            <select name="course" id="ctl00_CapPlaceHolder_ddlCourse">
	<option value="1">B.Tech</option>

</select>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right">
                            Supplier</td>
                        <td>
                            <select name="supplier" id="ctl00_CapPlaceHolder_ddlSupplier" name="supplier" style="width:90%;">
	<option value="68">Ability Foundation</option>
	<option value="77">Als Wizard Media Pvt. Ltd.</option>
	<option value="82">Amazon</option>
	<option value="10">Bharat Sanchar Nigam Limited</option>
	<option value="2">Bookionics</option>
	<option value="88">BVRITH</option>
	<option value="33">Charlie Book House</option>
	<option value="72">Claro Publications Pvt. Ltd.</option>
	<option value="40">Competition Review Pvt.Ltd.</option>
	<option value="24">Competition Review Pvt.Ltd.</option>
	<option value="47">Complimentary Copy</option>
	<option value="44">CSI</option>
	<option value="52">Cyber Media (India)Ltd.</option>
	<option value="23">Delhi Prakashan Vitran Pvt.Ltd.</option>
	<option value="84">DELNET</option>
	<option value="17">Dept. Of Electronics &amp; Information Technology</option>
	<option value="12">DESIDOC</option>
	<option value="16">Diva Enterprises Pvt. Ltd</option>
	<option value="66">Donated Copy</option>
	<option value="22">EFY Enterprises Pvt.Ltd.</option>
	<option value="51">Electronics Today</option>
	<option value="56">ELT@I</option>
	<option value="54">Engineering Review</option>
	<option value="36">Engineering Today</option>
	<option value="79">EPW Research Foundation </option>
	<option value="46">Flipkart</option>
	<option value="81">Geetanjali Institute Of Science &amp; Technology</option>
	<option value="41">Higgin Bothams Pvt.Ltd.</option>
	<option value="43">Honeybee Regional Collaborators &amp; Publications</option>
	<option value="7">I-Manager Publications</option>
	<option value="6">I.K.International Publishing House</option>
	<option value="76">IEEE</option>
	<option value="15">IEEMA</option>
	<option value="8">IETE</option>
	<option value="3">Indian Academy Of Sciences</option>
	<option value="18">Indian Institution Of Industrial Engineering</option>
	<option value="13">Inventi Journals Pvt.Ltd.</option>
	<option value="89">ISTE</option>
	<option value="5">IUP</option>
	<option value="11">Lab Experiments</option>
	<option value="74">Laxmi Publications</option>
	<option value="34">Lexico Book Shop</option>
	<option value="25">Living Media</option>
	<option value="61">M.R.Book Centre</option>
	<option value="26">NEELKAMAL</option>
	<option value="30">New Student Educational Needs</option>
	<option value="39">Nirvana Stores</option>
	<option value="9">NISCAIR</option>
	<option value="67">Orient Black Swan</option>
	<option value="55">Outlook Publishing (India) Pvt. Ltd.</option>
	<option value="31">Oxford Book Store</option>
	<option value="78">Perspective Publications Pvt Ltd</option>
	<option value="62">Prajasakthi Books </option>
	<option value="59">Ramakrishna Math</option>
	<option value="35">Ramakrishna Math</option>
	<option value="37">Reader's Digest</option>
	<option value="75">Readers</option>
	<option value="60">Readers Heaven</option>
	<option value="42">Reddy Book Suppliers</option>
	<option value="53">Research India Publications</option>
	<option value="80">SC Book Bank Scheme </option>
	<option value="49">Serials Publications</option>
	<option value="48">Sri Vashishta Sevasramam</option>
	<option value="29">Sri Venkateswara Book Depot</option>
	<option value="58">Srinikethan Book Centre</option>
	<option value="85">SVES</option>
	<option value="28">Telugu Academy</option>
	<option value="19">TERI</option>
	<option value="27">The Book Point</option>
	<option value="21">The Hindu</option>
	<option value="32">Unique Book Centre</option>
	<option value="57">Unique Book World</option>
	<option value="45">Vema Publishers</option>

</select></td>
                        <td align="right">
                            </td>
                        <td align="left">
                            
                        </td>
                    </tr>
                    <tr style="display:none">
                        <td align="right">Department</td>
                        <td colspan="2" align="left" valign="top">
                        <table id="ctl00_CapPlaceHolder_lstDepartment" border="0">
	<tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_0" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$0" /><label for="ctl00_CapPlaceHolder_lstDepartment_0">Administration</label></td>
	</tr><tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_1" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$1" /><label for="ctl00_CapPlaceHolder_lstDepartment_1">Computer Science & Engineering</label></td>
	</tr><tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_2" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$2" /><label for="ctl00_CapPlaceHolder_lstDepartment_2">Electrical And Electronics Engineering</label></td>
	</tr><tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_3" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$3" /><label for="ctl00_CapPlaceHolder_lstDepartment_3">Electronics And Communication Engineering</label></td>
	</tr><tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_4" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$4" /><label for="ctl00_CapPlaceHolder_lstDepartment_4">Freshman / BS & H</label></td>
	</tr><tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_5" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$5" /><label for="ctl00_CapPlaceHolder_lstDepartment_5">Information Technology</label></td>
	</tr><tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_6" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$6" /><label for="ctl00_CapPlaceHolder_lstDepartment_6">Management</label></td>
	</tr><tr>
		<td><input id="ctl00_CapPlaceHolder_lstDepartment_7" type="checkbox" name="ctl00$CapPlaceHolder$lstDepartment$7" /><label for="ctl00_CapPlaceHolder_lstDepartment_7">Mechanical  Engineering</label></td>
	</tr>
</table>
                        
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            Remarks</td>
                        <td align="left" colspan="3">
                            <textarea id="txtRemarks" style="width: 96%" name="remarks" required="required"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">
                            No.Of Issue Books</td>
                        <td align="left">
                            <input type="text" id="txtIssues" name="issuebooks" required="required"/></td>
                        <td align="right">
                            No.Of Ref Books</td>
                        <td align="left">
                            <input type="text" id="txtReferences" name="refbooks" required="required"/></td>
                    </tr>
                    <tr>
                        <td align="right">
                            Category</td>
                        <td>
                            <input type="radio" id="radGeneral" name="category" checked="checked" title="GE" value="GE" />General&nbsp;
                            <input type="radio" id="radBookBank" name="category" title="BB" value="BB" />Book Bank&nbsp;
                            <input type="radio" id="radSWBBank" name="category" title="SW" value="SW" />SW Book Bank
                        </td>
                        <td align="right">
                            Type</td>
                        <td align="left">
                            <select name="type" id="ctl00_CapPlaceHolder_ddlType">
	<option value="AC">Audio Casettes</option>
	<option value="AR">Articles</option>
	<option selected="selected" value="BK">Books</option>
	<option value="CD">Compact Discs</option>
	<option value="FP">Floppies</option>
	<option value="ND">Network Downloads</option>
	<option value="VC">Video Casettes</option>
	<option value="VD">Video CDs</option>
	<option value="VS">Video Courses</option>

</select>
                        </td>
                    </tr>
                    <tr align="left">
                        <td align="right">
                            Enclose</td>
                        <td align="left">
                            <div style="float: left">
                                <select id="enclose" onchange="_onEncloseChange(this)">
                                    <option value="0">-Select-</option>
                                    <option value="CD">CD</option>
                                    <option value="DV">DVD</option>
                                    <option value="FP">Floppy</option>
                                    <option value="AC">Audio Casette</option>
                                    <option value="VC">Video Casette</option>
                                </select>
                            </div>
                            <div style="float: left">
                                <input type="text" id="txtNoOfEnclose" />
                            </div>
                        </td>
                        <td align="right">
                            ISBN
                        </td>
                        <td>
                            <input type="text" id="txtISBN" name="isbn"/></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <input type="submit" class='buttonStyle' id="btnSave" value="Save" onclick="OnBookSaveClick()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</div>
	</div>
</div>
<%@include file="/footer.html" %>
</body>