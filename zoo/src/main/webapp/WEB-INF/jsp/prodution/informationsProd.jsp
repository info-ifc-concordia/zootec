<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/includes/header.jsp" />
<main class="container">

<div class="form-group col-md-4 col-xs-4">
<div class="alert alert-success" role="alert">FILTROS PARA CONSULTA</div>
	<label for="sel1">Selecione o tipo de ração:</label> 
	<select
		class="form-control" id="animal_type_ration" name="animal_type_ration">
		<option>Selecione o tipo de ração</option>
		<option>Bovina</option>
		<option>Ovina</option>
		<option>Suína</option>
	</select>
	
	<label for="sel1">Nome da ração:</label> 
	<select class="form-control"
		id="name_ration" name="name_ration" disable>
		<option>Selecione a ração</option>
	</select> 
	
	<label for="sel1">Insumo:</label> 
	<input type="text" class="form-control"
		id="insumo" name="insumo" style="text-transform:uppercase">
	
	<label for="sel1">Data Início:</label> 
	<input type="date"
		id="dataInicio" class="form-control" > 
		
	<label for="sel1">Data fim:</label> 
	<input type="date"
		id="dataFim" class="form-control"> 
	
	
	<label for="sel1">Quantidade final minima da produção:</label> 
	<input type="number" class="form-control" id="qtd_final_min" name="qtd_final_min" min=0
		value=0> 
		
	<label for="sel1">Quantidade final maxima produção:</label> 
	<input type="number" class="form-control" id="qtd_final_max"
		name="qtd_final_max" min=0 value=0> 
	<br>
	<button id="bt_get_inform"
		class="btn btn-success col-md-12 col-xs-12"
		onclick="informations();">Pesquisar</button>

	 
	
		
</div>
<div id="caix" class="col-md-8 col-xs-8"></div>
<div id="infoInsumos"class="col-md-8 col-xs-8"></div>
<input type="text" id="name_user" name="name_user" novalidate> </main>


<c:import url="/includes/footer.jsp" />
<script>
	window.onload = function(e) {
		getProdutions("normal", false);
		listInsumos();
	};
</script>