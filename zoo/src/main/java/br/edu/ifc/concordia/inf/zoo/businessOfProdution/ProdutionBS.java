package br.edu.ifc.concordia.inf.zoo.businessOfProdution;

import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.com.caelum.vraptor.boilerplate.HibernateDAO;
import br.com.caelum.vraptor.boilerplate.factory.SessionFactoryProducer;
import br.com.caelum.vraptor.boilerplate.factory.SessionManager;
import br.edu.ifc.concordia.inf.zoo.factory.ApplicationSetup.DefaultTrustManager;
import br.edu.ifc.concordia.inf.zoo.model.Produtions;
import br.edu.ifc.concordia.inf.zoo.model.User;

@RequestScoped
public class ProdutionBS extends HibernateBusiness{
	
	public List<Produtions> listTypeRations() {
		Criteria criteria = this.dao.newCriteria(Produtions.class);
		return this.dao.findByCriteria(criteria, Produtions.class);
	}
	
	
	public void doRegisterNewType(SessionFactoryProducer factoryProducer, String name_ration,String animal_type_ration,  String insumo1, String insumo2, String insumo3, String insumo4, String insumo5, 
			String insumo6, String insumo7, String insumo8, String insumo9, String insumo10, String insumo11, String insumo12)
	{
		SessionManager mngr = new SessionManager(factoryProducer.getInstance());
		factoryProducer.initialize("hibernate.cfg.xml");
		HibernateDAO dao = new HibernateDAO(mngr);
		
		Criteria criteria = dao.newCriteria(Produtions.class);
		criteria.add(Restrictions.eq("name", name_ration));
		Produtions userTest = (Produtions) criteria.uniqueResult();
		
		if (userTest != null) {
			String i = "Ração já cadastrada!";
		}
		else {
			System.out.println(name_ration);
			Produtions prod = new Produtions();
			prod.setName(name_ration);
			prod.setType_animal(animal_type_ration);
			prod.setInsumo1(insumo1);
			prod.setInsumo2(insumo2);
			prod.setInsumo3(insumo3);
			
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
			try {
				SSLContext ctx = SSLContext.getInstance("TLS");
				ctx.init(new KeyManager[0], new TrustManager[] { new DefaultTrustManager() }, new SecureRandom());
				SSLContext.setDefault(ctx);
			} catch (GeneralSecurityException ex) {
				System.out.println("N�o consegui sobrescrever o SSLContext.");
				ex.printStackTrace();
			}
			
			mngr.closeSession();
		}
		
		
	}
}