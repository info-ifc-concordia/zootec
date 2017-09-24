<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<main class="container">

			<div class="row">
				<div class="col-xs-12 col-md-12" id="rowform">
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/Cadastrar"/>">
					<fieldset>

						<legend>Cadastro de Bovino</legend>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios"> Raça </label>
						  <div class="col-md-4">
								
								    <label class="radio-inline" for="radios-0">
								    	<input type="radio" name="Raca" id="radios-0" value="1" checked="checked"> Holandês
								    </label>
								
								
								    <label class="radio-inline" for="radios-1">
								    	<input type="radio" name="Raca" id="radios-1" value="2"> Jersey
								    </label>
								    
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Categoria de Registro</label>
						  <div class="col-md-4">
								
								    <label class="radio-inline" for="radios-0">
								    	<input type="radio" name="CR" id="radios-0" value="1" checked="checked">Puro de Origem
								    </label>
								
								
								    <label class="radio-inline" for="radios-1">
								    	<input type="radio" name="CR" id="radios-1" value="2">Puro de Cruzamento
								    </label>
								
						  </div>
						</div>
						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">Variedade</label>
						  <div class="col-md-3">
						    <select id="selectbasic" name="Variety" class="form-control">
							    <option value=""> Selecionar </option>
							    <option value="1">Preto e Branco</option>
							    <option value="2">Vermelho e Branco</option>
						    </select>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome do Bovino</label>  
						  <div class="col-md-4">
						  	<input  name="Name" type="text" placeholder="Ex: Joaquina 18987" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro</label>  
						  <div class="col-md-4">
						  	<input  name="NR" type="number" placeholder="Ex: 18987-433" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Brinco Interno</label>  
						  <div class="col-md-4">
						  	<input name="NB" type="number" placeholder="Ex: 123" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Brinco CIDASC</label>  
						  <div class="col-md-4">
						  	<input name="NC" type="number" placeholder="Ex: 123" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Data de Nascimento</label>  
						  <div class="col-md-4">
						  	<input name="DateofBirth" type="date" class="form-control input-md">
						  </div>
						  
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome da Mãe</label>  
						  <div class="col-md-4">
						  	<input  name="Mom" type="text" placeholder="Ex: Estrela 8329" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro da Mãe</label>  
						  <div class="col-md-4">
						  	<input  name="NRM" type="number" placeholder="Ex: 18987-433" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="Dad" type="text" placeholder="Ex: Freddy 4938" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="NRP" type="number" placeholder="Ex: 18987-433" class="form-control input-md">
						  </div>
						</div>
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Status</label>
						  <div class="col-md-4"> 
							    <label class="radio-inline" for="radios-3"><input type="radio" name="status" id="radios-3" value="3" checked="checked">Vivo</label> 

							    <label class="radio-inline" for="radios-4"><input type="radio" name="status" id="radios-4" value="4">Morto</label> 
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