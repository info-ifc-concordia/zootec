<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<main class="container">
			<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger" role="alert">${errorMsg}</div>
	</c:if>
			<div class="row">
				<div class="col-xs-12 col-md-12" id="rowform">
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/bovinos/cadastrar"/>">
					<fieldset>
					
						<legend>Cadastro de Bovino</legend>
					
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios"> Raça </label>
						  <div class="col-md-4">
								
								    <label class="radio-inline" for="radios-0">
								    	<input type="radio" name="raca" id="radios-0" value="Holandes" checked="checked"> Holandês
								    </label>
								
								
								    <label class="radio-inline" for="radios-1">
								    	<input type="radio" name="raca" id="radios-1" value="Jersey"> Jersey
								    </label>
								    
								    <label class="radio-inline" for="radios-2">
								    	<input type="radio" name= "raca" id="radios-2" value="Mestico"> Mestiço
								    </label>
								    
								    <input class="form-control input-md" disabled  id = "Rinput" type="text" name="rCustom"  placeholder = "Digite aqui a raça caso for mestiço"> 
								    
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios"> Sexo </label>
						  <div class="col-md-4">
								
								    <label class="radio-inline" for="radios-3">
								    	<input type="radio" name="sexo" id="radios-4" value="Macho" checked> Macho
								    </label>
								
								
								    <label class="radio-inline" for="radios-5">
								    	<input type="radio" name="sexo" id="radios-5" value="Femea"> Fêmea
								    </label>
							</div>
						</div>
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Categoria de Registro</label>
						  <div class="col-md-4">
								
								    <label class="radio-inline" for="radios-6">
								    	<input type="radio" name="cr" id="radios-6" value="Puro de Origem" checked>Puro de Origem
								    </label>
								
								
								    <label class="radio-inline" for="radios-7">
								    	<input type="radio" name="cr" id="radios-7" value="Puro de Cruzamento">Puro de Cruzamento
								    </label>
								
						  </div>
						</div>
						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">Variedade</label>
						  <div class="col-md-3">
						    <select id="selectbasic" name="variety" class="form-control" required>
							    <option value="" selected> Selecionar </option>
							    <option value="Preto e Branco">Preto e Branco</option>
							    <option value="Vermelho e Branco">Vermelho e Branco</option>
						    </select>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome do Bovino</label>  
						  <div class="col-md-4">
						  	<input  name="name" type="text" placeholder="Ex: Joaquina 18987" class="form-control input-md" required>
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Brinco Interno</label>  
						  <div class="col-md-4">
						  	<input name="nb" type="text" placeholder="Ex: 123" class="form-control input-md" required>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Brinco CIDASC</label>  
						  <div class="col-md-4">
						  	<input name="nc" type="text" placeholder="Ex: 123" class="form-control input-md" required>
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Data de Nascimento</label>  
						  <div class="col-md-4">
						  	<input  required name="dateOfBirth" type="date" class="form-control input-md">
						  </div>
						  
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome da Mãe</label>  
						  <div class="col-md-4">
						  	<input  required name="mom" type="text" placeholder="Ex: Estrela 8329" class="form-control input-md" required>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro da Mãe</label>  
						  <div class="col-md-4">
						  	<input  name="nrm" type="text" placeholder="Ex: 18987-433" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="dad" type="text" placeholder="Ex: Freddy 4938" class="form-control input-md" required>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="nrp" type="text" placeholder="Ex: 18987-433" class="form-control input-md" >
						  </div>
						</div>
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Status</label>
						  <div class="col-md-4"> 
							    <label class="radio-inline" for="radios-8"><input type="radio" name="status" id="radios-8" value="Vivo" checked>Vivo</label> 

							    <label class="radio-inline" for="radios-9"><input type="radio" name="status" id="radios-9" value="Morto">Morto</label> 
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