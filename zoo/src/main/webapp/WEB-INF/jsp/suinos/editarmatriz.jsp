<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class = "container">
<legend>Editar Matriz</legend>	

	<div>
		<div class="row">
				<div class="col-xs-12 col-md-12" id="rowform">
					<form id="s_form_editar" class="form-horizontal" role="form" method="POST" action ="<c:url value = "/EditarMatriz"/>">
					<fieldset>
				
						<div class="form-group" id="esconder_hihi">
						  <label class="col-md-4 control-label" for="textinput">Mossa</label>  
						  <div class="col-md-4">
						  	<input id="s_editar_mossa" value="${matrizEditar.mossa}" name="Mossa" type="text" placeholder="Mossa" class="form-control input-md" required>
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Tipo</label>  
						  <div class="col-md-4">
						  	<input id="s_editar_tipo" value="${matrizEditar.tipo}" name="Tipo" type="text" placeholder="Tipo" class="form-control input-md" required>
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Vigilância</label>  
						  <div class="col-md-4">
						  	<input id="s_editar_vigilancia" value="${matrizEditar.vigilancia}" name="Vigilancia" type="text" placeholder="Vigilância" class="form-control input-md" required>
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Raça</label>  
						  <div class="col-md-4">
						  	<input id="s_editar_raca" value="${matrizEditar.raca}" name="Raca" type="text" placeholder="Raça" class="form-control input-md" required>
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Origem</label>  
						  <div class="col-md-4">
						  	<input id="s_editar_origem" value="${matrizEditar.origem}" name="Origem" type="text" class="form-control input-md" required>
						  </div>						  
						</div>

						<!-- Button -->
						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="button" name="singlebutton" class="btn btn-primary" id="s_btn_editar">Editar</button>
						  </div>
						</div>

					</fieldset>
					</form>
				</div>
			</div>
	</div>
	
	<div id="s_editar_avisos">
		
	</div>

</main>

<c:import url="/includes/footer.jsp"/>

<script>
window.onload = function(e) {
	zerarEdicao();
	getMatrizes();
};
</script>