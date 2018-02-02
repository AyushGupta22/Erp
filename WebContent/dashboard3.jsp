<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib uri="/struts-tags" prefix="s" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.header{
			background-color: #3399FF;
	    	color: white;
	    	padding: 30px;
		}
		.header h1{
			margin-left: 45%;
		}
		.main{
			margin-top: 2%;
		}
		.main a{
			display: inline-block;
		    background: skyblue;
		    text-decoration: none;
		    margin-right: 5px;
		    padding: 10px 5px;
		    box-shadow: 1px 1px #444444;
		}
		.footer{
			padding: 30px;
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
<div class="header"><h1>Employee</h1></div>
<%
String sid = (String)session.getAttribute("login");
String pos = (String)session.getAttribute("position");
if(sid.equals("true") && pos.equals("employee")){
%>
<div class="main">
	<a href="notification">View Notification</a>
	<a href="logout" style="position: absolute;right:1%;">Logout</a>
</div>
<%}
else{
	out.print("go to login<br>");
	out.print("<a href='index.jsp'>login</a>");
	
}%>
<div class="footer"><p>Copyright &copy; ERP pvt. ltd. 2018</p></div>
</body>
</html>