<%@page import="model.entities.Universite"%>
<%@page import="model.entities.PackageType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.entities.Etudiant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<c:catch var ="catchException">
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

<div style="width: 30%; float: left; overflow: scroll;border-style:solid;height: 500; background-color: #AAAAAA; border-color: #0000FF"> 
<!-- ******************************************* add etudiant -->
<c:if test="${param.submitEtudiant == 'addEtudiant' }">
<% 
try{
	Etudiant etudiant_n =new Etudiant();
	etudiant_n.setName(request.getParameter("name_etudiant_selected"));
	etudiant_n.setPassword(request.getParameter("password_etudiant_selected"));
	Long id_u = Long.valueOf(request.getParameter("universite_id_selected"));
	etudiant_n.setUniversite(Universite.getOne(id_u));
	etudiant_n.create();
}catch(Exception e){
	out.append("<script type='text/javascript'>alert('error input ');</script>");
}
%>
</c:if>
<!----------------------------------------------- add bonus etudiant -->
<c:if test="${param.submitEtudiant == 'addBonusEtudiant' }">
${Etudiant.getOne(param.id_etudiant_selected).addBonus() }
</c:if>
<!----------------------------------------------- update etudiant -->
<c:if test="${param.submitEtudiant == 'updateEtudiant' }">
<c:set var="etudiant_u" value="${Etudiant.getOne(param.id_etudiant_selected)}" />
${etudiant_u.setName(param.name_etudiant_selected) }
${etudiant_u.setPassword(param.password_etudiant_selected) }
${etudiant_u.setUniversite(Universite.getOne(param.universite_id_selected)) }
${etudiant_u.update()}
</c:if>
<!----------------------------------------------- delete etudiant -->
<c:if test="${param.submitEtudiant == 'deleteEtudiant' }">
${Etudiant.getOne(param.id_etudiant_selected).delete()}
</c:if>
<!----------------------------------------------- html submit etudiant-->
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text" name="id_etudiant_selected" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).id : ''}" style="background-color: #AAAAAA" readonly/></td></tr>
	<tr><td>NAME </td><td><input type="text" name="name_etudiant_selected"  value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).name : ''}"/></td></tr>
	<tr><td>PASSWORD </td><td><input type="text" name="password_etudiant_selected" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).password : ''}"/></td></tr>
	<tr><td>ID Universite </td><td><input type="text" name="universite_id_selected" id="universite_id_selected" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).universite.id : ''}"/></td></tr>
    <tr><td>Universite </td><td><input type="text" name="universite_name_selected" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).universite.name : ''}" style="background-color: #AAAAAA" readonly/></td></tr>
   	<tr><td>Size Package </td><td><input type="text" name="universite_name_selected" value="${(param.selectEtudiant != null ) ? Etudiant.getOne(param.selectEtudiant).sizePackage : ''}" style="background-color: #AAAAAA" readonly/></td></tr>
    </table>
    <button onclick="document.getElementById('input').value = ''">Clear</button> 
    <input type="submit" name="submitEtudiant" value="addEtudiant" />
    <input type="submit" name="submitEtudiant" value="addBonusEtudiant" />
    <input type="submit" name="submitEtudiant" value="updateEtudiant" />
    <input type="submit" name="submitEtudiant" value="deleteEtudiant" />   
</form>

<!-- ******************************************************************* search -->
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
<!-- ******************************************************************* universite -->
<div style="width: 30%; float: left; border-style:solid; border-color: #FF0000"> 
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text"
	 value="${(param.selectUniversite != null ) ? Universite.getOne(param.selectUniversite).id : ''}"/></td></tr>
	<tr><td>NAME </td><td><input type="text"
	 value="${(param.selectUniversite != null ) ? Universite.getOne(param.selectUniversite).name : ''}"/></td></tr>
    <tr><td>Package Type </td><td><input type="text"
	 value="${(param.selectUniversite != null ) ? Universite.getOne(param.selectUniversite).packageType.name : ''}"/></td></tr>
    </table>
</form>
<form method="post">
    <input type="text" name="name_universite_searsh" placeholder="search" />
    <input type="submit" value="search" />
</form>

<table border="1">
<c:forEach var="universite_s" items="${Universite.search(param.name_universite_searsh)}">
  <tr><th width="40">${universite_s.id}</th> <th width="100">${universite_s.name}</th> 
  	  <th >
	  		<form method="post">
	  			<input type="hidden" name="selectUniversite" value="${universite_s.id}" />
		    	<input type="submit" value="select" />
			</form>
	  </th>
  </tr>
</c:forEach>
</table>
</div>
<!-- ******************************************************************* PackageType -->
<div style="width: 30%; float: left; border-style:solid; border-color: #FFFF00"> 
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text"
	 value="${(param.selectPackageType != null ) ? PackageType.getOne(param.selectPackageType).id : ''}"/></td></tr>
	<tr><td>NAME </td><td><input type="text"
	 value="${(param.selectPackageType != null ) ? PackageType.getOne(param.selectPackageType).name : ''}"/></td></tr>
    </table>
</form>
<form method="post">
    <input type="text" name="name_packagetype_searsh" placeholder="search" />
    <input type="submit" value="search" />
</form>

<table border="1">
<c:forEach var="packagetype_s" items="${PackageType.search(param.name_packagetype_searsh)}">
  <tr><th width="40">${packagetype_s.id}</th> <th width="100">${packagetype_s.name}</th> 
  	  <th >
	  		<form method="post">
	  			<input type="hidden" name="selectPackageType" value="${packagetype_s.id}" />
		    	<input type="submit" value="select" />
			</form>
	  </th>
  </tr>
</c:forEach>
</table>
</div>
<!-- ******************************************************************* search PackageType -->
</c:catch>
<c:if test = "${catchException != null}">

 </c:if>
</body> 
</html>
