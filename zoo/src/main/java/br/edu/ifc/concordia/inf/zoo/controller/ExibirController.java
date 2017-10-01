package br.edu.ifc.concordia.inf.zoo.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.boilerplate.AbstractController;

@Controller
public class ExibirController extends AbstractController {
	
	@Get(value="/show/{id}")
	public void exibicao() {
	}
}