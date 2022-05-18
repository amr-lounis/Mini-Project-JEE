<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.DB"%>
<%@page import="model.entities.Etudiant"%>
<%@page import="java.util.List"%>
<html>
<head>
<style>
#content {text-align: center;background-color: #AAAAAA;padding: 50;margin: 50;}
#footer {text-align: center;background-color: #AA0000;padding: 10;margin: 50;}
table {   margin-left: auto;margin-right: auto;table-layout:auto; }

</style>
</head>
<body>

<div id="header">
${DB.init()}
</div>

<c:choose>
  <c:when test="${(param.name eq 'admin') and (param.password eq 'admin')}">
    <c:set var="session_login" value="admin" scope="session" />
  </c:when>
  <c:when test="${Etudiant.login(param.name, param.password) != null}">
	<c:set var="session_login" value="etudiant" scope="session" />
	<c:set var="etudiant" value="${Etudiant.login(param.name, param.password)}" scope="session" />
  </c:when>
  <c:when test="${param.name eq null}">
  	<c:set var="error" value=""/>
  </c:when>
  <c:otherwise>
    <c:set var="error" value="error username || password"/>
  </c:otherwise>
</c:choose>

<c:if test="${sessionScope.session_login eq 'admin' }"> 
	<c:redirect url = "/admin.jsp"/>
</c:if>
<c:if test="${sessionScope.session_login eq 'etudiant' }"> 
	 <c:redirect url = "/etudiant.jsp"/>
</c:if>

</div>

<div id="content">

<form method="post">
    <input type="text" name="name" placeholder="UserName" /><br />
    <input type="text" name="password" placeholder="Password"/><br />
    <input type="submit" value="Submit Form" />
    <br>
    ${error}
</form>
</div>

<div id="footer">
<table border="1">
  <tr><th>user</th> <th>user name</th> <th>password</th></tr>
  <tr><th>01</th> <th>admin</th> <th>admin</th></tr>
  <tr><th>02</th> <th>etudiant01</th> <th>password01</th></tr>
</table>
</div>

</body>
</html>
