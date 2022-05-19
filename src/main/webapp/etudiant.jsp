<%@page import="model.entities.Book"%>
<%@page import="java.util.List"%>
<%@page import="model.entities.Etudiant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<%@ include file="/WEB-INF/include/session_include.jsp" %>

<div style="width: 100%;">
    <div style="width: 50%; float: left;"> 
       <!-- ******************************************************************* all books -->
		<c:if test="${param.takeBook != null }"> 
		${sessionScope.etudiant.takeBookFromLibrary(Book.getOne(1))}
		</c:if>
		
		<h3> all books </h3>
		<!-- ***************************************   input search  -->
		<form method="post">
		    <input type="text" name="name" placeholder="search" />
		    <input type="submit" value="search" />
		</form>
		<table border="1" >
		<tr><th>ID BOOK</th><th>NAME BOOK</th><th>DOMAIN BOOK</th><tr>
		<c:forEach var="b" items="${Book.search(param.name)}">
		  <tr>
		  <th>${b.id}</th><th>${b.name}</th><th>${b.domaine}</th>
			<th >
			<!-- ***************************************   take Book  -->
	  		<form method="post">
	  			<input type="hidden" name="takeBook" value="${b.id}" />
		    	<input type="submit" value="add" />
			</form>
		  </th>
		  </tr>
		</c:forEach>
		</table> 
		<!-- ******************************************************************* all books -->
    </div>
    <div style="margin-left: 50%;"> 
       <!-- ******************************************************************* My Books Not Expire -->
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
		
		<h3> My Books Not Expire </h3>
		<table border="1" >
		<tr><th>ID BOOK</th><th>NAME BOOK</th><th>BEGGIN</th><th> END </th><tr>
		<c:forEach var="b" items="${sessionScope.etudiant.getMyBooksNotExpireAllInfo()}">
		  <tr><th width="30">${b[0]}</th><th>${b[1]}</th><th>${b[2]}</th><th>${b[3]}</th></tr>
		</c:forEach>
		</table>
		<!-- ******************************************************************* My Books Not Expire -->
    </div>
</div>
</body> 
</html>