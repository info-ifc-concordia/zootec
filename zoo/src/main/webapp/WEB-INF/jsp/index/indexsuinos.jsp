<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<div class="row">
	<div class="conteiner">
				<div class="col-xs-12 col-md-12" id="rowform">					
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/MatrizEspecificoBusca"/>">
					<fieldset>

						<legend>Buscar mossa</legend>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Mossa</label>  
						  <div class="col-md-4">
						  	<input  name="Mossa" type="text" placeholder="Digite a mossa que desejas pesquisar" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="submit" class="btn btn-primary" id="cadastrar" >Buscar</button>
						  </div>
						</div>
						
					</fieldset>
				</form>
				</div>
			</div>
		</div>
<c:import url="/includes/footer.jsp"/>

