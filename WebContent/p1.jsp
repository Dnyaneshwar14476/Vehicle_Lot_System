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
	ResultSet rs=db.getData("select SlotNo,Status from Model where Status='Y'");
	int slotno=0;
	while(rs.next())
	{
		slotno=rs.getInt(1);
		break;
		
	}
	if(slotno==0)
	{
		msg="Space is not available";
	}
	else
	{
		db.execute("Update Model set RegNo="+regno+",Status='N',StartTime='"+System.currentTimeMillis()+"' where SlotNo="+slotno);
		msg="Parking Slot No "+slotno+" is allocated for vehcile";
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
<form name="form1" action="p1.jsp" method="post">
<table style="width:400px">
<tr>
<td colspan="2" class="head">Park Vehicle</td>
</tr>
<tr>
<td>Vehicle Reg No</td>
<td><input type="text" name="t1" value="<%=regno%>" required placeholder="Reg No"/></td>
</tr>
<tr>
<td><input type="submit" name="b1" value="Park"/></td>
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