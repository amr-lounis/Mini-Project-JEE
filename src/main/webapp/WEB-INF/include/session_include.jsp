<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${param.logout == 'logout' }"> 
	 ${sessionScope.session_login = null } 
	 <c:redirect url = "/"/>
</c:if>

<c:if test="${sessionScope.session_login == null }"><!--  redirect to main if not login-->
<c:redirect url = "/"/>
</c:if>

<c:if test="${sessionScope.session_login != null }"> 
<table>
  <tr>
    <th><h2>${sessionScope.session_login}</h2></th>
    <th>
    <FORM METHOD="POST">
    	<input type="submit" NAME="logout" value="logout" />
	</FORM>
	</th>
  </tr>
</table>

</c:if>
