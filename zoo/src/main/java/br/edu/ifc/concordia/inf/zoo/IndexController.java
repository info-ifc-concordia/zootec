package br.edu.ifc.concordia.inf.zoo;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.edu.ifc.concordia.inf.zoo.abstractions.AbstractController;
import br.edu.ifc.concordia.inf.zoo.business.UserBS;
import br.edu.ifc.concordia.inf.zoo.model.User;
import br.edu.ifc.concordia.inf.zoo.permission.Permission;

@Controller
public class IndexController extends AbstractController {
	
	@Inject private UserBS userBS;
	
	@Path(value="/", priority=Path.HIGHEST)
	@NoCache
	@Permission
	public void index() {
		try {
			List<User> users = this.userBS.listUsers();
			this.result.include("users", users);
		} catch (Throwable ex) {
			LOGGER.error(ex);
			this.result.include("users", Collections.EMPTY_LIST);
		}
	}
}
