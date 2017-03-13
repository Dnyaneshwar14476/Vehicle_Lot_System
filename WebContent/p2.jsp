<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.DBClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String msg="";
String regno="";
DBClass db=new DBClass();
if(request.getParameter("b1")!=null)
{
	regno=request.getParameter("t1");
	ResultSet rs=db.getData("select * from Model where RegNo="+regno);
	int slotno=0;
	if(rs.next())
	{
		long st=Long.parseLong(rs.getString(4));
		long endTime=System.currentTimeMillis();
		long dif=endTime-st;
		dif=dif/60000;
		
		msg="Parking Charges paid RS."+dif;
		db.execute("Update Model set Status='Y' where RegNo="+regno); 
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
<form name="form1" action="p2.jsp" method="post">
<table>
<tr>
<td colspan="2">Remove Vehicle</td>
</tr>
<tr>
<td>Vehicle Reg No</td>
<td><input type="text" name="t1" required value="<%=regno%>"/></td>
</tr>
<tr>
<td><input type="submit" name="b1" value="Remove Park"/></td>
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