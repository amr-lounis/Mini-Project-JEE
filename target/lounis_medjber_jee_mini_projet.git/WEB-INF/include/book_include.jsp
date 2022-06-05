<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="fragment"> 
		<h3> My INFO </h3>
		My NAME :
		${sessionScope.etudiant.name}
		<br>
		My Universite :
		${sessionScope.etudiant.universite.name}
		<br>
		Package type of Universite :
		${sessionScope.etudiant.universite.packageType.name}
		<br>
	    My package Sizs :
		${sessionScope.etudiant.sizePackage}
		<br>
		Number Of My Books Not Expire is :
		${sessionScope.etudiant.getNumberOfMyBooksNotExpire()}
		<br>
		How many books can be added is :
		${sessionScope.etudiant.sizePackage - sessionScope.etudiant.getNumberOfMyBooksNotExpire()}
</div>


<div class="fragment"> 
<c:if test="${param.book_id_selected != null}">
<c:set var="bo_selected" value="${Book.getOneById(param.book_id_selected) }"/>
</c:if>

<c:choose>
  <c:when test="${param.Rental_Bo == 'Rental_Bo'}"><!-- add book -->
   ${sessionScope.etudiant.takeBookFromLibrary(Book.getOneById(bo_selected.id))}
  </c:when>
</c:choose>

<!----------------------------------------------- html submit book-->
<form method="post">
	<table border="1">
	<tr><td>ID </td><td><input type="text"  name="book_id_selected" value="${(bo_selected != null ) ? bo_selected.id : ''}"  readonly/></td></tr>
	<tr><td>NAME </td><td><input type="text" name="book_name_selected"  value="${(bo_selected != null ) ? bo_selected.name : ''}"/></td></tr>
	<tr><td>DOMAINE </td><td><input type="text" name="book_domaine_selected"  value="${(bo_selected != null ) ? bo_selected.domaine : ''}"/></td></tr>
   	</table>
    <input type="submit" name="Rental_Bo" value="Rental_Bo" />
</form>
<!-- ----------------------------------------------------------- search -->
<form method="post">
    <input type="text" name="name_book_searsh" placeholder="search" />
    <input type="submit" value="search" />
</form>

<table border="1">
<c:forEach var="b" items="${Book.search(param.name_book_searsh)}">
  <tr><th width="40">${b.id}</th> <th width="100">${b.name}</th> 
	  <th><form method="post">
	  			<input type="hidden" name="book_id_selected" value="${b.id}" />
		    	<input type="submit" value="select" />
	  </form></th>
  </tr>
</c:forEach>
</table>
</div>


<div class="fragment"> 

		<h3> My Books Not Expire </h3>
		<table border="1" >
		<tr><th>ID BOOK</th><th>NAME BOOK</th><th>BEGGIN</th><th> END </th><tr>
		<c:forEach var="b" items="${sessionScope.etudiant.getMyBooksNotExpireAllInfo()}">
		  <tr><th width="30">${b[0]}</th><th>${b[1]}</th><th>${b[2]}</th><th>${b[3]}</th><th><a href="books/${b[0]}.jpg">download</a></tr></tr>
		</c:forEach>
		</table>
</div>