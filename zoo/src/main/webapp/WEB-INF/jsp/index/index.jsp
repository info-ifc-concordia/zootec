<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
	<h1>Olá ${userSession.user.nome}</h1>
	<main class="container vcenter">
			<div class="row">
				<div class="col-xs-12 col-md-6 col-md-offset-3" id="row1">
					<h4>Digite na barra de pesquisa abaixo o nome ou o número do brinco do animal que deseja saber informações.</h4>
				</div>
			</div>

			<div class="row">

				<div class="col-xs-12 col-md-6 col-md-offset-3" id="row2">
				  	<div class="jumbotron jumbotron-fluid">

						<div class="input-group">
						      <input type="text" id="txtBusca" class="form-control" placeholder="Buscar..."/>
						      <span class="input-group-btn">
						        <a href="exibir.html" id="btnBusca" class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>

						      </span>
						</div><!-- /input-group -->
				  		
				  	</div>
							
			  	</div>

			</div>
	</main>
<c:import url="/includes/footer.jsp"/>