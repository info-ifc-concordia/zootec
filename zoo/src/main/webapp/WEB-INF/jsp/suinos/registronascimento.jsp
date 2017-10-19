<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container">
<div class="row">
				<div class="col-xs-12 col-md-12" id="rowform">					
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/RegistrarNascimento/${mossa}"/>">
					<fieldset>

						<legend>Registro de nascimento</legend>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Data parto</label>  
						  <div class="col-md-4">
						  	<input  name="Data" type="date" placeholder="..." class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Vivos</label>  
						  <div class="col-md-4">
						  	<input  name="Vivos" type="number" placeholder="..." class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Natimortos</label>  
						  <div class="col-md-4">
						  	<input  name="Nati" type="number" placeholder="..." class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Mumificados</label>  
						  <div class="col-md-4">
						  	<input  name="Mumi" type="number" placeholder="..." class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="submit" class="btn btn-primary" id="cadastrar" >Registrar</button>

						  </div>
						</div>
					</fieldset>
					</form>
				</div>
			</div>

</main>

<c:import url="/includes/footer.jsp"/>