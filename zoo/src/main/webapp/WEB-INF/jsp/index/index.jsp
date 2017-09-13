<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp"/>
<main class="container">
  <h2>Selecione o serviço que deseja utilizar</h2>
  <div class="btn-group-vertical">
    <a href= "<c:url value = "/Vaquinhas"/>"><button type="button" class="btn btn-primary">Bovinos</button></a>
    <a href= "<c:url value = "/Racao"/>"> <button type="button" class="btn btn-primary">Ração</button> </a>
  </div>
</main>
<c:import url="/includes/footer.jsp"/>