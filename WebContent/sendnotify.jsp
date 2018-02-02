<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="#" method="get">
	<label>Subject</label><input type="text" name="subject" required><br><br>
	<label>Message</label><textarea type="text" rows="10" name="message" required></textarea><br><br>
	<div style="display:none;">
		<label>Sender Id</label><input type="text" name="senderid" value='<% out.print(session.getAttribute("userId")); %>' required/><br><br>
	</div>
	<label>Select Receiver</label><br>
	<s:iterator value="list1">
		<input type="checkbox" name="check_list" value='<s:property value="userId" />'><label><s:property value="userName" />-<s:property value="position" /></label><br/>
	</s:iterator>
	<br>
	<input type="button" value="submit" onclick="makeRequest()">
</form>
<a href="dashboard.jsp">Go to Home</a>
<script>
	function makeRequest(){
		var x = document.getElementsByName('check_list');
		alert(x.length);
		var sub = document.getElementsByName('subject')[0].value;
		var message = document.getElementsByName('message')[0].value;
		var senderid = document.getElementsByName('senderid')[0].value;
		var a;
	
		var name=[];
		for(a = 0;a < x.length;a++)
			if(x[a].checked)
				name.push(x[a].value);
		alert(name);
		if(name.length > 0)
		 location.href = "sendnotification?mbean.subject="+sub+"&mbean.message="+message+"&mbean.senderid="+senderid+"&mbean.name="+name;
		else
			alert("enter whom to send");

		}

</script>
</body>
</html>