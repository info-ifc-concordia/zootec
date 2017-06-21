<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>

<form method="POST" action="<c:url value="/login" />" >
<c:if test="${not empty errorMsg}">

	<div>
		Ta errado!
	</div>
</c:if>

	<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Login</span>
  <input type="text" class="form-control" id="login" name="login" placeholder="Username" aria-describedby="basic-addon1">
</div>

<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Senha</span>
  <input type="password" class="form-control" id="password" name="password" placeholder="Senha" aria-describedby="basic-addon1">
</div>

 <input type="submit" value="Entrar">
</form>
<c:import url="/includes/footer.jsp"/>