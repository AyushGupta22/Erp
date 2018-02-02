<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="create">
	<label>UserName : </label>
	<input type="text" name="user.userName" placeholder="Enter User Name" required/><br><br>
	<label>Status : </label>
	<select name="user.status" required>
		<option value="active">Active</option>
		<option value="inactive">Inactive</option>
	</select><br><br>
	<label>Position</label>
	<select name="user.position" id="position" onchange="manage()" required>
		<% if(session.getAttribute("position").equals("management")){ %><option value="manager">Manager</option><% } %>
		<option value="employee">Employee</option>
	</select><br><br>
	<label>Password : </label>
	<input type="password" name="user.password" placeholder="enter password" required/><br><br>
	<label>Gender : </label>
	<select name="user.gender" required>
		<option value="M">Male</option>
		<option value="F">Female</option>
		<option value="O">Other</option>
	</select><br><br>
	<label>Email ID : </label>
	<input type="email" name="user.emailid" placeholder="Enter Email ID" required/><br><br>
	<label>Mobile : </label>
	<input type="text" name="user.mobile" placeholder="Enter mobile Number here" required/><br><br>
	<div style="display:none;">
		<label>Person ID who created account</label>
	<input type="text" name="user.accountCreatedBy" value='<% out.print((Integer)session.getAttribute("userId")); %>' readonly required/><br><br>
	</div>
	
	<label>Manager ID</label>
	<select name="user.managerId" id= "manager" required>
		<option value='<% out.print((Integer)session.getAttribute("userId")); %>'><% out.print((String)session.getAttribute("userName")); %></option>
	</select>
	
	<input type="submit" value="create account" />
</form>
<a href="dashboard.jsp">Go to Home</a>
<script>
function manage() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var x = document.getElementById("position").value;   
	    	alert(x);
	    	if(x == "employee")
	     		document.getElementById("manager").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "listManager.action", true);
	  xhttp.send();
	}
</script>
</body>
</html>