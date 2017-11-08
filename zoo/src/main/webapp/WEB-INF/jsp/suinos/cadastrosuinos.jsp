<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:import url="/includes/header.jsp"/>

<main class="container">

			<div class="row">
				<div class="col-xs-12 col-md-12" id="rowform">
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/CadastrarSuino"/>">
					<fieldset>

						<legend>Cadastro de Matrizes</legend>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Mossa</label>  
						  <div class="col-md-4">
						  	<input  name="Mossa" type="text" placeholder="Mossa" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Raça</label>  
						  <div class="col-md-4">
						  	<input  name="Raca" type="text" placeholder="Raça" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Tipo</label>  
						  <div class="col-md-4">
						  	<input  name="Tipo" type="text" placeholder="Tipo" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Registro Vigilância</label>  
						  <div class="col-md-4">
						  	<input name="Vigilancia" type="text" placeholder="Vigilância" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Origem</label>  
						  <div class="col-md-4">
						  	<input name="Origem" type="text" class="form-control input-md" placeholder="Origem">
						  </div>
						  
						</div>

						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="submit" class="btn btn-primary"  id="cadastrar">Cadastrar</button>

						  </div>
						</div>

					</fieldset>
					</form>
				</div>
			</div>
	</main>

<c:import url="/includes/footer.jsp"/>