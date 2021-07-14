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
String Emp_name=request.getParameter("User name");
String emp_password=request.getParameter("password");
String emp_mail=request.getParameter("email");
String emp_num=request.getParameter("num");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/innominds","root","karna");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from EmpReg"); 
	int match=0;
	while(rs.next())
	{
		if((rs.getString(3).equals(emp_mail) && rs.getString(2).equals(emp_password)))
		{
			match++;
			break;
		}
	}
	try
	{
	if(match==0)
	{
		String query="insert into EmpReg values(?,?,?,?)";
			PreparedStatement psmt=con.prepareStatement(query);
			psmt.setString(1, Emp_name);
			psmt.setString(2, emp_password);
			psmt.setString(3, emp_mail);
			psmt.setString(4, emp_num);
			psmt.executeUpdate();
			//System.out.println("Sussesfully registered ");
			response.sendRedirect("Success.html");
	}
	else
	{
		response.sendRedirect("Redirect.html");
		
    }
	}
	catch (SQLException e) 
	{
		e.printStackTrace();
	}
}
catch(Exception e)
{
	System.out.println(e);
}


	/*st.executeUpdate("insert into EmpReg(Emp_name,emp_password,emp_mail,emp_num) values ('"+Name+"','"+Password+"','"+Email+"','"+MobileNo+"')");
	
	/response.sendRedirect("save.html");
}
catch(Exception e){
	response.sendRedirect("error.html");
}*/

%>


</body>
</html>