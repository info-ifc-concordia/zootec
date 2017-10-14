<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/includes/header.jsp" />
<main class="container">

<div class="container-fluid">

	<div class="col-md-8 col-xs-10 col-md-offset-2 col-xs-offset-1"
		id="conteudo">
		<div id="caixa">
			<form method="POST" action="<c:url value="/registerNewProdution" />">
				<div id="nome" class="col-md-12">Adicionar produção</div>
				<div class="form-group col-md-6 col-xs-12">
					<label for="sel1">Selecione o tipo de ração:</label> <select
						class="form-control" id="animal_type_ration"
						name="animal_type_ration">
						<option>Selecione o tipo de ração</option>
						<option>Bovina</option>
						<option>Ovina</option>
						<option>Suína</option>
					</select>
				</div>

				<div class="form-group col-md-6 col-xs-12">
					<label for="date">Data da produção:</label> <input type="date"
						class="form-control" id="dat" name="dat" required>
				</div>

				<div class="form-group col-md-12 col-xs-12">
					<label for="sel1">Nome da ração:</label> <select
						class="form-control" id="name_ration" name="name_ration" disable>
						<option>Selecione a ração</option>
					</select>
				</div>

				<div id="Insumosinformations">
					<h5>
						<b>Insumos</b>
					</h5>
					<br>

					<div id="insumosDefined">

						<div class="form-group col-md-6 col-xs-12">

							<label for="text" id="insumo1type"> Insumo 1</label> <input
								type="number" step="0.01" class="form-control" id="insumo1"
								name="insumo1" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo2type"> Insumo 2</label> <input
								type="number" step="0.01" class="form-control" id="insumo2"
								name="insumo2" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo3type"> Insumo 3</label> <input
								type="number" step="0.01" class="form-control" id="insumo3"
								name="insumo3" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo4type"> Insumo 4</label> <input
								type="number" step="0.01" class="form-control" id="insumo4"
								name="insumo4" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo5type"> Insumo 5</label> <input
								type="number" step="0.01" class="form-control" id="insumo5"
								name="insumo5" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo6type"> Insumo 6</label> <input
								type="number" step="0.01" class="form-control" id="insumo6"
								name="insumo6" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo7type"> Insumo 7</label> <input
								type="number" step="0.01" class="form-control" id="insumo7"
								name="insumo7" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo8type"> Insumo 8</label> <input
								type="number" step="0.01" class="form-control" id="insumo8"
								name="insumo8" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo9type"> Insumo 9</label> <input
								type="number" step="0.01" class="form-control" id="insumo9"
								name="insumo9" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo10type"> Insumo 10</label> <input
								type="number" step="0.01" class="form-control" id="insumo10"
								name="insumo10" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo11type"> Insumo 11</label> <input
								type="number" step="0.01" class="form-control" id="insumo11"
								name="insumo11" required>
						</div>

						<div class="form-group col-md-6 col-xs-12">
							<label for="text" id="insumo12type"> Insumo 12</label> <input
								type="number" step="0.01" class="form-control" id="insumo12"
								name="insumo12" required>
						</div>

					</div>

					<div>
						<label for="number">Quantidade total produzida:</label> <input
							type="number" class="form-control" id="qtd_final"
							name="qtd_final" required>
					</div>
					<input type="text" id="name_user" name="name_user" novalidate>
					<input type="submit" value="Adicionar produção"
						class="btn salvar col-md-12 col-xs-12 col-md-offset-12">
				</div>
			</form>
		</div>
	</div>
</div>

</main>
<c:import url="/includes/footer.jsp" />

