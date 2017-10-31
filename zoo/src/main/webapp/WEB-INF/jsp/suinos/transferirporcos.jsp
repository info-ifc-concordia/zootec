<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container">

<div class="conteiner">
				<div class="col-xs-12 col-md-12" id="rowform">					
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/MatrizEspecificoBusca"/>">
					<fieldset>

						<legend>Tranferir porco</legend>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">De: </label>
						  <div class="col-md-3">
						    <select id="selectbasic" name="Mossa_1" class="form-control">						    
						    <c:forEach items="${matriz2}" var="m">
								<option>${m.mossa}</option>
							</c:forEach>
						    </select>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">Para: </label>
						  <div class="col-md-3">
						    <select id="selectbasic" name="Mossa_2" class="form-control">						    
						    <c:forEach items="${matriz2}" var="m">
								<option>${m.mossa}</option>
							</c:forEach>
						    </select>
						  </div>
						</div>	
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Quantidade</label>  
						  <div class="col-md-4">
						  	<input  name="Quantidade" type="number" placeholder="Quantidade de porcos deseja enviar" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="submit" class="btn btn-primary" id="cadastrar" >Transferir</button>
						  </div>
						</div>
						
					</fieldset>
				</form>
				</div>
			</div>

</main>

<c:import url="/includes/footer.jsp"/>