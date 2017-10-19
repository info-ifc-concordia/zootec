<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container"> 
			<div>
				<div id="caixa" class="col-xs-10 col-sm-10 col-md-4 col-md-offset-4 col-sm-offset-1 col-xs-offset-1">
					<div id="nome" class="col-md-12 col-xs-12">Página de Controle</div>
					<a type="button" class="btn btn4 col-md-12 col-xs-12" href="<c:url value="/cadastro"/>">Cadastrar novo usuário no sistema</a>
				</div>
			</div>
</main>

<c:import url="/includes/footer.jsp"/>