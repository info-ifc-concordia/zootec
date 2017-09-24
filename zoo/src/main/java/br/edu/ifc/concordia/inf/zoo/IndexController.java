package br.edu.ifc.concordia.inf.zoo;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.zoo.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;
import br.edu.ifc.concordia.inf.zoo.business.UserBS;
import br.edu.ifc.concordia.inf.zoo.controller.IndexBovinoController;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;
import br.edu.ifc.concordia.inf.zoo.permission.Permission;

@Controller
public class IndexController extends AbstractController {
	
	@Inject private BovinosBS bovinob;
	@Inject private UserBS userBS;
	@Inject private UserSession UserSession;
	@Path(value="/", priority=Path.HIGHEST)
	@NoCache
	@Permission
	public void index() {
		UserSession.setPagina(null);
	}
	
	@Get(value = "/Racao")
	public void indexracao(){
		UserSession.setPagina("racao");
	}
	
	@Get(value = "/Vaquinhas")
	public void indexbovinos(){
		UserSession.setPagina("vaquinhas");	
	}
	
	@Get(value="/Exibir")
	public void amostra(String filter) {
		List<Bovino> listinha = bovinob.Buscar(filter);
		this.result.include("Lista", listinha);
	}
}
