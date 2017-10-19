<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class = "container">
<legend>Lista de Matrizes</legend>
	<c:choose><c:when test="${not empty matriz2}">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Mossa</th>
					<th>Vigilância</th>
					<th>Raça</th>
					<th>Cadastrador</th>
					<th>Informações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${matriz2}" var="m">
							<tr>
								<td>${m.mossa}   </td>
								<td>${m.vigilancia} </td>
								<td>${m.raca}</td>
								<td>${m.cadastrador}</td>
								<td><a class="verify" href="<c:url value="/MatrizEspecifico/${m.mossa}"/>" role="button" id="${m.mossa}">Verificar</a></td>
							</tr>
						</c:forEach>
			</tbody>
		</table>
	</c:when><c:otherwise>
	</c:otherwise></c:choose>
</main>

<script>
</script>

<c:import url="/includes/footer.jsp"/>