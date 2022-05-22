<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="fragment"> 
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text"
	 value="${(param.selectPackageType != null ) ? PackageType.getOneById(param.selectPackageType).id : ''}"/></td></tr>
	<tr><td>NAME </td><td><input type="text"
	 value="${(param.selectPackageType != null ) ? PackageType.getOneById(param.selectPackageType).name : ''}"/></td></tr>
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