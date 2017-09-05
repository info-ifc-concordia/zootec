package br.edu.ifc.concordia.inf.zoo.business;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.zoo.UserSession;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;

@RequestScoped
public class BovinosBS extends HibernateBusiness {
	
	@Inject UserSession userSession;
	public void Registrar(String CR, int status, String Name, int NR, int NB, String Mom, String Dad, String DateofBirth, String Variety, String Creator){	
		
		Criteria criteria1 = dao.newCriteria(Bovino.class);
		criteria1.add(Restrictions.eq("Name", Name));
		Bovino BovinoTest = (Bovino) criteria1.uniqueResult();
		
		Criteria criteria2 = dao.newCriteria(Bovino.class);
		criteria2.add(Restrictions.eq("NB", NB));
		Bovino BovinoTest2 = (Bovino) criteria1.uniqueResult();
		
		Criteria criteria3 = dao.newCriteria(Bovino.class);
		criteria3.add(Restrictions.eq("NR", NR));
		Bovino BovinoTest3 = (Bovino) criteria1.uniqueResult();
		
		if(BovinoTest != null) {
			String oi = "Nome já existe";
		} else if(BovinoTest2 != null) {
			String oi = "Brinco já existe";
		} else if(BovinoTest3 != null) {
			String oi = "Registro já existe";
		} else {
			
			Bovino Bovino = new Bovino();
			Bovino.setCR(CR);
			Bovino.setCreator(Creator);
			Bovino.setDad(Dad);
			Bovino.setDateofBirth(DateofBirth);
			Bovino.setMom(Mom);
			Bovino.setName(Name);
			Bovino.setNB(NB);
			Bovino.setNR(NR);
			Bovino.setStatus(status);
			Bovino.setCadastror(userSession.getUser().getNome());
			
			dao.persist(Bovino);
		}
	}
}
