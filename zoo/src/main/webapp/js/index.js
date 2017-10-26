/*
 Requisição Ajax usada na JSP 'add_prodution'
 Essa requisição busca os tipos de ração disponiveis no banco de determinada tipo de animal
 */
var rationCurrent = "";
		function getNameRations() {
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
			colocarDentro += '<tr class="prodFound" onclick="productionSpecific('
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

//Função usada para a geração de relátórios
function informations()
{
	//Coleta de dados que vão ser pertinentes ao relatório
	//Todos os dados são informados e definidos pelo usuário
	var nameRation = $("#name_ration").val();
	var typeAnimal = $("#animal_type_ration").val();
	var qtd_max = $("#qtd_final_max").val();
	var qtd_min = $("#qtd_final_min").val();
	var insumo = $("#insumo").val();
	var anoI = $("#dataInicio").val().toString();
	var anoF = $("#dataFim").val().toString(); 
	
	//Verificar se há dados inseridos pelo usuário
	//Caso não houver, ele muda o valor para "None", para informar que o campo foi deixado em branco
	if (anoI.length < 1)
	{
		anoI = "None";
	}
	
	if (anoF.length < 1)
	{
		anoF = "None";
	}
	
	anoI = anoI.split("-"); //Ano Inicial; A ordem é: Ano, mês e data
	anoF = anoF.split("-"); //Ano Final; A ordem é: Ano, mês e data
	
	if (nameRation == "Selecione a ração")
	{
		nameRation = "None";
	}
	
	if (typeAnimal == "Selecione o tipo de ração")
	{
		typeAnimal = "None";
	}
	
	if (qtd_max == 0)
	{
		qtd_max = 10000000000;
	}

	//Ambas as variaveis são usadas para informar a ordem de verificação dos dados;
	var infos = ["data", nameRation, typeAnimal, "qtd_max", "qtd_min"];
	var acessBanco = ["date", "name_ration", "type_animal", "qtd_final", "qtd_final"];
	prodFind = []; // Todas as produções que forem encontradas, isto é, que tenham dados validos de acordo com as informações inseridas pelo usuário vem nessa variavel;
	
	for (i in productions)//Será percorido toda a lista de produções existentes
		{
			var tf = true; 
			// Para sabermos se uma produção é valida, atribuinos uma variavel a ela, que representa o status atual dela
			//Se em algum momento ela não cumprir o que é pré definido pelo usuário, o valor dessa variavel é trocado para false, 
			// e ela já deixara de ser uma produção valida para o relatório
			for (t in infos)
				{
					var r = acessBanco[t];	
					console.log(productions[i][r]);
					if(r == "qtd_final")
						{
							if(productions[i][r] < qtd_min || productions[i][r] > qtd_max ) 
								// Verificação do valor: Ele deve ser maior que o minimo e menor que o maximo; 
								// Caso contráio, a produção não é válida
								{
									tf = false;
								}
						}
					
					else if(r == "date")
						{
						//Verficação da data de produção;

							var anoProd = productions[i][r].split("-");
									if (anoI.length == 3)
										{//Verificação se a data da produção é "maior" que a data de inicio
											
											//Nessa parte, as comparações são feitas entre a data da produção (anoProd), e o ano inicial (anoI) 
											if (anoProd[0] < anoI[0]) //Verifica se o ano é menor 
												{tf = false;}
											else if(anoProd[0] == anoI[0] && anoProd[1] < anoI[1]) // Verifica se o mês é menor 
												{tf = false;}
											else if(anoProd[0] == anoI[0] && anoProd[1] == anoI[1] && anoProd[2] < anoI[2]) // verifica se o dia é menor
												{tf=false;} 
									//Se qualquer um dos critérios acimas citados for verdadeiro, a produção é falsa, por que não corresponde a uma produção valida;
											//Se a produção é falsa, o valor tf recebe false para informar isso!
										}
									
									if (anoF.length == 3)
										{//Verificação se a data da produção é "menor" que a data final
											//Nessa parte, as comparações são feitas entre a data da produção (anoProd), e o ano final (anoF)  
											if (anoProd[0] > anoF[0]) //Verifica se o ano da produção é maior que o ano do ano final 
												{tf = false;}
											else if(anoProd[0] == anoF[0] && anoProd[1] > anoF[1])//Verifica se o mês é maior
												{tf = false;}
											else if(anoProd[0] == anoF[0] && anoProd[1] == anoF[1] && anoProd[2] > anoF[2])//Verifica se o dia é maior
												{tf=false;}
											//Se qualquer um dos critérios acima for verdadeiro, a produção não é válida;
												//Se a produção é falsa, o valor tf recebe false para informar isso!
										}	
						}
					
					else{
						//Veirificação: Se ambos os dados das 2 listas forem iguais, significa que a aquele dado é valido, o que NÃO torna a produção falsa
					if(productions[i][r] != infos[t])
						{
							if(infos[t] != "None")//Se caso os dados forem diferentes, e o valor foi informado pelo usuário (diferente de None), a produção é falsa
							{
								tf = false;
							}
						}

						}	
				}
			
			if (tf == true) //Se caso a produção chegar nesse ponto e não tiver sua variável tf afetada (no caso, continue com o calor true)
				{
					prodFind.push(productions[i]); //Adicionando a produção nas produções encontradas
				}
		}

		if (insumo.length > 1)//Se houver algum insumo informado pelo usuário;
			{
				var calcs = getProdutionForInsumos(prodFind, insumo); //Chamamos a função getProdutionForInsumos, que irá fazer os devidos procedimentos como explicado a na própria função;
				var somaTotal = calcs[0]; //Soma total gasta pelo insumo
				prodFind = calcs[1]; //Produções encontradas que contenham o insumo e atendem a todos os outros critérios;
			}
		else{

		}
		
		//colocarDentro é a variavel que terá todo o conteudo que será colocado na tela para o usuário;
		var colocarDentro = '<div class="panel panel-success"><div class="panel-heading">Produções Encontradas'
				+ '</div><div class="panel-body"><table class="table table-hover"><thead><tr><th><b>Nome da Produção</b></th><th><b>Quantidade Produzida</b></th><th><b>Data do Cadastro</b></th><th><b>Responsável</b></th></tr></thead><tbody>';
		for (i in prodFind) {//Percorre todas as produções entradas
				colocarDentro += '<tr class = "prodFound" onclick="productionSpecific('
						+ prodFind[i].id + ", 'normal'" + ');">' //Informa o tipo do animal
						+ "<td>" + prodFind[i].name_ration + "</td>" + "<td>" //O nome da ração
						+ prodFind[i].qtd_final + "</td>" + "<td>" // A quantidade final produzida
						+ prodFind[i].date + "</td>" + "<td>" // A data em que foi produzida
						+ prodFind[i].user + "</td></tr>"; // E quam foi o usuário a cadastrar aquela produção
		}
		
		//Se caso não houver nenhuma produção encontrada, será "emitdo" esse alerta avisando o usuário!
		if (prodFind.length == 0){
			colocarDentro = '<div class="alert alert-warning" role="alert" class="alert"><strong>Atenção!</strong> Nenhuma produção encontrada! </div>';
			$("#caix").html(colocarDentro);
			cD = '<div class="alert alert-warning" role="alert" class="alert"><strong>Atenção!</strong> Nenhum insumo encontrado!! </div>';
			$("#infoInsumos").html(cD);
			$(".alert").alert();
		}
		else{
			calcsWithInsumos(prodFind); //Coloca os dados do insumo; 
			colocarDentro += "</tbody></table></div></div>";//Fecha a tabela;
			$("#caix").html(colocarDentro);//Insere os dados no HTML
		}
}

function calcsWithInsumos(produt)
{
	var insumo = $("#insumo").val();
	if (insumo.length < 1)//Se caso não houver nenhum insumo para consulta, ele irá informar ao usuário;
		{
			colocarDentro = '<div class="alert alert-warning" role="alert" class="alert"><strong>Atenção!</strong> Nenhum insumo inserido para a pesquisa! </div>';
			$("#infoInsumos").html(colocarDentro);
			$(".alert").alert();
		}
	else
		{
		
			var insu = getProdutionForInsumos(produt, insumo);//Pega todas as produções que conterem o insumo;
			var colocarDentro = '<div class="panel panel-success"><div class="panel-heading">Informações Insumo ' + insumo
				+ '</div><div class="panel-body"><table class="table table-hover"><tbody>';
			//Variaveis que serão usadas para os calculos;
			var maior = 0;
			var idMaior = 0;
			var menor = 100000;
			var idMenor = 0;
			var media = 0;
			var somaTotal = insu[0];
			for (i in insu[1])
				{
					if(insu[1][i][insu[2][i]] >= maior)//Encontrando o maior gasto do insumo!
						{
							maior = insu[1][i][insu[2][i]];
							idMaior = insu[1][i]; 
						}
					if(insu[1][i][insu[2][i]] <= menor)//Encontrando o menor gasto do insumo;
					{
						menor = insu[1][i][insu[2][i]];
						idMenor = insu[1][i];
					}
					media += insu[1][i][insu[2][i]];
		
		}
	media = media / insu[1].length; //Calculando a média!
	//Inserindo os dados dentro de uma variavel que posteriormente irá para o HTML!
	colocarDentro += "<tr><td>Maior uso foi: </td> <td>" + maior + " Kg feita em " + idMaior["date"] + " na ração: " + idMaior["name_ration"] + "</td></tr>";
	colocarDentro += "<tr><td>Menor uso foi: </td> <td>" + menor + " Kg feita em " + idMenor["date"] +  idMenor["name_ration"] + "</td></tr>";
	colocarDentro += "<tr><td>Gasto total do insumo: </td> <td>" + somaTotal + " Kg</td></tr>";
	colocarDentro += "<tr><td>A Média de uso atual é: </td> <td>" + media + " Kg</td></tr> </tbody></table>";
	$("#infoInsumos").html(colocarDentro);//Colocando os dados no HTML;
	if(maior <= 0 && menor <= 0 || somaTotal <= 0)//Se caso as variaveis contiveram ainda os seus valores iniciais, (continuarem intactas), significa que nenhum insumo foi encontrado!
		{
			colocarDentro = '<div class="alert alert-warning" role="alert"><strong>Atenção!</strong> Nenhum insumo encontrado! </div>';
			$("#infoInsumos").html(colocarDentro);
			$(".alert").alert();//Informando que ao usuário que nunhum insumo foi encontrado!
		}
	}
}

//Função que irá encontrar, dentre as produções informadas, quais contem o insumo informado
function getProdutionForInsumos(productions, insumoX)
{
	var somaTotal = 0;
	var prod = [];
	var whereInsumo = [];
	for (i in productions)//Percore as produções
		{
			for (t in insumos)//Percore as receitas com os insumos
				{
					if(insumos[t]["name"] == productions[i]["name_ration"]) //Verifica se a receita pertence aquela produção, verificando se ambas tem o mesmo nome
						{
							var cont = 1;
							for (k in insumos[t])//Percore a receita encontrada
								{
									var test = "insumo" + cont;
									if (insumos[t][test] == insumoX && productions[i][test] != 0) //Verifica se o insumo é igual ao insumo informado como paramento e se na produção ele é maior que 0
										{
											somaTotal += productions[i][test]; //Adiciona o valor do gasto desse insumo na variave soma;
											prod.push(productions[i]); //Guarda a produção!
											whereInsumo.push(test);//Guarda em qual insumo é que ele é igual (insumo1, insumo2, ..., insumo12, insumo13);
											break;
										}
									cont += 1;
								}
							break;
						}
				}
		}
	return [somaTotal, prod, whereInsumo]; //Retorna os dados!
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

//Função usada na JSP  edit_type_ration, para colocar como valor dos inputs, o insumo encontrado na receita!
function putInsumosForEdition()
{
	var nameRation = $("#name_ration").val();//Pega o nome da ração
	for (i in insumos)//Percorre a lista com os insumos
		{
			if (insumos[i]["name"] == nameRation)//Verificar se o nome da receita é o mesmo que o que foi selecionado pelo usuário
				{
					k = 1;
					for (t in insumos[i]) //Percore a receita especifica
						{
							name = "insumo" + k;//Usada para percorrer todos os 12 insumos;
							if (insumos[i][name] != "None") //Verifica se o insumo existe, se caso ele não existe o valor de é None
								{
									$("#" + name).val(insumos[i][name]);//Coloca o valor do insumo no value do input que se refere ao numero do insumo 
								}
							k += 1;
						}
					break; //Se ele chegar aqui, significa que ele já encontrou a receita, e não precisa mais continuar o loop;
				}
		}
}

//Função usada na JSP edit_type_ration para não deixar fazer o submit com espaços em branco nos inputs dos insumos!
function noEmptyDataEditReceita(){
	var name = "insumo";
	for (var i = 1; i < 13; i++)//Percorendo os 12 insumos
		{
			var k =  name + i;//Usada para pegar o id (insumo + n);
			if ($("#" + k).val() == "")//Verificando se o valor do input é igual a vazio (ou igual a "")
				{ //Se caso o input do insumoX estiver vazio, o valor será alterado para " ";
					$("#" + k).val(" ");//Aterando o valor do campo para " ";
				}
		}
	$("#changeInsumos").submit(); //Fazendo o submit via JS;
}

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
