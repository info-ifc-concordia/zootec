package br.edu.ifc.concordia.inf.zoo.business;

import java.util.List;

import javax.enterprise.context.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.com.caelum.vraptor.boilerplate.util.CryptManager;
import br.edu.ifc.concordia.inf.zoo.model.User;

@RequestScoped
public class UserBS extends HibernateBusiness{
	
	public List<User> listUsers() {
		Criteria criteria = this.dao.newCriteria(User.class);
		return this.dao.findByCriteria(criteria, User.class);
	}
	
	public 	User login(String login, String password){
		Criteria criteria = this.dao.newCriteria(User.class);
		criteria.add(Restrictions.eq("login", login));
		criteria.add(Restrictions.eq("senha", CryptManager.passwordHash(password)));
		
		return (User) criteria.uniqueResult();
		
	}
}
