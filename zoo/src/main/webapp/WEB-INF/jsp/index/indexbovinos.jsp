<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container vcenter">

	<c:if test="${not empty msg}">
			<div class="alert alert-success" role="alert">${msg}</div>
	</c:if>
	
	<c:if test="${not empty msg2}">
			<div class="alert alert-success" role="alert">${msg2}</div>
	</c:if>
	
			<div class="row">
				<div class="col-xs-12 col-md-6 col-md-offset-3" id="row1">
					<h4>Digite na barra de pesquisa abaixo o nome ou o número do brinco do animal que deseja saber informações.</h4>
				</div>
			</div>

			<div class="row">

				<div class="col-xs-12 col-md-6 col-md-offset-3" id="row2">
				  	<div class="jumbotron jumbotron-fluid">
				  	<form method = "GET" action = "<c:url value = "/bovinos/exibir"/>">
						<div class="input-group">
						      <input  name="filter" type="search" id="txtBusca" class="form-control" placeholder="Buscar..."/>
						      <span class="input-group-btn">
						        <button id="btnBusca" class="btn btn-default" type = "Submit">
						        	<span class="glyphicon glyphicon-search" aria-hidden="true">
						        	</span>
						        </button>					  
						      </span>
				  		</div>
				  	</form>
			  	</div>
			  </div>
		</div>
</main>
<c:import url="/includes/footer.jsp"/>