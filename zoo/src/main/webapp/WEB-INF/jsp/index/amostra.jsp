<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<main class="container vcenter">
	<table class="table table-hover">
			<thead>
				<tr>
					<th>Nome</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Lista}" var="VACA">
							<tr>
								<td><a href= "<c:url value ="/show/${VACA.id}"/>"> ${VACA.name}</a></td>
								<c:choose>
									<c:when test ="${userSession.getUser().getAcesso() >= 4 }">
									<td><a href= "<c:url value ="/edit/${VACA.id}"/>"> <span class="glyphicon glyphicon-pencil"> </span></a></td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
			</tbody>
		</table>
</main>
<c:import url="/includes/footer.jsp"/>