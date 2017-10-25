package br.edu.ifc.concordia.inf.zoo.businessOfSuinos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.boilerplate.HibernateBusiness;
import br.edu.ifc.concordia.inf.zoo.UserSession;
import br.edu.ifc.concordia.inf.zoo.model.Produtions;
import br.edu.ifc.concordia.inf.zoo.suinos.SuinosController;
import br.edu.ifc.concordia.inf.zoo.suinos.model.Cobertura;
import br.edu.ifc.concordia.inf.zoo.suinos.model.Matriz;
import br.edu.ifc.concordia.inf.zoo.suinos.model.Nascimento;

public class SuinosBS extends HibernateBusiness {

	@Inject
	UserSession userSession;
	@Inject
	SuinosController controller;
	private Object result;
	private String ca;

	public void registrarMatriz(String Mossa, String Vigilancia, String Raca, String Origem) {

		Criteria criteria1 = dao.newCriteria(Matriz.class);
		criteria1.add(Restrictions.eq("Mossa", Mossa));
		Matriz MossaTest = (Matriz) criteria1.uniqueResult();

		if (MossaTest != null) {
			System.out.println("nome ja existe");
		} else {
			Matriz Matriz = new Matriz();
			Matriz.setMossa(Mossa);
			Matriz.setRaca(Raca);
			Matriz.setVigilancia(Vigilancia);
			Matriz.setOrigem(Origem);
			Matriz.setCadastrador(userSession.getUser().getNome());
			Matriz.setStatus("available");

			dao.persist(Matriz);
		}
	}

	public void registrarCobertura(String Mossa, String Data, String Cachaco, String Tipo) {
		Boolean tem = false;
		List<Cobertura> cober = this.listTypeCobertura();
		for (Cobertura co : cober) {
			if (co.getMossa().equals(Mossa) && co.getStatus().equals("available")) {
				tem = true;
			}
		}

		if (!tem) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date oi = null;
			try {
				oi = format.parse(Data);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			Calendar c = Calendar.getInstance();
			c.setTime(oi);

			String ano = Integer.toString(c.get(Calendar.YEAR));
			String mes = Integer.toString(c.get(Calendar.MONTH) + 1);
			String dia = Integer.toString(c.get(Calendar.DAY_OF_MONTH));

			String bonitin = dia + "/" + mes + "/" + ano;

			c.add(Calendar.DATE, 7);

			String ano2 = Integer.toString(c.get(Calendar.YEAR));
			String mes2 = Integer.toString(c.get(Calendar.MONTH) + 1);
			String dia2 = Integer.toString(c.get(Calendar.DAY_OF_MONTH));

			String bonitin2 = dia2 + "/" + mes2 + "/" + ano2;
			Cobertura Cobertura = new Cobertura();
			Cobertura.setMossa(Mossa);
			Cobertura.setData_cobertura(bonitin);
			Cobertura.setCachaco(Cachaco);
			Cobertura.setTipo(Tipo);
			Cobertura.setData_previsao(bonitin2);
			Cobertura.setStatus("available");

			this.setProxNascimento(Mossa, bonitin2);

			dao.persist(Cobertura);
			controller.confirmarRegistro(Cobertura);
		}
	}

	public void registrarNascimento(String Mossa, String Data, int Vivos, int Nati, int Mumi) {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date oi = null;
		try {
			oi = format.parse(Data);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar c = Calendar.getInstance();
		c.setTime(oi);

		int mortos = Nati + Mumi;
		int total = Vivos + Nati + Mumi;

		List<Cobertura> cober = this.listTypeCobertura();

		String cachaco = null;
		String data_cobertura = null;
		for (Cobertura co : cober) {
			if (co.getMossa().equals(Mossa) && co.getStatus().equals("available")) {
				cachaco = co.getCachaco();
				data_cobertura = co.getData_cobertura();
				String ano = Integer.toString(c.get(Calendar.YEAR));
				String mes = Integer.toString(c.get(Calendar.MONTH) + 1);
				String dia = Integer.toString(c.get(Calendar.DAY_OF_MONTH));

				String bonitin = dia + "/" + mes + "/" + ano;

				Nascimento Nascimento = new Nascimento();
				Nascimento.setMossa(Mossa);
				Nascimento.setVivos(Vivos);
				Nascimento.setNatimortos(Nati);
				Nascimento.setMumificados(Mumi);
				Nascimento.setTotal_mortos(mortos);
				Nascimento.setTotal(total);
				Nascimento.setCachaco(cachaco);
				Nascimento.setStatus("available");
				Nascimento.setData(bonitin);
				Nascimento.setData_cobertura(data_cobertura);

				dao.persist(Nascimento);
				this.disableCobertura(Mossa);
			}
		}

	}

	public List<Matriz> listTypeMossa() {
		Criteria criteria = this.dao.newCriteria(Matriz.class);
		return this.dao.findByCriteria(criteria, Matriz.class);
	}

	public List<Cobertura> listTypeCobertura() {
		Criteria criteria = this.dao.newCriteria(Cobertura.class);
		return this.dao.findByCriteria(criteria, Cobertura.class);
	}

	public List<Nascimento> listNascimento() {
		Criteria criteria = this.dao.newCriteria(Nascimento.class);
		return this.dao.findByCriteria(criteria, Nascimento.class);
	}

	public void disableCobertura(String mossa) {
		Criteria criteria = this.dao.newCriteria(Cobertura.class);
		criteria.add(Restrictions.eq("mossa", mossa));
		Cobertura cober = (Cobertura) criteria.uniqueResult();
		cober.setStatus("unavailable");
		dao.update(cober);
	}

	public void setProxNascimento(String mossa, String prox) {
		Criteria criteria = this.dao.newCriteria(Matriz.class);
		criteria.add(Restrictions.eq("Mossa", mossa));
		Matriz matriz = (Matriz) criteria.uniqueResult();
		matriz.setProx(prox);
		dao.update(matriz);
	}

	public void editarMatriz(String Tipo, String Origem, String Vigilancia, String Raca, String Mossa) {
		Criteria criteria = this.dao.newCriteria(Matriz.class);
		criteria.add(Restrictions.eq("Mossa", Mossa));
		Matriz matriz = (Matriz) criteria.uniqueResult();

		matriz.setOrigem(Origem);
		matriz.setRaca(Raca);
		matriz.setTipo(Tipo);
		matriz.setVigilancia(Vigilancia);

		dao.update(matriz);
	}
}
