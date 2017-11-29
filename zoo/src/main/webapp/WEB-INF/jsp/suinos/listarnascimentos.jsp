<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:import url="/includes/header.jsp"/>

<main class="container">
	
	<div id="s_show_CoberCober">
	
	<h5>Histórico de nascimentos</h5>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Data</th>
					<th>Mossa</th>
					<th>Cachaço</th>
					<th>Vivos</th>
					<th>Mumificados</th>	
					<th>Natimortos</th>
					<th>Total</th>		
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${nascimentos}" var="m">
							<tr>
								<td>${m.id}   </td>
								<td>${m.data}</td>
								<td>${m.mossa} </td>
								<td>${m.cachaco}</td>
								<td>${m.vivos}</td>
								<td>${m.mumificados}</td>
								<td>${m.natimortos}</td>
								<td>${m.total}</td>
							</tr>
				</c:forEach>
			</tbody>
		</table>		
	</div>

</main>

<c:import url="/includes/footer.jsp"/>