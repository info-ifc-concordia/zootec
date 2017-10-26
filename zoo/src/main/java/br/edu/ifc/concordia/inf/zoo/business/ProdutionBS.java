package br.edu.ifc.concordia.inf.zoo.business;


import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.zoo.model.Produtions;
import br.edu.ifc.concordia.inf.zoo.model.Receitas;



@RequestScoped
public class ProdutionBS extends HibernateBusiness{
	
	public List<Receitas> listTypeRations() {
		Criteria criteria = this.dao.newCriteria(Receitas.class);
		return this.dao.findByCriteria(criteria, Receitas.class);
	}
	
	
	public void doRegisterNewType(String name_ration,String animal_type_ration,  String insumo1, String insumo2, String insumo3, String insumo4, String insumo5, 
			String insumo6, String insumo7, String insumo8, String insumo9, String insumo10, String insumo11, String insumo12)
	{
		Criteria criteria = this.dao.newCriteria(Receitas.class);
		criteria.add(Restrictions.eq("name", name_ration));
		criteria.add(Restrictions.eq("type_animal", animal_type_ration));
		Receitas userTest = (Receitas) criteria.uniqueResult();
		
		if (userTest != null) {
			String i = "Ração já cadastrada!";
		}
		else {
			System.out.println(name_ration);
			Receitas prod = new Receitas();
			prod.setName(name_ration);
			prod.setType_animal(animal_type_ration);
			
			if (insumo1.length() > 1) prod.setInsumo1(insumo1);
			else prod.setInsumo1("None");
			
			if (insumo2.length() > 1) prod.setInsumo2(insumo2);
			else prod.setInsumo2("None");
			
			if (insumo3.length() > 1) prod.setInsumo3(insumo3);
			else prod.setInsumo3("None");
			
			if (insumo4.length() > 1) prod.setInsumo4(insumo4);
			else prod.setInsumo4("None");
			
			if (insumo5.length() > 1) prod.setInsumo5(insumo5);
			else prod.setInsumo5("None");
			
			if (insumo6.length() > 1) prod.setInsumo6(insumo6);
			else prod.setInsumo6("None");
			
			if (insumo7.length() > 1) prod.setInsumo7(insumo7);
			else prod.setInsumo7("None");
			
			if (insumo8.length() > 1) prod.setInsumo8(insumo8);
			else prod.setInsumo8("None");
			
			if (insumo9.length() > 1) prod.setInsumo9(insumo9);
			else prod.setInsumo9("None");
			
			if (insumo10.length() > 1) prod.setInsumo10(insumo10);
			else prod.setInsumo10("None");
			
			if (insumo11.length() > 1) prod.setInsumo11(insumo11);
			else prod.setInsumo11("None");
			
			if (insumo12.length() > 1) prod.setInsumo12(insumo12);
			else prod.setInsumo12("None");
			
			dao.persist(prod);
		}
	}
	
	public void doEditType(String name_ration, String insumo1, String insumo2, String insumo3, String insumo4, String insumo5, 
			String insumo6, String insumo7, String insumo8, String insumo9, String insumo10, String insumo11, String insumo12)
	{
		
		Criteria criteria = this.dao.newCriteria(Receitas.class);
		criteria.add(Restrictions.eq("name", name_ration));
		Receitas rec = (Receitas) criteria.uniqueResult();

		if (insumo1.length() > 1) rec.setInsumo1(insumo1);
		else rec.setInsumo1("None");
		
		if (insumo2.length() > 1) rec.setInsumo2(insumo2);
		else rec.setInsumo2("None");
		
		if (insumo3.length() > 1) rec.setInsumo3(insumo3);
		else rec.setInsumo3("None");
		
		if (insumo4.length() > 1) rec.setInsumo4(insumo4);
		else rec.setInsumo4("None");
		
		if (insumo5.length() > 1) rec.setInsumo5(insumo5);
		else rec.setInsumo5("None");
		
		if (insumo6.length() > 1) rec.setInsumo6(insumo6);
		else rec.setInsumo6("None");
		
		if (insumo7.length() > 1) rec.setInsumo7(insumo7);
		else rec.setInsumo7("None");
		
		if (insumo8.length() > 1) rec.setInsumo8(insumo8);
		else rec.setInsumo8("None");
		
		if (insumo9.length() > 1) rec.setInsumo9(insumo9);
		else rec.setInsumo9("None");
		
		if (insumo10.length() > 1) rec.setInsumo10(insumo10);
		else rec.setInsumo10("None");
		
		if (insumo11.length() > 1) rec.setInsumo11(insumo11);
		else rec.setInsumo11("None");
		
		if (insumo12.length() > 1) rec.setInsumo12(insumo12);
		else rec.setInsumo12("None");
		dao.update(rec);
		
	}

	public void doRegisterNewProdution(Produtions prod)
	//public void doRegisterNewProdution(String dat, String user, String name_ration, String animal_type_ration,  double insumo1, double insumo2, double insumo3, double insumo4, double insumo5, 
	//		double insumo6, double insumo7, double insumo8, double insumo9, double insumo10, double insumo11, double insumo12, double qtd_final)
	{		
//			Produtions prod = new Produtions();
//			prod.setName_ration(name_ration);
//			prod.setType_animal(animal_type_ration);
//			prod.setInsumo1(insumo1);
//			prod.setInsumo2(insumo2);
//			prod.setInsumo3(insumo3);
//			prod.setInsumo4(insumo4);
//			prod.setInsumo5(insumo5);
//			prod.setInsumo6(insumo6);
//			prod.setInsumo7(insumo7);
//			prod.setInsumo8(insumo8);
//			prod.setInsumo9(insumo9);
//			prod.setInsumo10(insumo10);
//			prod.setInsumo11(insumo11);
//			prod.setInsumo12(insumo12);
//			prod.setQtd_final(qtd_final);
//			prod.setDate(dat);
//			prod.setUser(user);
			prod.setDisable("able");
			
			dao.persist(prod);
	}
	
	
	public Receitas getInsumos(String nameRation, String typeAnimal) {
		Criteria criteria = this.dao.newCriteria(Receitas.class);
		criteria.add(Restrictions.eq("name", nameRation));
		criteria.add(Restrictions.eq("type_animal", typeAnimal));
		return (Receitas) criteria.uniqueResult();
	}
	
	public List<Receitas> listTypeRationEspe(String typeAnimal) {
		Criteria criteria = this.dao.newCriteria(Receitas.class);
		criteria.add(Restrictions.eq("type_animal", typeAnimal));
		return this.dao.findByCriteria(criteria, Receitas.class);
	}
	
	
	public List<Produtions> ProdutionsList()
	{
		Criteria criteria = this.dao.newCriteria(Produtions.class);
		criteria.add(Restrictions.eq("disable", "able"));
		return this.dao.findByCriteria(criteria, Produtions.class);
	}
	
	public void updateProdution(Long id, double insumo1, double insumo2, double insumo3, double insumo4, double insumo5, 
			double insumo6, double insumo7, double insumo8, double insumo9, double insumo10, double insumo11, double insumo12, double qtd_final) {
		Criteria criteria = this.dao.newCriteria(Produtions.class);
		criteria.add(Restrictions.eq("id", id));
		Produtions prod = (Produtions) criteria.uniqueResult();
		prod.setInsumo1(insumo1);
		prod.setInsumo2(insumo2);
		prod.setInsumo3(insumo3);
		prod.setInsumo4(insumo4);
		prod.setInsumo5(insumo5);
		prod.setInsumo6(insumo6);
		prod.setInsumo7(insumo7);
		prod.setInsumo8(insumo8);
		prod.setInsumo9(insumo9);
		prod.setInsumo10(insumo10);
		prod.setInsumo11(insumo11);
		prod.setInsumo12(insumo12);
		prod.setQtd_final(qtd_final);
		dao.update(prod);
	}
	
	public void disableProduction(Long id)
	{
		Criteria criteria = this.dao.newCriteria(Produtions.class);
		criteria.add(Restrictions.eq("id", id));
		Produtions prod = (Produtions) criteria.uniqueResult();
		prod.setDisable("disable");	
		dao.update(prod);
	}
}