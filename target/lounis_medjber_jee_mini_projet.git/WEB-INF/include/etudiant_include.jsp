<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="fragment"> 
<c:if test="${param.etudiant_id_selected != null}">
<c:set var="et_selected" value="${Etudiant.getOneById(param.etudiant_id_selected) }"/>
</c:if>

<c:choose>
  <c:when test="${param.submitEtudiant == 'add_Et'}"><!-- add etudiant -->
   ${Etudiant.addNew(param.etudiant_name_selected,param.etudiant_password_selected, param.universite_id_selected) != null ? 'ok':'error'}
  </c:when>
  <c:when test="${param.submitEtudiant == 'addBonus_Et'}"><!-- add bonus etudiant -->
   ${Etudiant.getOneById(param.etudiant_id_selected).addBonus() >= 0 ? 'ok' : 'error'}
  </c:when>
  <c:when test="${param.submitEtudiant == 'update_Et'}"><!-- update etudiant -->
   ${Etudiant.updateEtudiant(param.etudiant_id_selected,param.etudiant_name_selected,param.etudiant_password_selected, param.universite_id_selected) != null ? 'ok' : 'error'}
  </c:when>
  <c:when test="${param.submitEtudiant == 'delete_Et'}"><!-- update etudiant -->
   ${Etudiant.getOneById(param.etudiant_id_selected).delete() == true ? 'ok' : 'error'}
  </c:when>
</c:choose>

<!----------------------------------------------- html submit etudiant-->
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input id='in_id' type="text"  name="etudiant_id_selected" value="${(et_selected != null ) ? et_selected.id : ''}" style="background-color: #AAAAAA" readonly/></td></tr>
	<tr><td>NAME </td><td><input id='in_nm' type="text" name="etudiant_name_selected"  value="${(et_selected != null ) ? et_selected.name : ''}"/></td></tr>
	<tr><td>PASSWORD </td><td><input id='in_pwd' type="text" name="etudiant_password_selected" value="${(et_selected != null ) ? et_selected.password : ''}"/></td></tr>
	<tr><td>Size Package </td><td><input id='in_sp' type="text"  value="${(et_selected != null ) ? et_selected.sizePackage : ''}" style="background-color: #AAAAAA" readonly/></td></tr>
    
	<tr><td>Universite </td><td>
		<select name="universite_id_selected">
			<c:forEach var="u" items="${Universite.search('')}">
		  		<option 
		  		${(et_selected != null)?(et_selected.universite.id == u.id ) ? 'selected':'':''}
		  		 value="${u.id}">
				${u.name}
		  		</option>
			</c:forEach>
		</select>
	</td></tr>
   	</table>
    <input type="submit" name="submitEtudiant" value="add_Et" />
    <input type="submit" name="submitEtudiant" value="addBonus_Et" />
    <input type="submit" name="submitEtudiant" value="update_Et" />
    <input type="submit" name="submitEtudiant" value="delete_Et" />
</form>
<!-- ----------------------------------------------------------- clear inputs -->
<script type="text/javascript">
function ClearMyInput() {
	document.getElementById('in_id').value = '';
	document.getElementById('in_nm').value = '';
	document.getElementById('in_pwd').value = '';
	document.getElementById('in_sp').value = '';
}
</script>
<button onclick="ClearMyInput()">Clear</button>
<!-- ----------------------------------------------------------- search -->
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

</div>