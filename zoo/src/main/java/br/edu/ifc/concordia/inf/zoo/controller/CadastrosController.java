package br.edu.ifc.concordia.inf.zoo.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.AbstractController;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.edu.ifc.concordia.inf.zoo.IndexController;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;
import br.edu.ifc.concordia.inf.zoo.permission.Permission;
import br.edu.ifc.concordia.inf.zoo.permission.UserRoles;

@Controller
public class CadastrosController extends AbstractController {
	@Inject private BovinosBS Bs;
	
	@Get("/bovinos/cadastro")
	@Permission(UserRoles.ADMIN)
	public void cadastrobovinos(String errorMsg) {
		if (!GeneralUtils.isEmpty(errorMsg)){
			this.result.include("errorMsg",errorMsg);
		}
	}
	
	@Post(value = "/bovinos/cadastrar")
	@NoCache
	public void register(String sexo,
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
			String rCustom)
	{
		if (rCustom!= null) {
			try {
			Bs.Registrar(sexo, rCustom, nc, nrm, nrp, cr, status, name, nb, mom, dad, dateOfBirth, variety);
			this.result.redirectTo(IndexController.class).indexbovinos("Animal cadastrado com sucesso!");
			} catch (Exception ex){
				this.result.redirectTo(CadastrosController.class).cadastrobovinos(ex.getMessage());
			}
		}else {
			try {
			Bs.Registrar(sexo, raca, nc, nrm, nrp, cr, status, name, nb, mom, dad, dateOfBirth, variety);
			this.result.redirectTo(IndexController.class).indexbovinos("Animal cadastrado com sucesso!");
			}catch(Exception ex) {
				this.result.redirectTo(CadastrosController.class).cadastrobovinos(ex.getMessage());
			}
		}
	}
}