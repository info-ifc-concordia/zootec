<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<main class="container vcenter">
	<c:choose>
		<c:when test = "${size == 1}">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Nome</th>
					<th> Registro Interno </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${lista}" var="vaca">
							<tr>
								<td><a href= "<c:url value ='/bovinos/show/${vaca.id}'/>"> ${vaca.name}</a></td>
								<td> ${vaca.nb} </td>
								<c:choose>
									<c:when test ="${userSession.getUser().getAcesso() >= 4 }">
									<td><a href= "<c:url value = '/bovinos/edit/${vaca.id}'/>"> <span class="glyphicon glyphicon-pencil"> </span></a></td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
			</tbody>
		</table>
		</c:when>
		<c:otherwise>			
		</c:otherwise>
	</c:choose>
	
	<c:choose>    
		<c:when test = "${size == 0}">
		<div class="alert alert-danger" role="alert"> Não existem cadastros</div>
		</c:when>
		<c:otherwise>	
		</c:otherwise>
	</c:choose>
	
</main>

<c:import url="/includes/footer.jsp"/>