package br.edu.ifc.concordia.inf.zoo.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.boilerplate.AbstractController;
import br.com.caelum.vraptor.boilerplate.NoCache;
import br.com.caelum.vraptor.boilerplate.util.GeneralUtils;
import br.edu.ifc.concordia.inf.zoo.business.BovinosBS;
import br.edu.ifc.concordia.inf.zoo.model.Bovino;

@Controller
public class IndexBovinoController extends AbstractController{
	
	@Inject private BovinosBS bovinobs;

	/*@Get(value="/students/list")
	@NoCache
	public void BovinoList(List<Bovino> students, String filter) {
		if (!GeneralUtils.isEmpty(students)) {
			this.result.include("students", students);
		}
		if (!GeneralUtils.isEmpty(filter)) {
			this.result.include("filter", filter);
		}
	}

	@Get(value="/")
	@NoCache
	public void BovinoProfile(String Name) {
		if (Name == null) {
			this.result.notFound();
		} else {
			Student student = this.sbs.exists(registration, Student.class);
			if (student == null) {
				this.result.notFound();
			}else {
				this.result.include("student", student);
			}
		}
	}
	
	@Post(value = "/")
	public void doSearch(String filter) {
		List<Bovino> bovinolist =  bovinobs.Buscar(filter);
		if (bovinolist.size() == 1) {
			this.result.redirectTo(this).BovinoProfile(bovinolist.get(0).getName());
		}else {
			this.result.redirectTo(this).BovinoList(bovinolist,filter);
		}
	}*/
}
