<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@page import="model.entities.Etudiant"%>
<html>
<head>
<title>sign in</title>
</head>
<body>

<% 
    if(request.getParameter("logout") != null) {
    	request.getSession().setAttribute("user", null);
    }
%>
    
<%
Etudiant e1 =  (Etudiant)request.getSession().getAttribute("user");
if(e1!=null){
%>
	<h2> Etudiant login is <%=e1.getName() %> </h2>
    <FORM METHOD="POST">
        <input type="submit" NAME="logout" value="logout" />
    </FORM>
<%
}else{
	out.append("<h2> Etudiant Not Signed </h2>");
}
%>

<%	
String name = request.getParameter("name");
String password = request.getParameter("password");

if(name != null & password != null) 
if(!name.isEmpty() &!password.isEmpty() ){
	out.append("name : "+name+" password : "+password + "<br>");
	Etudiant e = Etudiant.login(name, password);
	if(e!=null){
		out.append("login is ok <br>");
	}else{
		out.append("error in user name or password <br>");
	}
	request.getSession().setAttribute("user", e);
}
else {
	response.getWriter().append("user name or password is NULL");
}
	
%>

 
<form method="post">
    UserName: <input type="text" name="name" /><br />
    Password: <input type="text" name="password" /><br />
    <input type="submit" value="Submit Form" />
</form>
 
</body>
</html>