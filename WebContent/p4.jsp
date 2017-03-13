<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.DBClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String msg="";
DBClass db=new DBClass();
String regno="";
if(request.getParameter("b1")!=null)
{
	regno=request.getParameter("t1");
	ResultSet rs=db.getData("select * from Model where RegNo="+regno+" and status='N'");
	int slotno=0;
	if(rs.next())
	{
		slotno=rs.getInt(1);
		msg="Parking Slot No "+slotno;		 
	}
	else
	{
		msg="Vehicle not found";
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
<form name="form1" action="p4.jsp" method="post">
<table>
<tr>
<td colspan="2">Get Slot No</td>
</tr>
<tr>
<td>Vehicle Reg No</td>
<td><input type="text" name="t1" required value="<%=regno%>" /></td>
</tr>
<tr>
<td><input type="submit" name="b1" value="Get Slot No"/></td>
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