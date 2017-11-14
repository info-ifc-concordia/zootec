<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container">

<div class="conteiner">

				<div id="alertas"></div>
				
				<div class="col-xs-12 col-md-12" id="rowform">					
					<form id="transferir_form" class="form-horizontal" role="form" method="POST" action ="<c:url value = "/TransferirPorcos"/>">
					<fieldset>

						<legend>Tranferir porco</legend>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">De: </label>
						  <div class="col-md-3">
						    <select name="Remetente" class="form-control" id="remetente">						    
						    <c:forEach items="${matriz2}" var="m">
								<option value="${m.mossa}">${m.mossa}</option>
							</c:forEach>
						    </select>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">Para: </label>
						  <div class="col-md-3">
						    <select name="Destinatario" class="form-control" id="destinatario">						    
						    <c:forEach items="${matriz2}" var="m">
								<option value="${m.mossa}">${m.mossa}</option>
							</c:forEach>
						    </select>
						  </div>
						</div>	
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Quantidade</label>  
						  <div class="col-md-4">
						  	<input id="quantidade" name="Quantidade" type="number" placeholder="Quantidade de porcos deseja enviar" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="button" class="btn btn-primary" id="btn_transferir">Transferir</button>
						  </div>
						</div>
						
					</fieldset>
				</form>
				</div>
			</div>
</main>

<script>
window.onload = function(e) {
	getMatrizes();
};
</script>

<c:import url="/includes/footer.jsp"/>