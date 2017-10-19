package br.edu.ifc.concordia.inf.zoo.produtions;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.factory.SessionFactoryProducer;
import br.edu.ifc.concordia.inf.zoo.IndexController;
import br.edu.ifc.concordia.inf.zoo.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.zoo.businessOfProdution.ProdutionBS;
import br.edu.ifc.concordia.inf.zoo.model.Produtions;
import br.edu.ifc.concordia.inf.zoo.model.Receitas;

@Controller
public class ProdutionController extends AbstractController {
	@Inject private ProdutionBS bs;
	
	@Get(value="/add_prodution")
	public void add_prodution() {	
		List<Receitas> types = this.bs.listTypeRations();
		this.result.include("rations", types);	
	}

	@Get(value="/add_type_ration")
	public void add_type_ration() {
	}
	
	@Get(value="/remove_prodution")
	public void remove_prodution() {	
	}
	
	@Post(value="/registerNewTypeRation")
	@NoCache
	public void registerNewTypeRation(String name_ration, String animal_type_ration, String insumo1, String insumo2, String insumo3, String insumo4, String insumo5, 
			String insumo6, String insumo7, String insumo8, String insumo9, String insumo10, String insumo11, String insumo12){	
		SessionFactoryProducer factoryProducer = new SessionFactoryProducer();
		this.bs.doRegisterNewType(factoryProducer, name_ration, animal_type_ration, insumo1, insumo2,  insumo3,  insumo4, insumo5, 
				 insumo6,  insumo7,  insumo8, insumo9, insumo10,  insumo11,  insumo12);
		this.result.redirectTo(IndexController.class).index();
	}

	@Post(value="/registerNewProdution")
	@NoCache
	public void registerNewProdution(String dat, String name_ration, String animal_type_ration,  
			double insumo1, double insumo2, double insumo3, double insumo4, double insumo5, 
			double insumo6, double insumo7, double insumo8, double insumo9, double insumo10, 
			double insumo11, double insumo12, double qtd_final, String name_user) {
		
		SessionFactoryProducer factoryProducer = new SessionFactoryProducer();
		this.bs.doRegisterNewProdution(factoryProducer, dat, name_user, name_ration, animal_type_ration,  insumo1, insumo2,
				insumo3, insumo4, insumo5, insumo6, insumo7, insumo8, insumo9, insumo10, insumo11, insumo12, qtd_final);
		
		this.result.redirectTo(IndexController.class).index();
	}
	
	
	@Get("/getInsumos")
	@NoCache
	public void listInsumos(String name, String animal)
	{
		try {
			Receitas receita = this.bs.getInsumos(name, animal); 
			this.success(receita);
		}
		catch(Throwable ex) {
			this.fail(ex.getMessage());
		}
	}
	
	
	@Get("/getNameRations")
	@NoCache
	public void listNamesRations(String animal)
	{
		try {
			List<Receitas> receita = this.bs.listTypeRationEspe(animal); 
			this.success(receita, (long) receita.size());
		}
		catch(Throwable ex) {
			this.fail(ex.getMessage());
		}
	}
	
	
	@Get("/getProdutions")
	@NoCache
	public void ProductionsList(String animal)
	{
		try {
			List<Produtions> produtions = this.bs.ProdutionsList(); 
			this.success(produtions, (long) produtions.size());
		}
		catch(Throwable ex) {
			this.fail(ex.getMessage());
		}
	}
	
	@Post(value="/editProduction")
	@NoCache
	public void editProduction(Long id,  
			double insumo1, double insumo2, double insumo3, double insumo4, double insumo5, 
			double insumo6, double insumo7, double insumo8, double insumo9, double insumo10, 
			double insumo11, double insumo12, double qtd_final) {
		this.bs.updateProdution(id, insumo1, insumo2, insumo3, insumo4, insumo5,
				insumo6, insumo7, insumo8, insumo9, insumo10, insumo11, insumo12, qtd_final);
		this.result.redirectTo(IndexController.class).index();
	}
	
	@Post(value="/disableProduction")
	@NoCache
	public void disableProduction(Long id2)
	{
		this.bs.disableProduction(id2);
		this.result.redirectTo(IndexController.class).index();
	}
}
