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
	<script src=<c:url value="/js/index.js"/> type="text/js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col col-xs-6 topbar">
				<img id="logo" src="imagens/logo-ifc.png" />
			</div>
			<div class="col col-xs-6 topbar text-right">
				<div id="teste">
					<p id="nome_modulo">
						<c:choose>
							<c:when test="${userSession.pagina == null}">
								<br>
								<span id="setor">Setor da zootecnia do Instituto Federal
									Catarinense</span>
							</c:when>
							<c:when test="${userSession.pagina == 'vaquinhas'}">
								<b> Controle de Bovinos </b>
								<br>
								<span id="setor">Setor da zootecnia do Instituto Federal
									Catarinense</span>
							</c:when>
							<c:when test="${userSession.pagina == 'racao'}">
								<b> Controle de Racão</b>
								<br>
								<span id="setor">Setor da zootecnia do Instituto Federal
									Catarinense</span>
							</c:when>
							<c:when test="${userSession.pagina == 'suinos'}">
								<b> Controle de Suínos</b>
								<br>
								<span id="setor">Setor da zootecnia do Instituto Federal
									Catarinense</span>
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
				<a href="<c:url value = "/"/>" class="navbar-brand" class="nav-text">
					<span style="color: #FFFFFF;"><span
						class="glyphicon glyphicon-home"></span></span>
				</a>
			</div>

			<div class="collapse navbar-collapse">

				<c:choose>
					<c:when test="${!userSession.isLogged()}">
						<ul class="nav navbar-nav navbar-right">
							<li><a id="login1" href="<c:url value="/login"/>"><span
									style="color: #FFFFFF;">Login</span></a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${userSession.pagina == 'vaquinhas' }">
								<ul class="nav navbar-nav">
									<li><a href="<c:url value="/Cadastro"/>"> <span
											style="color: #FFFFFF;"><span
												class="glyphicon glyphicon-tasks"></span> Cadastrar </span>
									</a></li>
									<li><a href="<c:url value="/Editar"/>"> <span
											style="color: #FFFFFF;"><span
												class="glyphicon glyphicon-pencil"></span> Editar </span>
									</a></li>
								</ul>
							</c:when>
							<c:when test="${userSession.pagina == 'racao'}">
								<ul class="nav navbar-nav">
									<li><a href="<c:url value="/Racao"/>"> <span
											style="color: #FFFFFF;"><span
												class="glyphicon glyphicon-book"></span> Produções </span>
									</a></li>

									<li><a href="<c:url value="/control"/>"> <span
											style="color: #FFFFFF;"><span
												class="glyphicon glyphicon-tasks"></span> Controle </span>
									</a></li>


								</ul>
							</c:when>
							<c:when test="${userSession.pagina == 'suinos' }">
								<ul class="nav navbar-nav">
							
							<!-- Dropdowm de controle matrizes -->		
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span style="color: #FFFFFF;"><span
								class="glyphicon glyphicon-piggy-bank"></span> 
								<span id="Drop_Matrizes">Matrizes</span> <span class="caret"></span></a>
											
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/CadastroSuino"/>"><span class="glyphicon glyphicon-plus"></span>
									 Cadastrar </a></li>
											
									<li><a href="<c:url value="/ListarMatrizes"/>"><span class="glyphicon glyphicon-th-list"></span> 
									 Listar</a></li>
									 
									 <li><a href="<c:url value="/TranferirPorcos"/>"><span class="glyphicon glyphicon-transfer"></span> 
									 Transferir</a></li>
									 
								</ul></li>
							
							<!-- Dropdown de controle coberturas-->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span style="color: #FFFFFF;"><span
								class="glyphicon glyphicon-list-alt"></span> 
								<span id="Drop_Matrizes">Coberturas</span> <span class="caret"></span></a>
											
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/registrocobertura"/>"><span class="glyphicon glyphicon-plus"></span>
									 Registrar </a></li>
											
									<li><a href="<c:url value="/ListarCoberturas"/>"><span class="glyphicon glyphicon-th-list"></span> 
									 Listar</a></li>
								</ul></li>	
								
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span style="color: #FFFFFF;"><span
								class="glyphicon glyphicon-calendar"></span> 
								<span id="Drop_Matrizes">Nascimentos</span> <span class="caret"></span></a>
											
								<ul class="dropdown-menu">
									<li><a href="<c:url value="/"/>"><span class="glyphicon glyphicon-plus"></span>
									 Registrar </a></li>
											
									<li><a href="<c:url value="/ListarNascimentos"/>"><span class="glyphicon glyphicon-th-list"></span> 
									 Listar</a></li>
								</ul></li>								
								
								<!-- Botão de controle -->
								<li><a href="<c:url value="/controlSuinos"/>"> <span
										style="color: #FFFFFF;"><span
										class="glyphicon glyphicon-tasks"></span> Controle </span>
								</a></li>							
								</ul>
							</c:when>
						</c:choose>
						
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span style="color: #FFFFFF;"><span
										class="glyphicon glyphicon-user"></span> <span id="userLogged">
											${userSession.user.nome}</span> <span class="caret"></span></a>
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