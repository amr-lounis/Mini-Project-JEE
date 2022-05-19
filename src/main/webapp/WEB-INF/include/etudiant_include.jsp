<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="width: 35%; float: left; overflow: scroll;border-style:solid;height: 500; background-color: #AAAAAA; border-color: #0000FF"> 

<c:choose>
  <c:when test="${param.submitEtudiant == 'addEtudiant'}"><!-- add etudiant -->
   ${Etudiant.addNew(param.etudiant_name_selected,param.etudiant_password_selected, param.universite_id_selected)}
  </c:when>
  <c:when test="${param.submitEtudiant == 'addBonusEtudiant'}"><!-- add bonus etudiant -->
   ${Etudiant.getOneById(param.etudiant_id_selected).addBonus() >= 0 ? 'ok' : 'error'}
  </c:when>
  <c:when test="${param.submitEtudiant == 'updateEtudiant'}"><!-- update etudiant -->
   ${Etudiant.updateEtudiant(param.etudiant_id_selected,param.etudiant_name_selected,param.etudiant_password_selected, param.universite_id_selected) != null ? 'ok' : 'error'}
  </c:when>
  <c:when test="${param.submitEtudiant == 'deleteEtudiant'}"><!-- update etudiant -->
   ${Etudiant.getOneById(param.etudiant_id_selected).delete() == true ? 'ok' : 'error'}
  </c:when>
</c:choose>

<!----------------------------------------------- html submit etudiant-->
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text" name="etudiant_id_selected" value="${(param.etudiant_id_selected != null ) ? Etudiant.getOneById(param.etudiant_id_selected).id : ''}" style="background-color: #AAAAAA" readonly/></td></tr>
	<tr><td>NAME </td><td><input type="text" name="etudiant_name_selected"  value="${(param.etudiant_id_selected != null ) ? Etudiant.getOneById(param.etudiant_id_selected).name : ''}"/></td></tr>
	<tr><td>PASSWORD </td><td><input type="text" name="etudiant_password_selected" value="${(param.etudiant_id_selected != null ) ? Etudiant.getOneById(param.etudiant_id_selected).password : ''}"/></td></tr>
	<tr><td>Size Package </td><td><input type="text"  value="${(param.etudiant_id_selected != null ) ? Etudiant.getOneById(param.etudiant_id_selected).sizePackage : ''}" style="background-color: #AAAAAA" readonly/></td></tr>
    
	<tr><td>Universite </td><td>
		<select name="universite_id_selected">
			<c:forEach var="u" items="${Universite.search('')}">
		  		<option 
		  		${(param.etudiant_id_selected != null )?(Etudiant.getOneById(param.etudiant_id_selected).universite.id == u.id ) ? 'selected':'':''}
		  		 value="${u.id}">
				${u.name}
		  		</option>
			</c:forEach>
		</select>
	</td></tr>
   	</table>
    <input type="submit" name="submitEtudiant" value="addEtudiant" />
    <input type="submit" name="submitEtudiant" value="addBonusEtudiant" />
    <input type="submit" name="submitEtudiant" value="updateEtudiant" />
    <input type="submit" name="submitEtudiant" value="deleteEtudiant" />
</form>
    <button onclick="document.getElementById('input').value = ''">Clear</button>
<!-- ******************************************************************* search -->
<form method="post">
    <input type="text" name="name_etudiant_searsh" placeholder="search" />
    <input type="submit" value="search" />
</form>

<table border="1">
<c:forEach var="e" items="${Etudiant.search(param.name_etudiant_searsh)}">
  <tr><th width="40">${e.id}</th> <th width="100">${e.name}</th> 
	  <th><form method="post">
	  			<input type="hidden" name="etudiant_id_selected" value="${e.id}" />
		    	<input type="submit" value="select" />
	  </form></th>
  </tr>
</c:forEach>
</table>
</div>