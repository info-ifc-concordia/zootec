<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class = "container">
<legend>Lista de Coberturas</legend>

	<nav class="navbar navbar-default">
  	<div class="container-fluid">

    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      	<ul class="nav navbar-nav">
        	<li><a href="#" id="s_CoberCober">Coberturas ativas</a></li>
        	<li><a href="#" id="s_CoberHist">Histórico de coberturas</a></li>
      	</ul>
    	</div>
 	 </div>  
	</nav>	
	

	<c:choose><c:when test="${not empty cobertura}">
	
	<div id="s_show_CoberCober">
	
	<h5>Coberturas ativas</h5>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Mossa</th>
					<th>Cachaço</th>
					<th>Data</th>
					<th>Tipo</th>				
				</tr>
			</thead>
			<tbody>
				<c:set var="available" value="available"/>
				<c:forEach items="${cobertura}" var="m">
				<c:choose>
					<c:when test="${m.status == available}">
							<tr>
								<td>${m.id}   </td>
								<td>${m.mossa} </td>
								<td>${m.cachaco}</td>
								<td>${m.data_cobertura}</td>
								<td>${m.tipo}</td>
							</tr>
					</c:when>
				</c:choose>
				</c:forEach>
			</tbody>
		</table>		
	</div>
	
	<div id="s_show_CoberHist">
	
		<h5>Histórico de coberturas</h5>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Mossa</th>
					<th>Cachaço</th>
					<th>Data</th>
					<th>Tipo</th>				
				</tr>
			</thead>
			<tbody>
				<c:set var="available" value="available"/>
				<c:forEach items="${cobertura}" var="m">
				<c:choose>
					<c:when test="${m.status != available}">
							<tr>
								<td>${m.id}   </td>
								<td>${m.mossa} </td>
								<td>${m.cachaco}</td>
								<td>${m.data_cobertura}</td>
								<td>${m.tipo}</td>
							</tr>
					</c:when>
				</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</div>	
		</c:when></c:choose>	
</main>

<script>
2
</script>

<c:import url="/includes/footer.jsp"/>