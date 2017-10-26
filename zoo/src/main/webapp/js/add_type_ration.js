function verifyRegisterNewRation()
{
	var nome = $("#def_name_ration").val();
	var forAnimal = $("#for_animal").val();
	var i1 = $("#insumo1").val();
	var i2 = $("#insumo2").val();
	var i3 = $("#insumo3").val();
	
	
	if (i1.length < 2 || i2.length < 2 || i3.length < 2)
		{
			$("#errorOfRegister").html('<center><h4 style="color:red">Os insumos não foram inseridos!<h4><center>');
			$(".alert").alert();
			return;
		}
	if(nome.length < 2)
		{
		$("#errorOfRegister").html('<center><h4 style="color:red">Nome da receita não preenchido!<h4><center>');
		$(".alert").alert();
			
			return;
		}
	
	for (i in insumos)
		{
			if (insumos[i]["name"] == nome && insumos[i]["type_animal"] == forAnimal)
				{
				$("#errorOfRegister").html('<center><h4 style="color:red"> Essa receita já foi cadastrada!<h4><center>');
				$(".alert").alert();
					return;
				}
		}
	$("#registerNewType").submit();
}

var insumos = []; //Variavel global usada para guardar as receitas!
function listInsumos()
{//Através de uma requisição AJAX, essa função irá buscar no banco TODOS os dados da tabela receita;
	$.ajax({
		method : "GET",
		url : "/zoo/getAllInsumos",
		success : function(response) {
			console.log(response);
			if (response.cod == "404") {
				alert(response.message);
			} else {
				insumos = response.data; //Adicionamos o valor de retorno a variavel global insumo;
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}

