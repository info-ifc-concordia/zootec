package br.edu.ifc.concordia.inf.zoo.suinos;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.AbstractController;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.zoo.IndexController;
import br.edu.ifc.concordia.inf.zoo.businessOfSuinos.SuinosBS;
import br.edu.ifc.concordia.inf.zoo.suinos.model.Cobertura;
import br.edu.ifc.concordia.inf.zoo.suinos.model.Matriz;
import br.edu.ifc.concordia.inf.zoo.suinos.model.Nascimento;

@Controller
public class SuinosController extends AbstractController {
	
	@Inject private SuinosBS Bs;
	
	@Get(value="/CadastroSuino")
	public void cadastrosuinos(){
	}
	
	@Get(value="/editarmatriz/{mossa}")
	public void editarmatriz(String mossa) {
		List<Matriz> matrizes = this.Bs.listTypeMossa();
		Matriz matriz = null;
		for (Matriz m : matrizes) {
			if (m.getMossa().equals(mossa)) {
				matriz = m;
				break;
			}
		}
		
		this.result.include("matrizEditar", matriz);
	}
	
	@Get(value="/registronascimento")
	public void registronascimento(){
		List<Matriz> matriz = this.Bs.listTypeMossa(); 
		this.result.include("matriz2", matriz);
	}
	
	@Get(value="registrocobertura")
	public void registrocobertura() {
		List<Matriz> matriz = this.Bs.listTypeMossa(); 
		this.result.include("matriz2", matriz);
	}
	
	@Get(value="/ListarMatrizes")
	public void listarmatrizes(){
		List<Matriz> matriz = this.Bs.listTypeMossa(); 
		this.result.include("matriz2", matriz);
	}	
	
	@Get(value="/RequestMatrizes")
	public void requestmatrizes() {
		List<Matriz> matriz = this.Bs.listTypeMossa();
		this.success(matriz, (long) matriz.size());
	}
	
	@Get(value="/ListarNascimentos")
	public void listarnascimentos() {
		List<Nascimento> nascimento = this.Bs.listNascimento();
		this.result.include("nascimento", nascimento);
	}
	
	@Get(value="ListarCoberturas")
	public void listarcoberturas(){
		List<Cobertura> matriz = this.Bs.listTypeCobertura(); 
		this.result.include("cobertura", matriz);
	}	
	
	@Get(value="/Confirmar")
	public void confirmarcobertura(){
	}	
	
	@Get(value="/controlSuinos")
	public void controlsuinos() {}
	
	@Get(value="Cobertura")
	public void getcobertura() {		
	}
	
	@Get(value="/MatrizEspecifico/{mossa}")
	public void matrizespecifico(String mossa){
		this.listarcoberturas();
		this.listarmatrizes();
		this.listarnascimentos();
		this.result.include("ola", mossa);
	}
	
	@Get(value="/MatrizEspecificoBusca")
	public void matrizespecificobusca(String Mossa) {
		this.listarcoberturas();
		this.listarmatrizes();
		this.listarnascimentos();
		this.result.include("ola", Mossa);
	}
	
	@Get(value="/Registronascimento/{mossa}")
	public void registronascimento(String mossa) {
		this.result.include("mossa", mossa);
	}
	
	@Post(value="RegistrarNascimento/{mossa}")
	@NoCache
	public void RegistrarNascimento(String mossa, String Data, int Vivos, int Nati, int Mumi) {
		this.Bs.registrarNascimento(mossa, Data, Vivos, Nati, Mumi);
		this.result.redirectTo(IndexController.class).index();
	}
	
	@Post(value="/CadastrarSuino")
	@NoCache
	public void registrar(String Mossa, String Vigilancia, String Raca, String Origem, String Tipo) {
		this.Bs.registrarMatriz(Mossa, Vigilancia, Raca, Origem, Tipo);
		this.result.redirectTo(IndexController.class).index();
	}
	
	@Post(value="/RegistrarCobertura")
	@NoCache
	public void registrarCobertura(String Mossa, String Data, String Cachaco, String Tipo) {
		this.Bs.registrarCobertura(Mossa, Data, Cachaco, Tipo);
		this.result.redirectTo(IndexController.class).index();
	}
	
	@Post(value="ConfirmarRegistro")
	@NoCache
	public void confirmarRegistro(Cobertura cobertura) {
		this.result.include("ultimo", cobertura);
	}
	
	@Post(value="EditarMatriz")
	public void editarMatriz(String Tipo, String Origem, String Vigilancia, String Raca, String Mossa) {
		this.Bs.editarMatriz(Tipo, Origem, Vigilancia, Raca, Mossa);
		this.result.redirectTo(IndexController.class).index();
	}
}