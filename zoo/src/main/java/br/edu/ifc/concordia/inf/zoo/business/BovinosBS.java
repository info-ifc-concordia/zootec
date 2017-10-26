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
import br.edu.ifc.concordia.inf.zoo.model.User;

@RequestScoped
public class BovinosBS extends HibernateBusiness {
	
	@Inject UserSession userSession;
	
	public Bovino Buscarp(String filter) {
		Criteria criteria = dao.newCriteria(Bovino.class);
		if (!GeneralUtils.isEmpty(filter)) {
			criteria.add(Restrictions.ilike("nb", filter, MatchMode.ANYWHERE));
		}
		List <Bovino> lista = this.dao.findByCriteria(criteria, Bovino.class);
		if(lista.size() > 0){
			return lista.get(0);
		}else {
			return null;
		}
	}
	
	public List<Bovino> Buscar(String filter){
		Criteria criteria = dao.newCriteria(Bovino.class);
		if (!GeneralUtils.isEmpty(filter)) {
			criteria.add(Restrictions.disjunction()
			.add(Restrictions.ilike("name", filter, MatchMode.ANYWHERE))
			.add(Restrictions.ilike("nb", filter, MatchMode.ANYWHERE)));
		}
			return this.dao.findByCriteria(criteria, Bovino.class);
	}
	
	public void Registrar(String Sexo, String Raca, String NC, String NRM, String NRP, String CR, String Status, String Name, String NB, String Mom, String Dad, String DateOfBirth, String Variety){	
		
		Criteria criteria1 = dao.newCriteria(Bovino.class);
		criteria1.add(Restrictions.eq("name", Name));
		Bovino BovinoTest = (Bovino) criteria1.uniqueResult();
		
		Criteria criteria2 = dao.newCriteria(Bovino.class);
		criteria2.add(Restrictions.eq("nb", NB));
		Bovino BovinoTest2 = (Bovino) criteria1.uniqueResult();
		
		Criteria criteria4 = dao.newCriteria(Bovino.class);
		criteria4.add(Restrictions.eq("nc", NC));
		Bovino BovinoTest4 = (Bovino) criteria1.uniqueResult();
		
		if(BovinoTest != null) {
			throw new IllegalArgumentException("Nome já cadastrado");
		} else if(BovinoTest2 != null) {
			throw new IllegalArgumentException("Numero do brinco interno já cadastrado");
		} else if(BovinoTest4 != null) {
			throw new IllegalArgumentException("Numero da CIDASC já cadastrado");
		}else {
			
			Bovino Bovino = new Bovino();
			Bovino.setNrm(NRM);
			Bovino.setNrp(NRP);
			Bovino.setRaca(Raca);
			Bovino.setNc(NC);
			Bovino.setCr(CR);
			Bovino.setDad(Dad);
			Bovino.setDateOfBirth(DateOfBirth);
			Bovino.setMom(Mom);
			Bovino.setName(Name);
			Bovino.setNb(NB);
			Bovino.setStatus(Status);
			Bovino.setCadastror(userSession.getUser().getNome());
			Bovino.setSexo(Sexo);
			Bovino.setVariety(Variety);
			dao.persist(Bovino);
		}
	}
	public void editar(Long id, 
			String Sexo,
			String Raca, 
			String NC, 
			String NRM,
			String NRP,
			String CR,
			String Status,
			String Name,
			String NB,
			String Mom, 
			String Dad,
			String DateOfBirth,
			String Variety) {
		
		Bovino bu = this.exists(id, Bovino.class);
		
		bu.setSexo(Sexo);
		bu.setRaca(Raca);
		bu.setNc(NC);
		bu.setNrm(NRM);
		bu.setNrp(NRP);
		bu.setCr(CR);
		bu.setStatus(Status);
		bu.setName(Name);
		bu.setNb(NB);
		bu.setMom(Mom);
		bu.setDad(Dad);
		bu.setDateOfBirth(DateOfBirth);
		bu.setVariety(Variety);
		dao.update(bu);
	}
}
