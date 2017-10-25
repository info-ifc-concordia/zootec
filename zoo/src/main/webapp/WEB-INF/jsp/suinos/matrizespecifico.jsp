<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>



<nav class="navbar navbar-default">
  <div class="container-fluid">

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#" id="s_info">Informações</a></li>
        <li><a href="#" id="s_hist">Histórico</a></li>
        <li><a href="#" id="s_cober">Coberturas</a></li>
      </ul>
    </div>
  </div>
  
</nav>

		<c:forEach items="${matriz2}" var="m">			
			<c:choose>
				<c:when test="${m.mossa == ola}">
					<c:set var = "m" scope = "session" value = "${m}"/>	
				</c:when>
			</c:choose>
			</c:forEach>

<main class = "container">	
	<div id="s_divInfo">	
		
	<div class="btn-group" role="group" aria-label="...">		
		<table class="table table-striped">
		<tbody>
		<tr>
			<td>Mossa</td>
			<td>Raça</td>
			<td>Tipo?</td>
			<td>Origem</td>
			<td>Vigilância</td>
			<td>Cadastrador</td>
			<td>Data próximo nascimento</td>
			<td>Cobertura atual</td>
			<td>Porcos ativos</td>
		</tr>
			<tr>
				<td>${m.mossa}</td>
				<td>${m.raca}</td>
				<td>.</td>
				<td>.</td>
				<td>.</td>
				<td>.</td>
				<td>${m.prox}</td>
				<td>.</td>
				<td>.</td>
			</tr>			
		</tbody>
		</table>
		<a type="button" class="btn btn-primary" href="<c:url value="/Registronascimento/${m.mossa}"/>" role="button">Registrar nascimento</a>
		<a type="button" class="btn btn-primary" href="<c:url value="/editarmatriz/${m.mossa}"/>" role="button">Editar Matriz</a>
  		<a type="button" class="btn btn-primary">Tranferência</a>  		
	</div>
	
	</div>
	
	<div id="s_divHist">
	
	<table class="table table-striped">
		<thead>
		<tr>
			<th>Cachaço</th>
			<th>Data de Cobertura</th>
			<th>Data de nascimento</th>
			<th>Vivos</th>
			<th>Natimortos</th>
			<th>Natimortos</th>
			<th>Mumificados</th>
			<th>Total de nascimentos</th>

				
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${nascimento}" var="n">
			<c:choose>
				<c:when test="${n.mossa == ola}">
				<tr>
					<td>${n.cachaco}</td>
					<td>${n.data_cobertura}</td>
					<td>${n.data}</td>
					<td>${n.vivos}</td>
					<td>${n.natimortos}</td>
					<td>${n.mumificados}</td>
					<td>${n.total_mortos}</td>
					<td>${n.total}</td>

				</tr>
				</c:when>
			</c:choose>
			</c:forEach>
		</tbody>
		</table>


	</div>
	
	<div id="s_divCober">
	
	<h6>Cobertura ativa</h6>
	
	<table class="table table-striped">
		<thead>
		<tr>
			<th>Cachaço</th>
			<th>Data</th>
			<th>Tipo</th>
			<th>Status</th>					
		</tr>
		</thead>
		<tbody>
			<c:set var="available" value="available"/>
			<c:forEach items="${cobertura}" var="c">
			<c:choose>
				<c:when test="${c.mossa == ola && c.status == available}">
				<tr>
					<td>${c.cachaco}</td>
					<td>${c.data_cobertura}</td>
					<td>${c.tipo}</td>
					<td>${c.status}</td>
				</tr>
				</c:when>
			</c:choose>
			</c:forEach>
		</tbody>
		</table>
	
	<h6>Histótico de cobeturas</h6>
	
	<table class="table table-striped">
		<thead>
		<tr>
			<th>Cachaço</th>
			<th>Data</th>
			<th>Tipo</th>
			<th>Status</th>					
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${cobertura}" var="c">
			<c:choose>
				<c:when test="${c.mossa == ola && c.status != available}">
				<tr>
					<td>${c.cachaco}</td>
					<td>${c.data_cobertura}</td>
					<td>${c.tipo}</td>
					<td>${c.status}</td>
				</tr>
				</c:when>
			</c:choose>
			</c:forEach>
		</tbody>
		</table>
		
	</div>
	
</main>

<script>
window.onload = function(e) {
	matrizEspecifico();
};
</script>

<c:import url="/includes/footer.jsp"/>