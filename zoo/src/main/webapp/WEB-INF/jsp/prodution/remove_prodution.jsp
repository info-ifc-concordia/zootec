<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<div>
				<div id="menu" class="col-md-4 col-xs-4">
					<div class="alert alert-success" role="alert">RAÇÕES BOVINAS</div>
					<div class="list-group" id="list_bovino">
					  	<button type="button" class="list-group-item">Bezerras casinhas</button>
					  	<button type="button" class="list-group-item">Bezerras cangas</button>
					  	<button type="button" class="list-group-item">Novilhas pequenas</button>
					</div>
					<div class="alert alert-success" role="alert">RAÇÕES OVINAS</div>
					<div class="list-group" id="list_ovino">
					  	<button type="button" class="list-group-item">Flushing</button>
					  	<button type="button" class="list-group-item">Fêmeas - lactação</button>
					  	<button type="button" class="list-group-item">Crescimento</button>
					</div>
					<div class="alert alert-success" role="alert">RAÇÕES SUÍNAS</div>
					<div class="list-group" id="list_suino">
					  	<button type="button" class="list-group-item">Cachaços</button>
					  	<button type="button" class="list-group-item">Confinamento</button>
					  	<button type="button" class="list-group-item">Crescimento (30 a 50 kg)</button>
					</div>
				</div>
				<div id="caixa" class="col-md-8 col-xs-8">
					<div class="panel panel-danger">
						<div class="panel-heading">REMOVER PRODUÇÃO</div>
						<div class="panel-body">
							<table class="table table-hover">
							    <thead>
							    	<tr>	
							    		<th>Informações sobre a ração</th>
							    		<th></th>
							    	</tr>
							    </thead>
							    <tbody>
							      	<tr>
							        	<td><b>Tipo de ração</b></td>
							        	<td>Ração bovina</td>
							      	</tr>
							      	<tr>
							        	<td><b>Nome da produção</b></td>
							        	<td>Bezerras cangas</td>
							        </tr>
							      	<tr>
							        	<td><b>Data da produção</b></td>
							        	<td>15/05/2015</td>
							      	</tr>
							      	<tr>
							        	<td><b>Quantidade produzida</b></td>
							        	<td>100.00 kg</td>
							      	</tr>
							    </tbody>
							  </table>
							  <button type="button" class="btn btn-danger col-md-8 col-xs-12 col-md-offset-2">Remover produção</button>
						</div>

					</div>
				</div>
			</div>
			
<c:import url="/includes/footer.jsp"/>