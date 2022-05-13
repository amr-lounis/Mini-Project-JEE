<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="model.DB"%>
<%@page import="model.entities.Etudiant"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>sign in</title>
<style>
#content {text-align: center;background-color: #AAAAAA;padding: 50;margin: 50;}
#footer {text-align: center;background-color: #AA0000;padding: 50;margin: 50;}
</style>
</head>
<body>

<div id="header">

<%	
DB.init();

String name = request.getParameter("name");
String password = request.getParameter("password");

if(name != null & password != null) 
if(!name.isEmpty() & !password.isEmpty() ){
	if(name.equals("admin") & password.equals("admin")){
		request.getSession().setAttribute("sessionLogin", "admin");
	}else {
		Etudiant e = Etudiant.login(name, password);
		if(e!=null){
			request.getSession().setAttribute("sessionLogin", "etudiant");
			request.getSession().setAttribute("user", e);
		}else{
			request.setAttribute("error", "error username or password");
		}
	}
}
else{
	request.setAttribute("error", "username and password is null");
}

String sessionLogin = (String)request.getSession().getAttribute("sessionLogin");
if(sessionLogin!=null){
	  if(sessionLogin.equals("admin")){
		  request.getRequestDispatcher("/WEB-INF/jsp/admin.jsp").forward(request, response);
	  } 
	  else if(sessionLogin.equals("etudiant")){
	      request.getRequestDispatcher("/WEB-INF/jsp/etudiant.jsp").forward(request, response);
	  }
}
	
%>

</div>

<div id="content">
<form method="post">
    <input type="text" name="name" placeholder="UserName" /><br />
    <input type="text" name="password" placeholder="Password"/><br />
    <input type="submit" value="Submit Form" />
    <br>
    <%=(request.getAttribute("error") != null ) ? request.getAttribute("error") : "" %>
</form>
</div>

<div id="footer">
admin : admin --------------- password : admin <br>
etudiant : etudiant01 ------- password : password01
</div>

</body>
</html>
