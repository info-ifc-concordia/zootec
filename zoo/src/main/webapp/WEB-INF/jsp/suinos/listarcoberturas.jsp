<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class = "container">
<legend>Lista de Coberturas</legend>
	<c:choose><c:when test="${not empty cobertura}">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Mossa</th>
					<th>Cachaço</th>
					<th>Data</th>
					<th>Tipo</th>
					<th>Teste</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cobertura}" var="m">
							<tr>
								<td>${m.id}   </td>
								<td>${m.mossa} </td>
								<td>${m.cachaco}</td>
								<td>${m.data_cobertura}</td>
								<td>${m.tipo}</td>
								<td><button id="${m.id}">Verificar</button></td>
							</tr>
						</c:forEach>
			</tbody>
		</table>
	</c:when><c:otherwise>
	</c:otherwise></c:choose>
</main>

<c:import url="/includes/footer.jsp"/>