package br.edu.ifc.concordia.inf.zoo.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Bovinos")
@Table(name="Bovinos")
public class Bovino implements Serializable  {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	
	private Boolean dis;
	private String sexo;
	@Column(unique = true)
	private String nc;
	private String raca;
	private String cr;
	private String variety;
	@Column(unique=true)
	private String name;
	@Column(unique=true)
	private String nb;
	private String dateOfBirth;
	private String mom;
	private String nrm;
	private String dad;
	private String nrp;
	private String status;
	private String cadastror;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getNc() {
		return nc;
	}
	public void setNc(String nc) {
		this.nc = nc;
	}
	public String getRaca() {
		return raca;
	}
	public void setRaca(String raca) {
		this.raca = raca;
	}
	public String getCr() {
		return cr;
	}
	public void setCr(String cr) {
		this.cr = cr;
	}
	public String getVariety() {
		return variety;
	}
	public void setVariety(String variety) {
		this.variety = variety;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNb() {
		return nb;
	}
	public void setNb(String nb) {
		this.nb = nb;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getMom() {
		return mom;
	}
	public void setMom(String mom) {
		this.mom = mom;
	}
	public String getNrm() {
		return nrm;
	}
	public void setNrm(String nrm) {
		this.nrm = nrm;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public String getNrp() {
		return nrp;
	}
	public void setNrp(String nrp) {
		this.nrp = nrp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCadastror() {
		return cadastror;
	}
	public void setCadastror(String cadastror) {
		this.cadastror = cadastror;
	}

	public Boolean getDis() {
		return dis;
	}
	public void setDis(boolean b) {
		this.dis = b;
	}
}
	
	
	