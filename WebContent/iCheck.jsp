	<script>
		 
		var request = new XMLHttpRequest();
		try{  
			if(1){
				request.open("GET","www.google.com",true);    
				request.send();   
				alert('Sent Successfully');
				window.location = 'http://192.168.1.46:9000/intranet/viewAttendanceCT.jsp?uid="+uid+"';
			}else{
				
			}
		}catch(e){
			alert("Failed to Send. Check your Internet Connection and Try"); 
			alert(e.toString());
		}  
		
	</script> 