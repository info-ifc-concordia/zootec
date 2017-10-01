<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZOO II</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/tether.min.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/style.css"/>" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col col-xs-6 topbar">
				<img id="logo" src="/zoo/imagens/logo-ifc.png" />
			</div>
			<div class="col col-xs-6 topbar text-right">
				<div id="teste">
					<p id="nome_modulo">
					<c:choose>
					<c:when test = "${userSession.pagina == null}">
						<br>
						<span id="setor">Setor da zootecnia do Instituto Federal Catarinense</span>
					</c:when>
					<c:when test ="${userSession.pagina == 'vaquinhas'}">
						<b>  Controle de Bovinos </b>
						<br>
						<span id="setor">Setor da zootecnia do Instituto Federal Catarinense</span>
					</c:when>
					<c:when test ="${userSession.pagina == 'racao'}">
						<b>  Controle de Racão ou whatever </b>
						<br>
						<span id="setor">Setor da zootecnia do Instituto Federal Catarinense</span>
					</c:when>
					</c:choose>
					</p>
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-default" id="barra_menu">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="<c:url value = "/"/>" class="navbar-brand" class="nav-text"> <span style="color:#FFFFFF;"><span
					class="glyphicon glyphicon-home"></span></span></a>
			</div>

			<div class="collapse navbar-collapse">

				<c:choose>
					<c:when test="${!userSession.isLogged()}">
						<ul class="nav navbar-nav navbar-right">
							<li><a id="login1" href="<c:url value="/login"/>" ><span style="color:#FFFFFF;">Login</span></a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<c:choose>
						<c:when test="${userSession.pagina == 'vaquinhas' }">
						<ul class="nav navbar-nav">
							<li><a href="<c:url value="/Vaquinhas"/>"> <span style="color:#FFFFFF;"><span
									class="glyphicon glyphicon-search"></span> Search </span></a>
							</li>
							<li><a href="<c:url value="/Cadastro"/>"> <span style="color:#FFFFFF;"><span
									class="glyphicon glyphicon-tasks"></span> Cadastrar </span>
							</a></li>
						</ul>
						</c:when>
						<c:when test ="${userSession.pagina == 'racao'}">
						<ul class="nav navbar-nav">
							<li><a href="<c:url value="/control"/>"> <span style="color:#FFFFFF;"><span
									class="glyphicon glyphicon-tasks"></span> Controle </span>
							</a></li>
						</ul>
						</c:when>
						</c:choose>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span style="color:#FFFFFF;"><span class="glyphicon glyphicon-user"></span>
									${userSession.user.nome} <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/perfilUser"/>"><span
											class="glyphicon glyphicon-user"></span> Perfil</a></li>
									<li><a href="<c:url value="/UserList"/>"><span
											class="glyphicon glyphicon-th-list"> Usuários</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="<c:url value="/exitUser"/>"> <span
											class="glyphicon glyphicon-remove"></span> Sair
									</a></li>
								</ul></li>
						</ul>


					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>