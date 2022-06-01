<%@page import="model.entities.Book"%>
<%@page import="java.util.List"%>
<%@page import="model.entities.Etudiant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<style><%@ include file="/WEB-INF/css/styles.css" %></style>
<body>
<div style="width: 100%;">
<%@ include file="/WEB-INF/include/session_include.jsp" %>
<%@ include file="/WEB-INF/include/book_include.jsp" %>
</div>
</body> 
</html>