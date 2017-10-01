package br.edu.ifc.concordia.inf.zoo.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.boilerplate.AbstractController;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;
import br.edu.ifc.concordia.inf.zoo.permission.Permission;
import br.edu.ifc.concordia.inf.zoo.permission.UserRoles;

@Controller
public class EdicaoController extends AbstractController{
	
	@Inject private BovinosBS bs;
	
	@Get("/edit/{id}")
	@Permission(UserRoles.SYS_ADMIN)
	public void edicao(Long id){
		Bovino bv = this.bs.exists(id,Bovino.class);
		if(bv == null) {
			this.result.notFound();
		}else {
			this.result.include("Bovino",bv);
		}
	}
}
