var rationCurrent = "";
$("#animal_type_ration").change(
		function() {
			var user = document.getElementById("userLogged").innerHTML;
			document.getElementById("name_user").value = user;
			animal1 = $("#animal_type_ration").val();
			$.ajax({
				method : "GET",
				url : "/zoo/getNameRations",
				data : {
					animal : animal1
				},
				success : function(response) {
					console.log(response);
					if (response.cod == "404") {
						alert(response.message);
					} else {
						rationCurrent = response.data;
						var options = "<option>Selecione a ração</option>";
						for (i in rationCurrent) {
							options += "<option>" + rationCurrent[i].name
									+ "</option>";
						}
						$("#name_ration").html(options);
						hideAll();
					}
				},
				failure : function(response) {
					atualy = false;
					error();
					console.error(response);
				}
			});
		});

$("#name_ration").change(function() {
	$("#Insumosinformations").css({
		"display" : "inline"
	});
	name1 = $("#name_ration").val();
	animal1 = $("#animal_type_ration").val();
	if (name1 == "Selecione a ração") {
		hideAll();
	}
	for (i in rationCurrent) {
		if (rationCurrent[i].name == name1) {
			var cont = 1;
			while (cont < 13) {
				var txt = "insumo" + cont;
				var name = "#" + txt + "type";
				if (rationCurrent[i][txt] != "None") {
					$(name).html(rationCurrent[i][txt]);
					$(name).css({
						"display" : "inline"
					});
					$("#" + txt).css({
						"display" : "inline"
					});
					document.getElementById(txt).value = "";
				} else {
					$(name).css({
						"display" : "none"
					});
					$("#" + txt).css({
						"display" : "none"
					});
					$("#" + txt).prop('novalidate', true);
					$("#" + txt).prop('required', false);
					document.getElementById(txt).value = "0";
				}
				cont += 1;
			}
		}
	}
});

var productions = "";
function getProdutions(type) {
	$.ajax({
		method : "GET",
		url : "/zoo/getProdutions",
		success : function(response) {
			console.log(response);
			if (response.cod == "404") {
				alert(response.message);
			} else {
				productions = response.data;
				console.log(productions);
				buildMenuLeftProdutions(type)
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}

function buildMenuLeftProdutions(type) {
	var suinos = [];
	var bovinos = [];
	var ovinos = [];

	for (i in productions) {
		switch (productions[i].type_animal) {
		case "Suína":
			if (suinos.indexOf(productions[i].name_ration) == -1) {
				suinos.push(productions[i].name_ration);
			}
			break;

		case "Ovina":
			if (ovinos.indexOf(productions[i].name_ration) == -1) {
				ovinos.push(productions[i].name_ration);
			}
			break;

		case "Bovina":
			if (bovinos.indexOf(productions[i].name_ration) == -1) {
				bovinos.push(productions[i].name_ration);
			}
			break;
		}
	}
	var colocarDentro = '<div class="alert alert-success" role="alert">RAÇÕES BOVINAS</div><div class="list-group" id="list_bovino">';

	for (i in suinos) {
		colocarDentro += '<button class="list-group-item" onclick="typeProductionSelected('
				+ "'"
				+ suinos[i]
				+ "',"
				+ "'"
				+ type
				+ "'"
				+ ' )">'
				+ suinos[i] + '</button>';

	}
	colocarDentro += '</div> <div class="alert alert-success" role="alert">RAÇÕES OVINAS</div> <div class="list-group" id="list_ovino">';
	for (i in ovinos) {
		colocarDentro += '<button class="list-group-item" onclick="typeProductionSelected('
				+ "'"
				+ ovinos[i]
				+ "', "
				+ "'"
				+ type
				+ "'"
				+ ' )">'
				+ ovinos[i] + '</button>';
	}
	colocarDentro += '</div><div class="alert alert-success" role="alert">RAÇÕES SUÍNAS</div><div class="list-group" id="list_suino">';
	for (i in bovinos) {
		colocarDentro += '<button class="list-group-item" onclick="typeProductionSelected('
				+ "'"
				+ bovinos[i]
				+ "', "
				+ "'"
				+ type
				+ "'"
				+ ' )">'
				+ bovinos[i] + '</button>';
	}
	colocarDentro += "</div>";
	$("#menuRations").html(colocarDentro);
}

function hideAll() {
	$("#Insumosinformations").css({
		"display" : "none"
	});
}

function typeProductionSelected(nameRation, type) {
	var colocarDentro = '<div class="panel panel-success"><div class="panel-heading">Produções Encontradas - ' + nameRation +'</div><div class="panel-body"><table class="table table-hover"><thead><tr><th><b>Nome da Produção</b></th><th><b>Quantidade Produzida</b></th><th><b>Data do Cadastro</b></th><th><b>Responsável</b></th></tr></thead><tbody>';
	
	for (i in productions) {
		if (productions[i].name_ration == nameRation) {
			colocarDentro += '<tr onclick="productionSpecific('
					+ productions[i].id + ',' + "'" + type + "'" + ');">'
					+ "<td>" + productions[i].name_ration + "</td>"
					+ "<td>" + productions[i].qtd_final + "</td>"
					+ "<td>" + productions[i].date + "</td>"
					+ "<td>" + productions[i].user + "</td></tr>";
		}
		
		
	}
	colocarDentro += "</tbody></table></div></div>";
	$("#caix").html(colocarDentro);
	console.log(nameRation);
}

function productionSpecific(id, type) {
	var cert;
	var colocarDentro;
	for (i in productions) {
		if (productions[i].id == id) {
			cert = productions[i];
		}
	}

	colocarDentro = '<div class="panel panel-success"><div class="panel-heading">';
	colocarDentro += cert.name_ration;
	colocarDentro += '</div><div class="panel-body"><table class="table table-hover"><thead><tr><th>Insumos</th><th>Quantidade</th></tr></thead><tbody><tr>';
	var insumos;
	animal1 = $("#animal_type_ration").val();
	$.ajax({
				method : "GET",
				url : "/zoo/getInsumos",
				data : {
					name : cert.name_ration,
					animal : cert.type_animal
				},
				success : function(response) {
					console.log(response);
					if (response.cod == "404") {
						alert(response.message);
					} else {
						insumos = response.data;
						var cont = 1;
						var aux;
						while (cont < 13) {
							aux = "insumo" + cont;
							if (cert[aux] > 0) {
								colocarDentro += "<tr><td>" + insumos[aux]
										+ "</td>";
								
								if (type == "normal") {
									colocarDentro += "<td>" + cert[aux]
											+ "kg</td></tr>";
								} else {
									colocarDentro += "<td><input type='number' id='"
											+ aux
											+ "' value="
											+ cert[aux]
											+ " name='"
											+ aux
											+ "' required></td></tr>";
								}

							}
							else
							{
							colocarDentro += '<input type="number" min=0 class="form-control oculto" id="' + aux + '" name="' + aux +'"  value=0 required novalidate>';
							}
							cont += 1;
						}
						colocarDentro += '<input type="number" class="oculto" id="id" name="id" value=' + cert.id + " novalidate>"; 
						colocarDentro += "<tr><td>TOTAL</td>";

						if (type == "normal") {
							colocarDentro += "<td>" + cert.qtd_final
									+ "kg</td></tr>";
						} else {
							colocarDentro += "<td> <input type='text' id='qtd_final'  name='qtd_final' value=" + cert.qtd_final
									+ "></td></tr>";
							colocarDentro += '</form> </tbody></table>';
							
							colocarDentro += '<input type="submit" class="btn btn-success col-md-12 col-xs-12 col-md-offset-2" id="buttonForm1" value="Editar produção">';
						
							
							colocarDentro += '<input type="button" onclick="sendForm();" class="btn btn-danger col-md-12 col-xs-12 col-md-offset-2" id="buttonForm2"  value="Remover produção">';
							
						}
						colocarDentro += "</div></div>";
						$("#caix").html(colocarDentro);
						
						
					}
				},
				failure : function(response) {
					atualy = false;
					error();
					console.error(response);
				}
			});
}

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
			} 
			else{
				window.location.replace("/zoo");
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}


$('document').ready(function() {
	$('#btnlogin').click(function() {
		$('#modallogin').modal();
	});

});

$('document').ready(function() {
	$('#entrar').on('click', function(e) {

		$('#modalchoices').modal();
	});
});

$('document').ready(function() {
	$('#btneditar, #editar').on('click', function(e) {

		$('#modaleditar').modal();
	});
});

//SUÍNOS COMEÇA AQUI

//função que pega a lista de matrizes cadastrada no banco
var matrizes;
function getMatrizes(){
	$.ajax({
		method : "GET",
		url : "/zoo/RequestMatrizes",
		success : function(response) {
			if (response.cod == "404") {
				alert(response.message);
			} else {
				matrizes = response.data;
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}

var coberturas;
function getCoberturas(){
	$.ajax({
		method : "GET",
		url : "/zoo/RequestCoberturas",
		success : function(response) {
			if (response.cod == "404") {
				alert(response.message);
			} else {
				coberturas = response.data;
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}

function matrizEspecifico(){
	$("#s_divHist, #s_divCober").hide();	
}

function listarCoberturas(){
	$("#s_show_CoberHist").hide();
}

function zerarEdicao(){
	$("#esconder_hihi").hide();
}

//CLIQUES REFERENTES ÀS PÁGINAS DOS SUÍNOS

/*conferir qual radiobutton está ativado no cadastro de coberturas 
e fazer as devidas alterações no formulário*/
$("#cobertura_radios1, #cobertura_radios2").click(function(){
	if(($("#cobertura_radios2").is(":checked"))){
		$("#form_cober_cachaco").val("Inseminação");
		$("#div_registro_cachaco").hide();		
		
	}
	else{
		$("#div_registro_cachaco").show();
		$("#form_cober_cachaco").val("");
	}
});

$("#btn_registrar_cober").click(function(){
	var mossa = $("#select_mossa_cober").val();

	var tem = false
	if (coberturas.length != 0) {
		for (i in coberturas) {
			if (coberturas[i].mossa == mossa && coberturas[i].status == "available") {
				tem = true;
				break;
			} 
		}
	}
	else{
		$("#form_cobertura").submit();
	}
	
	if (tem){
		$("#alerts").empty();
		$("#alerts").append('<p style="color:red"> Existe uma cobertura ativa nessa mossa! Desabilite-a para poder registrar uma nova. </p>')
	}
	else{
		$("#form_cobertura").submit();
	}
});

$("#s_btn_editar").click(function(){
	var mossa = $("#s_editar_mossa").val();
	var vigilancia = $("#s_editar_vigilancia").val();
	
	var cert;
	var tem = false;
	for (i in matrizes) {
		if (matrizes[i].Mossa == mossa) {
			cert = matrizes[i];
		}		
		if (matrizes[i].Vigilancia == vigilancia && cert.Vigilancia != vigilancia){
			tem = true;
		}
	}
	
	if (tem){
		$("#alerts").append('<p style="color:red"> Vigilância já cadastrada no sistema! </p>')
	}
	else{
		$("#s_form_editar").submit();
	}
});

$("#btn_transferir").click(function(){
	var remet = $("#remetente").val();
	var dest = $("#destinatario").val();
	var qtd = $("#quantidade").val();
	
	if (remet != dest){
		for (i in matrizes) {
			if (matrizes[i].Mossa == remet) {
				remet = matrizes[i];
			}		
			if (matrizes[i].Mossa == dest){
				dest = matrizes[i];
			}
		}
		
		if (qtd > remet.Porcos){
			$("#alertas").empty();
			$("#alertas").append('<p style="color:red"> Essa matriz não possui porcos para transferir! </p>')
		}
		else{
			alert("deu certo");
		}
		
	}
	else{
		$("#alertas").empty();
		$("#alertas").append('<p style="color:red"> As matrizes estão iguais! </p>')
	}
});

$("#s_info").click(function(){
	$("#s_divHist, #s_divCober, #s_divInfo").hide();
	$("#s_divInfo").show();
});
$("#s_hist").click(function(){
	$("#s_divInfo, #s_divCober, #s_divHist").hide();
	$("#s_divHist").show();
});
$("#s_cober").click(function(){
	$("#s_divHist, #s_divInfo, #s_divCober").hide();
	$("#s_divCober").show();
});

$("#s_CoberCober").click(function(){
	$("#s_show_CoberCober, #s_show_CoberHist").hide();
	$("#s_show_CoberCober").show();
});
$("#s_CoberHist").click(function(){
	$("#s_show_CoberCober, #s_show_CoberHist").hide();
	$("#s_show_CoberHist").show();
});

//SUÍNOS ACABA AQUI


hideAll();
