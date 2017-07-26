<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<div class="row" id="conteudo">
	<div class="col-xs-12 col-md-4 col-md-offset-4" id="jumb">
		<div class="panel panel-default">
			<div class="panel-heading" id="wel">
				<h3 class="panel-title">Login</h3>
			</div>
			<div class="panel-body">
				<form method="POST" role="form" action="<c:url value="/login" />" >
					<fieldset>
				    	<div class="form-group">
				        	<input class="form-control" placeholder="Username" required = "" name="username" type="text" autofocus>
				        </div>
				      	<div class="form-group">
				        	<input class="form-control" placeholder="Password" required = "" name="password" type="password" value="">
				        </div>
				        <button type="submit" class="btn btn-success btn-block">Entrar</button>
					</fieldset>
				</form>
			</div>
		</div>
</div>
</div>
<c:import url="/includes/footer.jsp"/>