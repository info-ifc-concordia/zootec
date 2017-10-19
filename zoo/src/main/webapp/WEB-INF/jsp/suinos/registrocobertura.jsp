<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<main class="container">
<c:choose><c:when test="${not empty matriz2}">
<div class="row">
				<div class="col-xs-12 col-md-12" id="rowform">					
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/RegistrarCobertura"/>">
					<fieldset>

						<legend>Registro de cobertura</legend>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">Mossa</label>
						  <div class="col-md-3">
						    <select id="selectbasic" name="Mossa" class="form-control">
						    
						    <c:forEach items="${matriz2}" var="m">
								<option>${m.mossa}</option>
							</c:forEach>
						    </select>
						  </div>
						</div>				
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Tipo de Cruza</label>
						  <div class="col-md-4">								
								    <label class="radio-inline" for="radios-0"><input type="radio" name="Tipo" id="radios-0" value="1" checked="checked">Cachaço</label>							
								    <label class="radio-inline" for="radios-1"><input type="radio" name="Tipo" id="radios-1" value="2">Inseminação</label>								
						  </div>
						</div>		
												
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Cachaço</label>  
						  <div class="col-md-4">
						  	<input  name="Cachaco" type="text" placeholder="..." class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Data de cobertura</label>  
						  <div class="col-md-4">
						  	<input  name="Data" type="date" placeholder="..." class="form-control input-md">
						  </div>
						</div>
												
						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="submit" class="btn btn-primary"  id="cadastrar">Registrar</button>

						  </div>
						</div>						

					</fieldset>
					</form>
				</div>
			</div>
			</c:when><c:otherwise>
	</c:otherwise></c:choose>

</main>

<c:import url="/includes/footer.jsp"/>