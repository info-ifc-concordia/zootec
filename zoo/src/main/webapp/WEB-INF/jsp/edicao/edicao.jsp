<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<main class="container">	
			<div class="row">
				<div class="col-xs-12 col-md-12" id="rowform">
					<form class="form-horizontal" role="form" method="POST" action ="<c:url value = "/bovinos/editar"/>">
					<fieldset>
						<legend>Edição de Informações de Bovino</legend>
						
						<div class="form-group">
						  <div class="col-md-4">
						  	<input  type = "hidden" name="id" value = "${bovino.id}" type="number" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						<label class="col-md-4 control-label" for="radios">Raça</label>
						<div class="col-md-4">
						<c:choose>
							<c:when test ="${bovino.raca == 'Holandes'}">
								    <label class="radio-inline" for="radios-0">
								    	<input type="radio" name="raca" id="radios-0" value="Holandes" checked="checked"> Holandês
								    </label>
								
								
								    <label class="radio-inline" for="radios-1">
								    	<input type="radio" name="raca" id="radios-1" value="Jersey"> Jersey
								    </label>
								    
								     <label class="radio-inline" for="radios-2">
								    	<input type="radio" name= "raca" id="radios-2" value="Mestico"> Mestiço
								    </label>
								    
								    <input class="form-control input-md" disabled  id = "Rinput" type="text" name="rCustom"  placeholder = "Digite aqui a raça"> 
								    
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
							
						<c:choose>
								<c:when test ="${bovino.raca == 'Jersey'}">
								
								    <label class="radio-inline" for="radios-0">
								    	<input type="radio" name="raca" id="radios-0" value="Holandes" > Holandês								   
								    	</label>
								
								
								    <label class="radio-inline" for="radios-1">
								    	<input type="radio" name="raca" id="radios-1" value="Jersey" checked="checked"> Jersey
								    </label>
								    
								     <label class="radio-inline" for="radios-2">
								    	<input type="radio" name= "raca" id="radios-2" value="Mestico"> Mestiço
								    </label>
								    
								    <input class="form-control input-md" disabled  id = "Rinput" type="text" name="rCustom"  placeholder = "Digite aqui a raça"> 
								    
								</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						
							<c:choose>
								<c:when test ="${bovino.raca != 'Jersey' and bovino.raca != 'Holandes'}">
								
								    <label class="radio-inline" for="radios-0">
								    	<input type="radio" name="raca" id="radios-0" value="Holandes" > Holandês								   
								    	</label>
								
								
								    <label class="radio-inline" for="radios-1">
								    	<input type="radio" name="raca" id="radios-1" value="Jersey" > Jersey
								    </label>
								    
								     <label class="radio-inline" for="radios-2">
								    	<input type="radio" name= "raca" id="radios-2" value="Mestico" checked> Mestiço
								    </label>
								    
								    <input class="form-control input-md" value = "${bovino.raca}" id = "Rinput" type="text" name="rCustom"  placeholder = "Digite aqui a raça"> 
								    
								</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						
						</div>
					</div>
					
					
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios"> Sexo </label>
						  <div class="col-md-4">
								
								    <label class="radio-inline" for="radios-7">
								    	<input type="radio" name="sexo" id="radios-7" value="Macho" checked="checked"> Macho
								    </label>
								
								
								    <label class="radio-inline" for="radios-8">
								    	<input type="radio" name="sexo" id="radios-8" value="Femea"> Fêmea
								    </label>
							</div>
						</div>
						
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Categoria de Registro</label>
						  <div class="col-md-4">
								<c:choose> 
									<c:when test = "${bovino.cr == 'Puro de Origem' }">
								
								    <label class="radio-inline" for="radios-3"><input type="radio" name="registro" id="radios-3" value="Puro de Origem" checked >Puro de Origem</label>
								    
									 <label class="radio-inline" for="radios-4"><input type="radio" name="registro" id="radios-4" value="Puro de Cruzamento">Puro de Cruzamento</label>
								    </c:when>
								    
								    <c:otherwise>
								    </c:otherwise>
								    </c:choose>
								    <c:choose>
								    
								    <c:when test = "${bovino.cr == 'Puro de Cruzamento'}">
								    
								      <label class="radio-inline" for="radios-3"><input type="radio" name="registro" id="radios-3" value="Puro de Origem" >Puro de Origem</label>
								    
									 <label class="radio-inline" for="radios-4"><input type="radio" name="registro" id="radios-4" value="Puro de Cruzamento" checked>Puro de Cruzamento</label>
						
								    </c:when>
								    
								    <c:otherwise>
								    </c:otherwise>
								</c:choose>
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="selectbasic">Variedade</label>
						  <div class="col-md-3">
						    <select id="selectbasic" name="variety" class="form-control">
							    <option value="" selected> Selecionar </option>
							    <option value="Preto e Branco">Preto e Branco</option>
							    <option value="Vermelho e Branco">Vermelho e Branco</option>
						    </select>
						  </div>
						</div>
						

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome do Bovino</label>  
						  <div class="col-md-4">
						  	<input  name="name" value = " ${bovino.name}" type="text" class="form-control input-md">
						  </div>
						</div>

						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Brinco</label>  
						  <div class="col-md-4">
						  	<input name="nb" type="text" value = "${bovino.nb}"  class="form-control input-md"> 
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Brinco CIDASC</label>  
						  <div class="col-md-4">
						  	<input name="nc" type="text" value = "${bovino.nc}" class="form-control input-md">
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Data de Nascimento</label>  
						  <div class="col-md-4">
						  	<input name="dateOfBirth" type="date" class="form-control input-md" required>
						  </div>
						  
						</div>

						<c:choose>
								<c:when test ="${mamae == null}">
								
								
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome da Mãe</label>  
						  <div class="col-md-4">
						  	<input  name="mom" type="text" placeholder = "Mãe do Bovino não cadastrada" value = "" class="form-control input-md"> 
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro da Mãe</label>  
						  <div class="col-md-4">
						  	<input  name="nrm" type="text" placeholder = "Mãe do Bovino não cadastrada" value = "" class="form-control input-md">
						  </div>
						</div>
						
								</c:when>
						</c:choose>
						
						<c:choose>
								<c:when test ="${mamae != null}">
								
								<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome da Mãe</label>  
						  <div class="col-md-4">
						  	<input  name="mom" type="text" value = "${mamae.name}" class="form-control input-md"> 
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro da Mãe</label>  
						  <div class="col-md-4">
						  	<input  name="nrm" type="text" value = " ${mamae.nb}" class="form-control input-md">
						  </div>
						</div>
								</c:when>
						</c:choose>
						
						<c:choose>
								<c:when test ="${dad == null}">
								
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="dad" type="text" placeholder = "Pai do Bovino não cadastrado" value = "" class="form-control input-md"> 						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="nrp" type="text" placeholder = "Mãe do Bovino não cadastrada" value = "" class="form-control input-md"> 
						  </div>
						</div>
								</c:when>
						</c:choose>
						
					<c:choose>
								<c:when test ="${dad != null}">
				
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Nome do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="dad" type="text" value = "${dad.name}" class="form-control input-md"> 						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="textinput">Número do Registro do Pai</label>  
						  <div class="col-md-4">
						  	<input  name="nrp" type="text" value = "${dad.nrp}" class="form-control input-md"> 
						  </div>
						</div>
						
								</c:when>
					</c:choose>


						<c:choose>
							<c:when test ="${bovino.status == 'Morto'}">
							
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Status</label>
						 <div class="col-md-4"> 
						  
							    <label class="radio-inline" for="radios-5"><input type="radio" name="status" id="radios-5" value="Vivo" >Vivo</label> 

							    <label class="radio-inline" for="radios-6"><input type="radio" name="status" id="radios-6" value="Morto" checked >Morto</label>
						</div>
					</div>
					
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
						
						<c:choose>
							<c:when test ="${bovino.status == 'Vivo'}">
							
						<div class="form-group">
						  <label class="col-md-4 control-label" for="radios">Status</label>
						 <div class="col-md-4"> 
						  
							    <label class="radio-inline" for="radios-5"><input type="radio" name="status" id="radios-5" value="Vivo" checked >Vivo</label> 

							    <label class="radio-inline" for="radios-6"><input type="radio" name="status" id="radios-6" value="Morto">Morto</label>
						</div>
					</div>
								    
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>

						<div class="form-group">
						  <div class="col-md-offset-4 col-md-4">
						    <button type="submit"  class="btn btn-primary" id="editar">Editar</button>
						  </div>
						</div>
					</fieldset>
					</form>
	</main>
<c:import url="/includes/footer.jsp"/>