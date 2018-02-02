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
		.message{
			background-color:lightsalmon;
			padding: 5px 10px;
    	`	margin-bottom: 10px;
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
<div class="header"><h1>Notification</h1></div>
<div class="main">
<s:iterator value="list">
	<div class="message">
		<h3 style="margin:0%"><s:property value="mid.getSubject()"/></h3>
		<p><s:property value="mid.getMessage()"/></p>
	</div>
</s:iterator>
</div>
<a href="dashboard.jsp">Go to Home</a>
<div class="footer"><p>Copyright &copy; ERP pvt. ltd. 2018</div>
</body>
</html>