<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container"> 
			<div>
				<div id="caixa" class="col-xs-10 col-sm-10 col-md-4 col-md-offset-4 col-sm-offset-1 col-xs-offset-1">
				<p> ID: ${ultimo.id}</p>
				<p> Mossa: ${ultimo.mossa}</p>
				<p> Cachaço: ${ultimo.cachaco}</p>
				<p> Data de cobertura: ${ultimo.data_cobertura}</p>
<%-- 				<p> Previsão de nascimento: ${ultimo.data_previsao}</p> --%>
				<p> Tipo de cobertura: ${ultimo.tipo}</p>
				</div>
			</div>
</main>

<c:import url="/includes/footer.jsp"/>