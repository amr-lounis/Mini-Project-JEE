<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.entities.Etudiant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>

<c:if test="${param.logout == 'logout' }"> 
	 ${sessionScope.sessionLogin = null } 
	 <c:redirect url = "/"/>
</c:if>

<c:if test="${sessionScope.sessionLogin == 'admin' }"> 
<table>
  <tr>
    <th><h2>admin</h2></th>
    <th>
    <FORM METHOD="POST">
    	<input type="submit" NAME="logout" value="logout" />
	</FORM>
	</th>
  </tr>
</table>
</c:if>
 
<c:forEach var="e" items="${Etudiant.search('')}">
        <c:out value="${e.name}"/><br>
</c:forEach>

</body> 
</html>