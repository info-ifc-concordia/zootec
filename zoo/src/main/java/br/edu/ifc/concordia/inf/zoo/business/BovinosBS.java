package br.edu.ifc.concordia.inf.zoo.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.edu.ifc.concordia.inf.zoo.UserSession;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;

@RequestScoped
public class BovinosBS extends HibernateBusiness {
	
	@Inject UserSession userSession;
	
	public List<Bovino> Buscar(String filter){
		Criteria criteria = dao.newCriteria(Bovino.class);
		if (!GeneralUtils.isEmpty(filter)) {
			criteria.add(Restrictions.ilike("Name", filter, MatchMode.ANYWHERE));
		}
			return this.dao.findByCriteria(criteria, Bovino.class);
	}

	public void Registrar(String Raca, int NC, int NRM, int NRP, String CR, int status, String Name, int NR, int NB, String Mom, String Dad, String DateofBirth, String Variety){	
		
		Criteria criteria1 = dao.newCriteria(Bovino.class);
		criteria1.add(Restrictions.eq("Name", Name));
		Bovino BovinoTest = (Bovino) criteria1.uniqueResult();
		
		Criteria criteria2 = dao.newCriteria(Bovino.class);
		criteria2.add(Restrictions.eq("NB", NB));
		Bovino BovinoTest2 = (Bovino) criteria1.uniqueResult();
		
		Criteria criteria3 = dao.newCriteria(Bovino.class);
		criteria3.add(Restrictions.eq("NR", NR));
		Bovino BovinoTest3 = (Bovino) criteria1.uniqueResult();
		
		Criteria criteria4 = dao.newCriteria(Bovino.class);
		criteria1.add(Restrictions.eq("NC", NC));
		Bovino BovinoTest4 = (Bovino) criteria1.uniqueResult();
		
		if(BovinoTest != null) {
			String oi = "Nome já existe";
		} else if(BovinoTest2 != null) {
			String oi = "Brinco já existe";
		} else if(BovinoTest3 != null) {
			String oi = "Registro já existe";
		} else if(BovinoTest4 != null) {
			String oi = "Registro do Brinco da CIDASC já exite";
		}else {
			
			Bovino Bovino = new Bovino();
			Bovino.setNRM(NRM);
			Bovino.setNRP(NRP);
			Bovino.setRaca(Raca);
			Bovino.setNC(NC);
			Bovino.setCR(CR);
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
