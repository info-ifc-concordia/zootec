<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<main class="container vcenter">
	<table class="table table-striped">
			<thead>
				<tr>
					<th>Nome</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Lista}" var="VACA">
							<tr>
								<td></td>
							</tr>
						</c:forEach>
			</tbody>
		</table>
</main>
<c:import url="/includes/footer.jsp"/>