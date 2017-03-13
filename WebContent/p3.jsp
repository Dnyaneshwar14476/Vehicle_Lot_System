<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.DBClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String msg="";
String slotno="";
DBClass db=new DBClass();
if(request.getParameter("b1")!=null)
{
	slotno=request.getParameter("t1");
	ResultSet rs=db.getData("select * from Model where Status='Y'");
	msg="Available Slots<br>";
	int a=0;
	while(rs.next())
	{
		a=1;
		msg=msg+rs.getInt(1)+"<br>";	 
	}
	if(a==0)
	{
		msg="Space is not available";
	}
	
		
}

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Parking Application</title>
</head>
<body>
<%@ include file="head.jsp" %>
<tr>
<td colspan="4" align="center">
<form name="form1" action="p3.jsp" method="post">
<table>
<tr>
<td colspan="2">Get Availability</td>
</tr>
<tr>
<td><input type="submit" name="b1" value="Get Availability" required value="<%=slotno%>"/></td>
</tr>
<tr>
<td colspan="2"><%=msg%></td>
</tr>
</table>

</form>

</td>
</tr>
</table>


</body>
</html>