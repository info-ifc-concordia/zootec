<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>


<div class="container-fluid">

			<div class="col-md-8 col-xs-10 col-md-offset-2 col-xs-offset-1" id="conteudo">
				<div id="caixa">
					<div id="nome" class="col-md-12">Adicionar produção</div>

						<div class="form-group col-md-6 col-xs-12">
	     					<label for="sel1">Selecione o tipo de ração:</label>
	      					<select class="form-control" id="sel1">
		        				<option>Bovina</option>
		        				<option>Ovina</option>
		        				<option>Suína</option>
		      				</select>
						</div>



						<div class="form-group col-md-6 col-xs-12">
						    <label for="date">Data da produção:</label>
						    <input type="date" class="form-control" id="data">
						</div>
						
						<form  id="typeRation">
						<div class="form-group col-md-12 col-xs-12">
	     					<label for="sel1">Nome da ração:</label>
	      					<select class="form-control" id="typeD" name="typeD" onchange="goToJsForSubmit()">
	      					<c:forEach items="${rations}" var="type">
	      						<option> ${type.name} </option>
	      					</c:forEach>
		      				</select>
						</div>
						</form>
						
						
						<h5><b>Quantidade de:</b></h5>
						<br>
						
						<div id= "insumosDefined">						
							COCOOCOO
						</div>
						
						<div>
						    <label for="number">Quantidade total produzida:</label>
						    <input type="number" class="form-control" id="total">
						</div>

						<button type="button" class="btn salvar col-md-4 col-xs-12 col-md-offset-4">Adicionar produção</button>
				</div>
			</div>

<c:import url="/includes/footer.jsp"/>

