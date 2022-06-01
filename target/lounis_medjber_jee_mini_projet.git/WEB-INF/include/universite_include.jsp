<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="fragment"> 
<h2> Universites manager </h2>
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text"
	 value="${(param.selectUniversite != null ) ? Universite.getOneById(param.selectUniversite).id : ''}"/></td></tr>
	<tr><td>NAME </td><td><input type="text"
	 value="${(param.selectUniversite != null ) ? Universite.getOneById(param.selectUniversite).name : ''}"/></td></tr>
    <tr><td>Package Type </td><td><input type="text"
	 value="${(param.selectUniversite != null ) ? Universite.getOneById(param.selectUniversite).packageType.name : ''}"/></td></tr>
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