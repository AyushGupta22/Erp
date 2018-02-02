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
<table>
	<tr>
  		<td>User Id</td>
  		<td>User Name</td>
  		<td>Position</td>
  		<td>Email Id</td>
  		<td>Mobile</td>
  		<td>Status</td>
  	</tr>
	<s:iterator value="list1" >
  		<tr>
  			<td><s:property value="userId"/></td>
  			<td><s:property value="userName"/></td>
  			<td><s:property value="position"/></td>
  			<td><s:property value="emailid"/></td>
  			<td><s:property value="mobile"/></td>
  			<td><a href='change?user.userId=<s:property value="userId"/>&user.status=<s:property value="status"/>'><s:property value="status"/></a></td>
  		</tr>
	</s:iterator>
</table>
 <a href="dashboard.jsp">Go to Home</a>
</body>
</html>