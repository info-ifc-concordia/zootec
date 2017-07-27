<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
	<h1>Olá ${userSession.user.nome}</h1>
	<c:choose><c:when test="${not empty users}">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>Login</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.id}</td>
						<td>${user.nome}</td>
						<td>${user.login}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when><c:otherwise>
	
	</c:otherwise></c:choose>
<c:import url="/includes/footer.jsp"/>