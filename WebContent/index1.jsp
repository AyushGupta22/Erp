<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String sid = (String)session.getAttribute("login");
    if(sid != null)
    	response.sendRedirect("dashboard.jsp");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERP</title>
<style type="text/css">
	.header{
		background-color: #3399FF;
    	color: white;
    	padding: 45px;
	}
	.header h1{
		margin-left: 45%;
	}
	.main{
		margin-top: 2%;
	}
	.login{
		margin:auto;
		width:26%;
	}
	.login-head{
		background: #FF6600;
    	color: white;
    	margin: auto;
    	padding: 10px;
	}
	.login-head h3{
		margin: auto;
    	width: 18%;
	}
	.login-body{
		margin-top: 10px;
	}
	.login-body tr{
		padding:10px 0px;
	}
	#sub{
		border: none;
		background:#3333FF;
		color:white;
		padding: 5px 10px;
	}
	.login-foot{
		background: #FF6600;
    	color: white;
    	padding: 10px;
    	margin-top:10px;
	}
	.footer{
		padding: 40px;
    	color: white;
    	background-color: #3399FF;
    	position: absolute;
    	bottom: 0;
    	left: 0;
    	right: 0;
	}
	.footer p{
		margin-left:40%;
	}
</style>
</head>
<body>
<div class="header"><h1>ERP</h1></div>
<div class="main">
	<div class="login">
		<div class="login-head">
			<h3>Login</h3>
		</div>
		<div class="login-body">
			<form action="validate" method="post">
				<table>
					<tr>
						<td><label>Username : </label></td>
						<td><input type="text" name="user.userName" pattern="[a-zA-Z0-9]{5,}" title="Must be only alphanumeric of length greater than 4" placeholder="Enter User Name" required/></td>
					</tr>
					<tr>
						<td><label>Password : </label></td>
						<td><input type="password" name="user.password" pattern="[a-zA-Z0-9]{8,}" title="Must be only alphanumeric of length greater than 7" placeholder="Enter Password"  required/></td>
					</tr>
					<tr>
						<td colspan="2" style="color:red;" > *Invalid Username Or Password</td>
					</tr>
					<tr>
						<td><input type="submit" value="login" id="sub"/></td>
					</tr>
				</table>
				
			</form>
		</div>
		<div class="login-foot"></div>
	</div>
</div>
<div class="footer"><p>Copyright &copy; ERP pvt. ltd. 2018</div>
</body>
</html>