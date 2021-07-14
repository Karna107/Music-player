<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*,java.util.*, javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String emp_password=request.getParameter("password");
String emp_mail=request.getParameter("email");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/innominds", "root", "karna");
	Statement stmt = con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from EmpReg");
	int count=0;
	while(rs.next())
	{
		if(rs.getString(2).equals(emp_password) && rs.getString(3).equals(emp_mail))
		{
			count++;
			if(count==1){
							
		      response.sendRedirect("Open.html");	
			}
	    }	
	}	
	  if(count!=1)
	   {
		response.sendRedirect("error.html");
	    }
	con.close();
}
catch(ClassNotFoundException | SQLException  e)
{
	e.printStackTrace();
}
%>


</body>
</html>