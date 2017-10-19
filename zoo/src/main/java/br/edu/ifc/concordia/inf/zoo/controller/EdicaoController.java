package br.edu.ifc.concordia.inf.zoo.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.AbstractController;
import br.edu.ifc.concordia.inf.zoo.IndexController;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;
import br.edu.ifc.concordia.inf.zoo.permission.Permission;
import br.edu.ifc.concordia.inf.zoo.permission.UserRoles;

@Controller
public class EdicaoController extends AbstractController{
	
	@Inject private BovinosBS bs;
	
	@Get(value = "/bovinos/edit/{id}")
	public void edicao(Long id){
		Bovino bv = this.bs.exists(id, Bovino.class);
		Bovino papai = this.bs.Buscarp(bv.getNrm());
		Bovino mamae = this.bs.Buscarp(bv.getNrp());
		this.result.include("papai", papai);
		this.result.include("mamae", mamae);
		this.result.include("bovino", bv);
	}
	
	
	@Post(value = "/bovinos/editar")
	@Permission(UserRoles.SYS_ADMIN)
	public void editar(Long id, 
			String sexo,
			String nrp, 
			String nrm, 
			String nc, 
			String raca,
			String status, 
			String cr, 
			String name, 
			String nb, 
			String mom, 
			String dad, 
			String dateOfBirth, 
			String variety,
			String rCustom) {
		if (rCustom!= null) {
			bs.editar(id ,sexo, rCustom, nc, nrm, nrp, cr, status, name, nb, mom, dad, dateOfBirth, variety);
			this.result.redirectTo(IndexController.class).indexbovinos("Animal editado com sucesso!");
		}else {
			bs.editar(id, sexo, raca, nc, nrm, nrp, cr, status, name, nb, mom, dad, dateOfBirth, variety);
			this.result.redirectTo(IndexController.class).indexbovinos("Animal editado com sucesso!");
		}
	}
}
