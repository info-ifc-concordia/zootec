/*
 Requisição Ajax usada na JSP 'add_prodution'
 Essa requisição busca os tipos de ração disponiveis no banco de determinada tipo de animal
 */
var rationCurrent = "";
		function getNameRations() {
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
						//Adiciona-se o objeto encontrado a variavel global 'rationCurrent',
						// para ser utilizada posterioremente, aproveitando a requisição e evitando outra
						var options = "<option>Selecione a ração</option>";
						for (i in rationCurrent) {
							/*
							 Após a busca retornar um objeto com todos os tipos de ração e seus respectivos insumos, 
							 adiciona-se ao 'select' os options com os nomes das rações encontradas! 
							 */
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
		}


/*
 * Função usada para encontrar e colocar os insumos de determinada ração especifica
 * em seus devidos lugares;
 * A variavel global 'rationCurrent' foi definida com o objeto das receitas (tudo o que está na tabela "Receitas"
 * e que apresenta o tipo do animal solicitado) 
 */
function putInsumosForRation() {

	name1 = $("#name_ration").val();
	animal1 = $("#animal_type_ration").val();
	if (name1 == "Selecione a ração") {
		console.log("ESSA PORRA DEU BUG APAGOU!");
		hideAll();
	}
	for (i in rationCurrent) {
		if (rationCurrent[i].name == name1) {
			var cont = 1;
			/*
			 * Como os 13 espaços disponiveis já estão pré-definidos, basta ocultarmos eles quando não são usados
			 * e mostra-los quando necessário, além de colocar o nome de cada insumo
			 */
			
			while (cont < 13) {
				var txt = "insumo" + cont;
				var name = "#" + txt + "type";
				if (rationCurrent[i][txt] != "None")
					//Se o insumo existir, no caso, não ser nulo, iremos colocar o nome e mostrar na dela ("desocultar")
				{
					$(name).html(rationCurrent[i][txt]);//Colocamos o nome do insumo
					$(name).css({
						"display" : "inline"
							//Definimos que o nome dele irá aparecer
					});
					$("#" + txt).css({
						"display" : "inline"
							//Definimos que o 'input' para a entrada do dados irá aparecer
					});
					document.getElementById(txt).value = " ";
				} else {
					//Já se o insumo for vazio, no caso "None", apenas será ocultado o nome, o 'input' do insumo
					$(name).css({
						"display" : "none"
					});
					$("#" + txt).css({
						"display" : "none"
					});
					$("#" + txt).prop('novalidate', true);//Necessário para o form aceitar tratar um 'input' com display none
					$("#" + txt).prop('required', false);//O 'input' como não iá aparecer, não pode exigir algum valor do usuário
					document.getElementById(txt).value = "0";
				}
				cont += 1;
			}
		}
	}
	$("#Insumosinformations").css({
		"display" : "inline"
	});
}

//Essa requisição AJAX é utilizada para buscar TODAS as produções cadastradas no banco
var productions = "";
function getProdutions(type, doMenu) {
	$.ajax({
		method : "GET",
		url : "/zoo/getProdutions",
		success : function(response) {
			console.log(response);
			if (response.cod == "404") {
				alert(response.message);
			} else {
				productions = response.data;
				//Definimos na variavel global 'productions' o objeto retornado do banco 
				//com o objetivo de usa-la depois, evitando fazer inumeras requisiçoes a cada vez que o usuario desejar
				//visualizar algum tipo de ração!
				if (doMenu == true)
					{
						buildMenuLeftProdutions(type)//Função que irá gerar o menu lateral!
					}
					}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}



//Função usada para contruir o menu lateral nas JSP's 'add_prodution' e 'remove_prodution'
function buildMenuLeftProdutions(type) {
	var suinos = [];
	var bovinos = [];
	var ovinos = [];
	
	//O primeiro passo é separar cada produção de acordo com seu respectivo tipo de animal;
	//Para isso, usamos 3 listas distintas 'suinos', 'bovinos', 'ovinos'
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
	
	
    // O segundo passo é apenas contruir o HTML de acordo com as produções
	//Para isso, usamos uma variavel local que irá conter o HTML em forma de string
	var colocarDentro = '<div class="alert alert-success" role="alert">RAÇÕES SUÍNAS</div><div class="list-group" id="list_suino">';
	
	//A cada tipo de produção que apresentar pelo menos uma produção cadastrada, cria-se um botão com o nome da ração
	//Quando esse botão for clicado, será chamada a função 'typeProductionSelected', passando como parametros
	//O nome da ração, e a definição do que será feito, se está no módulo de visualização ou de exclusão
	
	//O processo será repetido para os 3 tipos de animais
	for (i in suinos) {
		colocarDentro += '<button class="list-group-item" onclick="typeProductionSelected('
				+ "'"
				+ suinos[i] 
				+ "',"
				+ "'"
				+ type //Processo necessário para as variveis serem passadas como strings, e não haver conflito na estrutura do HTML
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
	colocarDentro += '</div><div class="alert alert-success" role="alert">RAÇÕES BOVINAS</div><div class="list-group" id="list_bovino">';
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
	$("#menuRations").html(colocarDentro);//Após isso, irá aparecer o menu lateral das produções de ração 
}

//Função especifica para apenas oculpar o #Insumosinformations
function hideAll() {
	$("#Insumosinformations").css({
		"display" : "none"
	});
}

//Função Intermediaria, que é chamada após o usuario clicar em algum botão do menu lateral
//A função irá listar todos as produções encontradas com aquele nome
function typeProductionSelected(nameRation, type) {
	var colocarDentro = '<div class="panel panel-success"><div class="panel-heading">Produções Encontradas - '
			+ nameRation
			+ '</div><div class="panel-body"><table class="table table-hover"><thead><tr><th><b>Nome da Produção</b></th><th><b>Quantidade Produzida</b></th><th><b>Data da Produção</b></th><th><b>Responsável</b></th></tr></thead><tbody>';
//Ele percorre a variavel global 'productions', e quando encontrar alguma produção com aquele nome, ele adicina uma linha na tabela
	for (i in productions) {
		if (productions[i].name_ration == nameRation) {
			colocarDentro += '<tr onclick="productionSpecific('
					+ productions[i].id + ',' + "'" + type + "'" + ');">' //Informa o tipo do animal
					+ "<td>" + productions[i].name_ration + "</td>" + "<td>" //O nome da ração
					+ productions[i].qtd_final + "</td>" + "<td>" // A quantidade final produzida
					+ productions[i].date + "</td>" + "<td>" // A data em que foi produzida
					+ productions[i].user + "</td></tr>"; // E quam foi o usuário a cadastrar aquela produção
		}
	}
	colocarDentro += "</tbody></table></div></div>";
	$("#caix").html(colocarDentro);
}

// Função voltada para encontrar os insumos de uma produção, e inserir os dados dentro do HTML
// Id é o Id da produção e type representa o que será feito(se é apenas visualização ou edição/remoção)
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
								// As produções são mostradas nas JSPs Index e na de Remove;
								// Os dados apresentados nelas são os mesmos, a diferença é a forma como serão apresentas
								// Na index, os dados são apenas colocar em uma tabela
								// Já na edit/remove, os dados são colocados dentro de um input, possibilitando a edição do usuário
								// Além disso, nessa JSP será disponibilizado 2 botões (editar e remover) 
								if (type == "normal") 
								// Type = Normal: Significa que o usuário está no modulo de visualização 
									{
									colocarDentro += "<td>" + cert[aux]
											+ "kg</td></tr>";
								} else 
								// Type = Qualquer outra coisa: Significa que o usuário está na parte de edição ou exclusão de produção 
								{
									colocarDentro += "<td><input type='number' id='"
											+ aux
											+ "' value="
											+ cert[aux]
											+ " name='"
											+ aux
											+ "' required></td></tr>";
								}
							} else {
								colocarDentro += '<input type="number" min=0 class="form-control oculto" id="'
										+ aux
										+ '" name="'
										+ aux
										+ '"  value=0 required novalidate>';
							}
							cont += 1;
						}
						colocarDentro += '<input type="number" class="oculto" id="id" name="id" value='
								+ cert.id + " novalidate>";
						//Definimos um input com o Id da produção e o 'escondemos' dentro do HTML para buscarmos essa informação depois
						
						colocarDentro += "<tr><td>TOTAL</td>";

						if (type == "normal") {
							colocarDentro += "<td>" + cert.qtd_final
									+ "kg</td></tr>";
						} else {
							colocarDentro += "<td> <input type='text' id='qtd_final'  name='qtd_final' value="
									+ cert.qtd_final + "></td></tr>";
							colocarDentro += '</form> </tbody></table>';

							colocarDentro += '<input type="submit" class="btn btn-success col-md-12 col-xs-12 col-md-offset-2" id="buttonForm1" value="Editar produção">';
							// O botão de editar é um submit, que enviara os dados dos inputs (com os dados) 
							colocarDentro += '<input type="button" onclick="sendForm();" class="btn btn-danger col-md-12 col-xs-12 col-md-offset-2" id="buttonForm2"  value="Remover produção">';
							// Já esse botão chama um função JavaScript, que atráves de uma requisão AJAX, irá excluir a produção do banco
							// O Id utilizado está implicito no HTML. Quando a função é chamada, ela busca o ID dentro do HTML
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
				window.location.replace("/zoo"); //Redireciona para a pagina inicial
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}

function informations()
{
	var nameRation = $("#name_ration").val();
	var typeAnimal = $("#animal_type_ration").val();
	var qtd_max = $("#qtd_final_max").val();
	var qtd_min = $("#qtd_final_min").val();
	var insumo = $("#insumo").val();
	var dataInicio = $("#dataInicio").val().toString();
	var dataFim = $("#dataFim").val().toString(); 
	
	if (dataInicio.length < 1)
		{
		dataInicio = "None";
		}
	if (dataFim.length < 1)
	{
	dataFim = "None";
	}
	
	if (nameRation == "Selecione a ração")
		{
			nameRation = "None";
		}
	
	if (typeAnimal == "Selecione o tipo de ração")
		{
			typeAnimal = "None";
		}

	var infos = ["data", nameRation, typeAnimal, "qtd_max", "qtd_min"];
	var acessBanco = ["date", "name_ration", "type_animal", "qtd_final", "qtd_final"];
	prodFind = [];
	for (i in productions)
		{
			var tf = true;
			for (t in infos)
				{
					var r = acessBanco[t];	
					console.log(productions[i][r]);
					if(r == "qtd_final")
						{
							if (qtd_max == 0)
								{
									qtd_max = 10000000000;
								}
							if(productions[i][r] > qtd_min && productions[i][r] < qtd_max )
								{
									r = r;
								}
							else
							{
								tf = false;
							}
						}
					else if(r == "date")
						{
						
						//	var d = productions[i][r];
							//var ano = d.substring(0, 4);
							//var mes = d.substring(5, 7);
							//if (ano != anoDat && anoDat != "None"){tf = false;}
							//if(mes != mesDat && mesDat != "None"){tf = false;}
							
							var anoI = dataInicio.split("-");
							var anoF = dataFim.split("-");
							var anoProd = productions[i][r].split("-");
							
		/*					for (key in anoProd)
								{
									if (anoI.length == 3)
										{
											if (anoI[key][0] == "0")
												{
													anoI[key][0] = anoI[key][0].substring(1,2);
												}
											anoI[key][0] = parseInt(anoI[key][0]);
										}
									
									if (anoF.length == 3)
									{
										if (anoF[key][0] == "0")
											{
												anoF[key][0] = anoF[key][0].substring(1,2);
											}
										anoF[key][0] = parseInt(anoF[key][0]);
									}
									
									if (anoProd[key][0] == "0")
									{
										anoProd[key][0] = anoProd[key][0].substring(1,2);
									}
									
									anoProd[key][0] = parseInt(anoProd[key][0]);
								}
							*/
									if (anoI.length == 3)
										{
											if (anoProd[0] < anoI[0])
												{tf = false;}
											else if(anoProd[0] == anoI[0] && anoProd[1] < anoI[1])
												{tf = false;}
											else if(anoProd[0] == anoI[0] && anoProd[1] == anoI[1] && anoProd[2] < anoI[2])
												{tf=false;} 
										}
									if (anoF.length == 3)
										{
											if (anoProd[0] > anoF[0])
												{tf = false;}
											else if(anoProd[0] == anoF[0] && anoProd[1] > anoF[1])
												{tf = false;}
											else if(anoProd[0] == anoF[0] && anoProd[1] == anoF[1] && anoProd[2] > anoF[2])
												{tf=false;}
										}
						}	
					else{
					if(productions[i][r] == infos[t])
						{
							r = r;
						}
					else
					{
						if(infos[t] != "None")
							{
							console.log("Eliminado aqui:");
							console.log(productions[i][r]);
							console.log("Meu val:");
							console.log(infos[t]);
							tf = false;
							}
					}
						}	
				}
			if (tf == true)
				{
					prodFind.push(productions[i]);
				}
		}
	
	console.log(prodFind);
	console.log(insumo);
		if (insumo.length > 1)
			{

			var calcs = getProdutionForInsumos(prodFind, insumo);
			var somaTotal = calcs[0];
			prodFind = calcs[1]; 
			}
		
		var colocarDentro = '<div class="panel panel-success"><div class="panel-heading">Produções Encontradas'
				+ '</div><div class="panel-body"><table class="table table-hover"><thead><tr><th><b>Nome da Produção</b></th><th><b>Quantidade Produzida</b></th><th><b>Data do Cadastro</b></th><th><b>Responsável</b></th></tr></thead><tbody>';
		for (i in prodFind) {
				colocarDentro += '<tr onclick="productionSpecific('
						+ prodFind[i].id + ", 'normal'" + ');">' //Informa o tipo do animal
						+ "<td>" + prodFind[i].name_ration + "</td>" + "<td>" //O nome da ração
						+ prodFind[i].qtd_final + "</td>" + "<td>" // A quantidade final produzida
						+ prodFind[i].date + "</td>" + "<td>" // A data em que foi produzida
						+ prodFind[i].user + "</td></tr>"; // E quam foi o usuário a cadastrar aquela produção
		}
		if (prodFind.length == 0){
			colocarDentro = '<div class="alert alert-warning" role="alert" class="alert"><strong>Atenção!</strong> Nenhuma produção encontrada! </div>';
			$("#caix").html(colocarDentro);
			$(".alert").alert();
			
		}
		else{
		
		calcsWithInsumos(prodFind);
		colocarDentro += "</tbody></table></div></div>";
		$("#caix").html(colocarDentro);
		}
}

function calcsWithInsumos(produt)
{
	var insumo = $("#insumo").val();
	if (insumo.length < 1)
		{
		colocarDentro = '<div class="alert alert-warning" role="alert" class="alert"><strong>Atenção!</strong> Nenhum insumo inserido para a pesquisa! </div>';
			$("#infoInsumos").html(colocarDentro);
			$(".alert").alert();
		}
	else
		{
	var insu = getProdutionForInsumos(produt, insumo);
	var colocarDentro = '<div class="panel panel-success"><div class="panel-heading">Informações Insumo ' + insumo
		+ '</div><div class="panel-body"><table class="table table-hover"><tbody>';
	var maior = 0;
	var idMaior = 0;
	var menor = 100000;
	var idMenor = 0;
	var media = 0;
	var somaTotal = insu[0];
	
	for (i in insu[1])
		{

			if(insu[1][i][insu[2][i]] >= maior)
				{
					maior = insu[1][i][insu[2][i]];
					idMaior = insu[1][i];
				}

			if(insu[1][i][insu[2][i]] <= menor)
			{
				menor = insu[1][i][insu[2][i]];
				idMenor = insu[1][i];
			}
			
			media += insu[1][i][insu[2][i]];
		
		}
	media = media / insu[1].length;
	colocarDentro += "<tr><td>Maior uso foi: </td> <td>" + maior + " Kg feita em " + idMaior["date"] + " na ração: " + idMaior["name_ration"] + "</td></tr>";
	colocarDentro += "<tr><td>Menor uso foi: </td> <td>" + menor + " Kg feita em " + idMenor["date"] +  idMenor["name_ration"] + "</td></tr>";
	colocarDentro += "<tr><td>Gasto total do insumo: </td> <td>" + somaTotal + " Kg</td></tr>";
	colocarDentro += "<tr><td>A Média de uso atual é: </td> <td>" + media + " Kg</td></tr> </tbody></table>";
	$("#infoInsumos").html(colocarDentro);
	if(maior == 0 && menor == 0 && somaTotal == 0)
		{
			colocarDentro = '<div class="alert alert-warning" role="alert"><strong>Atenção!</strong> Nenhum insumo encontrado! </div>';
			$("#infoInsumos").html(colocarDentro);
			$(".alert").alert();
		}
		}
	
	

}
function getProdutionForInsumos(productions, insumoX)
{
	var somaTotal = 0;
	var prod = [];
	var whereInsumo = [];
	
	for (i in productions)
		{
			for (t in insumos)
				{
					if(insumos[t]["name"] == productions[i]["name_ration"])
						{
						console.log("NOME OK");
							var cont = 1;
							for (k in insumos[t])
								{
									var test = "insumo" + cont;
									console.log(insumos[t][test]);
									console.log(insumoX);
									if (insumos[t][test] == insumoX && productions[i][test] != 0)
										{
											console.log("INSUMO OK");
											somaTotal += productions[i][test];
											prod.push(productions[i]);
											whereInsumo.push(test);
											break;
										}
									cont += 1;
								}
							
							break;
						}
				}
		}
	
	console.log(somaTotal);
	console.log(prod);
	console.log(whereInsumo);
	return [somaTotal, prod, whereInsumo];
}

var insumos = [];
function listInsumos()
{
	$.ajax({
		method : "GET",
		url : "/zoo/getAllInsumos",
		success : function(response) {
			console.log(response);
			if (response.cod == "404") {
				alert(response.message);
			} else {
				insumos = response.data;
			}
		},
		failure : function(response) {
			atualy = false;
			error();
			console.error(response);
		}
	});
}

function putInsumosForEdition()
{
	var nameRation = $("#name_ration").val();
	for (i in insumos)
		{
			if (insumos[i]["name"] == nameRation)
				{
					console.log("Entrou nessa porra!");
					k = 1;
					for (t in insumos[i])
						{
							
							name = "insumo" + k;
							if (insumos[i][name] == "None")
								{
									$("#" + name).val(" ");
								}
							else{
							$("#" + name).val(insumos[i][name]);
							}
							k += 1;
						}
					break;
				}
		}
}


function noEmptyDataEditReceita(){
	var name = "insumo";
	for (var i = 1; i < 13; i++)
		{
			var k =  name + i;
			if ($("#" + k).val() == "")
				{
					$("#" + k).val(" ");
				}
		}
	$("#changeInsumos").submit();
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



hideAll();