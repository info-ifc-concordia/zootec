<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/includes/header.jsp" />
<main class="container">
<div>
	<div class="col-md-4 col-xs-4" id="menuRations"></div>
	<div id="caix" class="col-md-8 col-xs-8"></div>
</div>
</main>
<script>
	window.onload = function(e) {
		getProdutions("normal", true);
	};
</script>
<c:import url="/includes/footer.jsp" />

