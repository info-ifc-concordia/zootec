package br.edu.ifc.concordia.inf.zoo;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.lucene.util.IOUtils;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.com.caelum.vraptor.view.Results;
import br.edu.ifc.concordia.inf.zoo.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;
import br.edu.ifc.concordia.inf.zoo.business.UserBS;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;
import br.edu.ifc.concordia.inf.zoo.permission.Permission;

@Controller
public class IndexController extends AbstractController {
	
	@Inject private BovinosBS bovinob;
	@Inject private UserBS userBS;
	@Inject private UserSession UserSession;
	@Path(value="/", priority=Path.HIGHEST)
	@NoCache
	public void index() {
		UserSession.setPagina(null);
	}
	
	@Get(value = "/Racao")
	public void indexracao(){
		UserSession.setPagina("racao");
	}
	
	@Get(value = "/bovinos/vaquinhas")
	public void indexbovinos(){
		UserSession.setPagina("vaquinhas");	
	}
	
	@Get(value = "/bovinos/cadastrar")
	public void indexbovinos(String errorMsg){
		if (!GeneralUtils.isEmpty(errorMsg)){
			this.result.include("msg",errorMsg);
		}
	}
	
	@Get(value="/bovinos/exibir")
	public void amostra(String filter) {
		List<Bovino> listinha = bovinob.Buscar(filter);
		if(listinha.size() == 0) {
			this.result.include("size", 0);
		}else {
			this.result.include("lista", listinha);
			this.result.include("size", 1);
		}
	}
	
	@Get(value = "/bovinos/listar")
	public void listbovs() {
		String filter = "";
		List<Bovino> listinha = bovinob.Buscar(filter);
		if(listinha.size() == 0) {
			this.result.include("size", 0);
		}else {
			this.result.include("lista", listinha);
			this.result.include("size", 1);
		}
	}
	
/*	@Get(value = "/bovinos/{}")
	*/
}
