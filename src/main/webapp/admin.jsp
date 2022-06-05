<%@page import="model.entities.Universite"%>
<%@page import="model.entities.PackageType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.entities.Etudiant"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style><%@ include file="/WEB-INF/css/styles.css" %></style>
</head>
<body>
<div style="width: 100%;">
<%@ include file="/WEB-INF/include/session_include.jsp" %>
<%@ include file="/WEB-INF/include/etudiant_include.jsp" %>
<%@ include file="/WEB-INF/include/universite_include.jsp" %>
<%@ include file="/WEB-INF/include/packagetype_include.jsp" %>
</div>
</body> 
</html>
