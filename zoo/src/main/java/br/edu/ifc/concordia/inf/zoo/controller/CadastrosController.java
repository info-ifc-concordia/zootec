package br.edu.ifc.concordia.inf.zoo.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.AbstractController;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.factory.SessionFactoryProducer;
import br.edu.ifc.concordia.inf.zoo.IndexController;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;

@Controller
public class CadastrosController extends AbstractController {
	@Inject private BovinosBS Bs;
	@Get(value = "/Cadastro")
	public void cadastrobovinos() {
	}

	@Post(value = "/Cadastrar")
	@NoCache
	public void register(int status, String CR, String Name, int NR, int NB, String Mom, String Dad, String DateofBirth, String Variety, String Creator) {
		Bs.Registrar(CR, status, Name, NR, NB, Mom, Dad, DateofBirth, Variety, Creator);
		this.result.redirectTo(IndexController.class).index();
	}
}