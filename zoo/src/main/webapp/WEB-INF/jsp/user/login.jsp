<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<div class="row">
	<div class="col-xs-12 col-md-4 col-md-offset-4">
		<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger" role="alert">${errorMsg}</div>
		</c:if>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">Login</h2>
			</div>
			<div class="panel-body">
				<form method="POST" role="form" action="<c:url value="/login" />" >
					<fieldset>
				    	<div class="form-group">
				        	<input class="form-control" placeholder="Nome de usuário" name="username" type="text" autofocus required />
				        </div>
				      	<div class="form-group">
				        	<input class="form-control" placeholder="Senha" name="password" type="password" required />
				        </div>
				        <button type="submit" class="btn btn-success btn-block">Entrar</button>
					</fieldset>
				</form>
			</div>
		</div>
</div>
</div>
<c:import url="/includes/footer.jsp"/>