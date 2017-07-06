<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> ZOO II </title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/tether.min.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/bootstrap/css/bootstrap.min.css"/>"/>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container-fluid">
			<div class="row" id="cabecalho">
			  <div class="col-xs-6 col-md-6">
			  	<img id="logo" src="imagens/logo-ifc.png">
			  </div>
			  <div class="col-xs-6 col-md-6">
			  	<div id="teste">
			  		<p id="nome_modulo"><b>Nome do Módulo</b><br> <span id="setor">Setor da zootecnia do Instituto Federal Catarinense</span></p>
			  	</div>
			  </div>
			</div>

			<div class="row" id="barra_menu">
			  <div class="col-xs-6 col-md-6">
				<img id="home" src="imagens/home.png">
			  </div>
			  <div class="col-xs-6 col-md-6">
			  	<button id="login">Login</button>
			  </div>
			</div>		
		</div>