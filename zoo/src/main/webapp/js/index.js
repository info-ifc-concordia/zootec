/*$('document').ready(function() {
	
	putInsumosDefnidos();
	
	$("#qtdInsumos").keyup(function() {
		putTheInsumosSpace();
	});
	
	$("#qtdInsumos").change(function() {
		putTheInsumosSpace();
	});
	
});

*/



function putInsumosDefnidos()
{
	qtdIn = 7;
	insumos = ["Milho", "Soja", "Proto 15", "Ureia", "Leite", "Batata", "Bergamota", "Ovo"];
	var colocarDentro = "<br>";
	var n;
	var a = 0;
	while (a < qtdIn)
		{
			n = "qtd_insumo" + a;
			colocarDentro += '<div class="form-group col-md-3 col-xs-12">';
			colocarDentro += '<label for="number">' + insumos[a] + ":</label>";
			colocarDentro += '<input type="number" class="form-control" id="' + n + '" required>';
			colocarDentro += "</div>";
			a += 1;
		}
	$("#insumosDefenidosRacao").html(colocarDentro);

}


function putTheInsumosSpace()
{
	var qtdIn = 11;
	console.log(qtdIn);
	var colocarDentro = "<br>";
	var n;
	var a = 1;
	while (a <= 11)
		{
			n = "insumo" + a;
			colocarDentro += '<div class="form-group col-md-6 col-xs-12">';
			colocarDentro += '<label for="text">Insumo ' +  a + ":</label>";
			colocarDentro += '<input type="text" class="form-control" id="' + n + '" required>';
			colocarDentro += "</div>"
			
			a += 1;
		}
	$("#insumosColocar").html(colocarDentro);
}

function goToJsForSubmit(){
	$("#typeRation").submit();
	
	var cont = 1;
	var insumos = '<c:forEach items="${prod}" var="typeDefined">';
	var ins;
	while (cont < 13)
		{
		ins = "insumo" + cont;
		insumos += '<label for="number">${typeDefined.' + ins + '}</label>';
		insumos += '<input type="number" class="form-control" id="' + "'" + ins + "'" + ">";
		cont += 1;
		}
		insumo += "</c:forEach>";
		$("#insumosDefined").html(insumo);
}

$('document').ready(function() {
	putTheInsumosSpace();
});


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

s
