<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/includes/header.jsp" />
<main class="container">

<form method="POST" action="<c:url value="/editTypeRation" />" id="changeInsumos">
	<div class="col-md-8 col-xs-10 col-md-offset-2 col-xs-offset-1"
		id="conteudo">
		<div id="caixa">

				<div id="nome" class="col-md-12">Editar receita</div>
				<div class="form-group col-md-12 col-xs-12">
					<label for="sel1">Selecione o tipo de ração:</label> <select
						class="form-control" id="animal_type_ration"
						name="animal_type_ration" onchange="getNameRations();" required>
						<option>Selecione o tipo de ração</option>
						<option>Bovina</option>
						<option>Ovina</option>
						<option>Suína</option>
					</select>
				</div>

				<div class="form-group col-md-12 col-xs-12">
					<label for="sel1">Nome da ração:</label> <select
						class="form-control" id="name_ration" name="name_ration"  onchange="putInsumosForEdition();" disable>
						<option>Selecione a ração</option>
					</select>
				</div>

				<br>
				<h5>
					<b>Insumos</b>
				</h5>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo1"> Insumo 1</label> <input
						type="text" class="form-control" id="insumo1" name="insumo1"
						required>
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo2"> Insumo 2</label> <input
						type="text" class="form-control" id="insumo2" name="insumo2"
						required>
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo3"> Insumo 3</label> <input
						type="text" class="form-control" id="insumo3" name="insumo3"
						required>
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo4"> Insumo 4</label> <input
						type="text" class="form-control" id="insumo4" name="insumo4"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo5"> Insumo 5</label> <input
						type="text" class="form-control" id="insumo5" name="insumo5"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo6"> Insumo 6</label> <input
						type="text" class="form-control" id="insumo6" name="insumo6"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo7"> Insumo 7</label> <input
						type="text" class="form-control" id="insumo7" name="insumo7"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo8"> Insumo 8</label> <input
						type="text" class="form-control" id="insumo8" name="insumo8"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo9"> Insumo 9</label> <input
						type="text" class="form-control" id="insumo9" name="insumo9"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo10"> Insumo 10</label> <input
						type="text" class="form-control" id="insumo10" name="insumo10"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo11"> Insumo 11</label> <input
						type="text" class="form-control" id="insumo11" name="insumo11"
						value="">
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="text" id="name_insumo12"> Insumo 12</label> <input
						type="text" class="form-control" id="insumo12" name="insumo12"
						value="">
				</div>

				<button type="button" onclick="noEmptyDataEditReceita();"
					class="btn salvar col-md-12 col-xs-12 col-md-offset-12">Editar Receita</button>
		</div>
	</div>
	<input type="text" id="name_user" name="name_user" novalidate>
</form>


<br>
</main>
<c:import url="/includes/footer.jsp" />

<script src="<c:url value="/js/edit_type_ration.js" />"></script>

<script>
	window.onload = function(e) {
		listInsumos();
	};
</script>