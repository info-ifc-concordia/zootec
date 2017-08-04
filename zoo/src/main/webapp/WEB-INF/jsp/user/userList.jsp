<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
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
								<td>
								<a href = "<c:url value="${user.id}/edit"/>">
									${user.nome} </a>
								</td>
								<td>${user.email}</td>
							</tr>
						</c:forEach>
			</tbody>
		</table>
	</c:when><c:otherwise>
	</c:otherwise></c:choose>
<c:import url="/includes/footer.jsp"/>