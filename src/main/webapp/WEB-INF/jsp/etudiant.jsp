<%@page import="model.entities.Book"%>
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

<c:if test="${sessionScope.sessionLogin == 'etudiant' }">
<table>
  <tr>
    <th><h2>etudiant</h2></th>
    <th>
    <FORM METHOD="POST">
    	<input type="submit" NAME="logout" value="logout" />
	</FORM>
	</th>
  </tr>
</table>

<h2> ${sessionScope.etudiant.name} </h2>
<h3> My Books Not Expire </h3>
<c:forEach var="b" items="${sessionScope.etudiant.getMyBooksNotExpire()}">
		${b.name}</br>
</c:forEach>

</c:if>
</body>
</html>