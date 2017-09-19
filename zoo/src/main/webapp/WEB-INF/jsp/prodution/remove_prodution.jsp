<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/includes/header.jsp" />
<div>

	<div class="col-md-4 col-xs-4" id="menuRations"></div>
	<form method="POST" id="form1" name="form1" action="<c:url value="/editProduction" />">
		<div id="caix" class="col-md-8 col-xs-8"></div>
	</form>
</div>

<script>
	window.onload = function(e) {
		getProdutions("edit");
	};
</script>

<c:import url="/includes/footer.jsp" />