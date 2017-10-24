package br.edu.ifc.concordia.inf.zoo.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.AbstractController;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.zoo.IndexController;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;
import br.edu.ifc.concordia.inf.zoo.permission.Permission;
import br.edu.ifc.concordia.inf.zoo.permission.UserRoles;


@Controller
public class ExibirController extends AbstractController {
	
	@Inject private BovinosBS bs;
	
	@Post(value = "/bovinos/excluir")
	@NoCache
	public void exc(Long id) {
		bs.Excluir(id);
		this.result.redirectTo(IndexController.class).indexbovinos("Bovino excluido com sucesso");
	}
	@Get(value = "/bovinos/show/{id}")
	public void exibicao(Long id){
		Bovino bv = this.bs.exists(id, Bovino.class);
		Bovino papai = this.bs.Buscarp(bv.getNrm());
		Bovino mamae = this.bs.Buscarp(bv.getNrp());
		this.result.include("bovino", bv);
		this.result.include("papai", papai);
		this.result.include("mamae", mamae);
	}
}