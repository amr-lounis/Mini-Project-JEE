<%@page import="model.entities.Universite"%>
<%@page import="model.entities.PackageType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.entities.Etudiant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<!-- ******************************************************************* session-->
<c:if test="${param.logout == 'logout' }"> 
	 ${sessionScope.session_login = null } 
	 <c:redirect url = "/"/>
</c:if>

<c:if test="${sessionScope.session_login == 'admin' }"> 
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
<!-- ******************************************************************* redirect to main if gest login-->
</c:if>
<c:if test="${sessionScope.session_login == null }">
<c:redirect url = "/"/>
</c:if>

<div style="width: 25%; float: left; overflow: scroll;border-style:solid;height: 500; background-color: #AAAAAA"> 
<!-- ******************************************* add etudiant -->
${param.submit}
<c:if test="${param.submit == 'addEtudiant' }">
<% 
new Etudiant(request.getParameter("name_etudiant_selected"), request.getParameter("password_etudiant_selected"), Universite.getOne(1l)).create();
%>
</c:if>
<!--  ******************************************* update etudiant -->
<c:if test="${param.submit == 'updateEtudiant' }">
<c:set var="etudiant_u" value="${Etudiant.getOne(param.id_etudiant_selected)}" />
${etudiant_u.name = param.name_etudiant_selected }
${etudiant_u.password = param.password_etudiant_selected }
${etudiant_u.update()}
</c:if>
<!--  ******************************************* delete etudiant -->
<c:if test="${param.submit == 'deleteEtudiant' }">
${Etudiant.getOne(param.id_etudiant_selected).delete()}
</c:if>
<!--  ******************************************* html submit -->
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text" name="id_etudiant_selected" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).id : ''}"/></td></tr>
	<tr><td>NAME </td><td><input type="text" name="name_etudiant_selected""  value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).name : ''}"/></td></tr>
	<tr><td>PASSWORD </td><td><input type="text" name="password_etudiant_selected"" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).password : ''}"/></td></tr>
    <tr><td>Universite </td><td><input type="text" name="universite_name_selected"" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).password : ''}"/></td></tr>
    </table>
    <input type="submit" name="submit" value="addEtudiant" />
    <input type="submit" name="submit" value="updateEtudiant" />
    <input type="submit" name="submit" value="deleteEtudiant" />
</form>
<!-- ******************************************************************* add search -->
<form method="post">
    <input type="text" name="name_etudiant_searsh" placeholder="search" />
    <input type="submit" value="search" />
</form>

<table border="1">
<c:forEach var="e" items="${Etudiant.search(param.name_etudiant_searsh)}">
  <tr><th width="40">${e.id}</th> <th width="100">${e.name}</th> 
	  <th >
	  		<form method="post">
	  			<input type="hidden" name="selectEtudiant" value="${e.id}" />
		    	<input type="submit" value="select" />
			</form>
	  </th>
  </tr>
</c:forEach>
</table>
</div>
<!-- ******************************************************************* search Universite -->
<div style="width: 25%; float: left; border-style:solid; border-bottom-color: #000000"> 
<table border="1">
<c:forEach var="e" items="${Universite.search(param.name)}">
  <tr><th width="40">${e.id}</th> <th width="100">${e.name}</th> 
  </tr>
</c:forEach>
</table>
</div>
<!-- ******************************************************************* search PackageType -->
<div style="margin-left: 25%;"> 
<table border="1">
<c:forEach var="e" items="${PackageType.search(param.name)}">
  <tr><th width="40">${e.id}</th> <th width="100">${e.name}</th> 
  </tr>
</c:forEach>
</table>
</div>
</body> 
</html>