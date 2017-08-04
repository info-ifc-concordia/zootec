<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> ZOO II </title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/tether.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>"/>
</head>
<body>
	<div class="container">
	  <div class="row">
		  <div class="col col-xs-6 topbar">
		  	<img id="logo" src="imagens/logo-ifc.png" />
		  </div>
		  <div class="col col-xs-6 topbar text-right">
		  	<div id="teste">
		  		<p id="nome_modulo"><b>Bovinos</b><br> <span id="setor">Setor da zootecnia do Instituto Federal Catarinense</span></p>
		  	</div>
		  </div>
	  </div>
	</div>
	<nav class="navbar navbar-inverse" id="barra_menu">
		<div class="container">
		    <div class="navbar-header">
		    	<a href="<c:url value = "/"/>" class="navbar-brand"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
		    </div>
		    <div class="collapse navbar-collapse">
		    <ul class="nav navbar-nav navbar-right">
		        <li><a id="login" type="button" href="<c:url value="/cadastro"/>">Cadastro</a></li>
		      </ul>
		    <ul class="nav navbar-nav navbar-right">
		        <li><a id="login" type="button" href="<c:url value="/UserList"/>">Usuarios</a></li>
		      </ul>
		    <c:choose>
		    <c:when test= "${!userSession.isLogged()}">
		      <ul class="nav navbar-nav navbar-right">
		        <li><a id="login" type="button" href="<c:url value="/login"/>">Login</a></li>
		      </ul>
		    </c:when>
		    <c:otherwise>
		    <ul class="nav navbar-nav navbar-right">
		        <li><a id="login" type="button" href="<c:url value="/exitUser"/>"> Sair </a></li>
		      </ul>
		    </c:otherwise>
		    </c:choose> 
		    </div>
		  </div>
	</nav>
	<main class="container">