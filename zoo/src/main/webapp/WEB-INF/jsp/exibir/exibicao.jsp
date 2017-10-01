<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container">
			<div class="row center">
				<div class="col-md-12">
					<h1>Nome do bovino</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<p>Categoria de Registro:</p>
					<p>Raça:</p>
					<p>Variedade:</p>
					<p>Nascimento:</p>
					<p>Sexo:</p>
					<p>Número do registro:</p>
					<p>Número do brinco:</p>
					<p>Número do brinco da CIDASC:</p>
					<p>Mãe:</p>
					<p>Número do registro da mãe:</p>
					<p>Pai:</p>
					<p>Número do registro do pai:</p>
					<p>Status:</p>
					<p>Servidor que efetuou o cadastro:</p>
				</div>
				<div class="col-md-6">
					<img src="" alt="Imagem não disponível" class="img-rounded" id ="img" align="right">
				</div>
			</div>

			<div class="row center" id="rowbtn">
				<div class="col-md-12">
					<button class="btn btn-default" type="button" id="ver" data-toggle="modal" data-target="#modaldescende">Ver Descendência</button>
				</div>
			</div>
</main>		
<div class="modal fade" id="modaldescende" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog" role="document">
	    <div class="modal-content">
		    <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Nome do Bovino</h4>
		    </div>
		    <div class="modal-body center">
				<div class="btn-group-vertical" role="group" id="btngroup"> 	
					<div class="row">
						<div class="col-md-12">
							<h3>Avós Maternos</h3>
						</div>
					</div>								
					<div class="row">
						<div class="col-md-12">
							<p>Avô:</p>
					
							<p>Avó:</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h3>Avós Paternos</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p>Avô:</p>
							<p>Avó:</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h3>Pais</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p>Pai:</p>
							<p>Mãe:</p>							
						</div>
						
					</div>
				</div>
		    </div>
	      
	    </div>
	</div>
</div>					




<c:import url="/includes/footer.jsp"/>
