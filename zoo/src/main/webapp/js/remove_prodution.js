//Função especifica voltada para a exclusão de produção
function sendForm() {
	id = $("#id").val();
	$.ajax({
		method : "POST",
		url : "/zoo/disableProduction",
		data : {
			id2 : id
		},
		success : function(response) {
			if (response.cod == "404") {
				alert(response.message);
			} else {
				window.location.replace("/zoo/Racao"); //Redireciona para a pagina inicial
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}