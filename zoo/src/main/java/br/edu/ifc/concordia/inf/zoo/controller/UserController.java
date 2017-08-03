package br.edu.ifc.concordia.inf.zoo.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.factory.SessionFactoryProducer;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.edu.ifc.concordia.inf.zoo.IndexController;
import br.edu.ifc.concordia.inf.zoo.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.zoo.business.UserBS;
import br.edu.ifc.concordia.inf.zoo.model.User;

@Controller
public class UserController extends AbstractController {
	@Inject private UserBS bs;
	
	@Get("/login")
	public void login(String errorMsg) {
		if (!GeneralUtils.isEmpty(errorMsg)){
			this.result.include("errorMsg",errorMsg);
		}
		
	}
	

	@Post(value="/login")
	@NoCache
	public void doLogin(String username, String password)
	{
		User user = this.bs.login(username, password);
		if (user == null){
			this.result.redirectTo(this).login("Usuário ou senha errado!");
		}else{
			this.userSession.login(user);
			this.result.redirectTo(IndexController.class).index();
		}
		
	}
	
	@Path(value="/cadastro")
	public void cadastro() {
		
	}
		
	@Get("/registerUser")
	public void cadastro(String errorMsg) {
		if (!GeneralUtils.isEmpty(errorMsg)){
			this.result.include("errorMsg",errorMsg);
		}
	}
	
	@Post(value="/registerUser")
	@NoCache
	public void doCadastro(String nome, String email, String cargo, String login, String senha, String conf){
		if(!senha.equals(conf)){
			this.result.redirectTo(this).cadastro("Confirme a senha corretamente.");
		}
		SessionFactoryProducer factoryProducer = new SessionFactoryProducer();
		this.bs.cadastro(factoryProducer, nome, email, cargo, login, senha);
		this.result.redirectTo(IndexController.class).index();
	
	}
}



