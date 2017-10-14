<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/includes/header.jsp" />
<main class="container"> 

<form method="POST" action="<c:url value="/registerNewTypeRation" />">
	<div class="col-md-8 col-xs-10 col-md-offset-2 col-xs-offset-1"
		id="conteudo">
		<div id="caixa">
			<div id="nome" class="col-md-12">Adicionar tipo de ração</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="sel1">Destinado:</label> <select class="form-control"
					id="for_animal" name="for_animal" required>
					<option>Bovina</option>
					<option>Ovina</option>
					<option>Suína</option>
				</select>
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text">Nome da ração:</label> <input type="text"
					class="form-control" name="def_name_ration" id="def_name_ration" required>
			</div>

			<!-- POR PADRÃO, INCIALMENTE DEFINIREMOS COMO POSSÍVEL ADICIONAR 11 TIPOS DE INSUMOS DIFERENTES -->
			<br>
			<h5>
				<b>Insumos</b>
			</h5>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 1</label> <input type="text"
					class="form-control" id="insumo1" name="insumo1" required>
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 2</label> <input type="text"
					class="form-control" id="insumo2" name="insumo2" required>
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 3</label> <input type="text"
					class="form-control" id="insumo3" name="insumo3" required>
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 4</label> <input type="text"
					class="form-control" id="insumo4" name="insumo4" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 5</label> <input type="text"
					class="form-control" id="insumo5" name="insumo5" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 6</label> <input type="text"
					class="form-control" id="insumo6" name="insumo6" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 7</label> <input type="text"
					class="form-control" id="insumo7" name="insumo7" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 8</label> <input type="text"
					class="form-control" id="insumo8" name="insumo8" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 9</label> <input type="text"
					class="form-control" id="insumo9" name="insumo9" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 10</label> <input type="text"
					class="form-control" id="insumo10" name="insumo10" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 11</label> <input type="text"
					class="form-control" id="insumo11" name="insumo11" value=" ">
			</div>

			<div class="form-group col-md-6 col-xs-12">
				<label for="text"> Insumo 12</label> <input type="text"
					class="form-control" id="insumo12" name="insumo12" value=" ">
			</div>



			<button type="submit"
				class="btn salvar col-md-12 col-xs-12 col-md-offset-12">Adicionar
				novo tipo</button>
		</div>
	</div>
</form>
<br>
</main>
<c:import url="/includes/footer.jsp" />