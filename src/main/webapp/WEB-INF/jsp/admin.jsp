<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="model.entities.Etudiant"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>Admin</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<h2> Admin </h2>

<h3> List of all etudiant </h3>
<%
List <Etudiant> le =Etudiant.search("");
for (Etudiant etudiant : le) {
	out.append("etudiant name : "+etudiant.getName()+" ------ password : "+etudiant.getPassword()+"<br>");
}
%>
</body>
</html>