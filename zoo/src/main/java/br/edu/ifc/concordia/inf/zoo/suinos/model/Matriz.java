package br.edu.ifc.concordia.inf.zoo.suinos.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Matrizes")
@Table(name="Matrizes")

public class Matriz implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;	
	@Column(unique=true)
	private String Mossa;
	private String Tipo;
	private String Vigilancia;
	private String Raca;
	private String Origem;
	private String Cadastrador;
	private String Prox;
	private String Status;
	private int Porcos;
	
	public int getPorcos() {
		return Porcos;
	}
	public void setPorcos(int porcos) {
		Porcos = porcos;
	}
	public String getProx() {
		return Prox;
	}
	public void setProx(String prox) {
		Prox = prox;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMossa() {
		return Mossa;
	}
	public void setMossa(String mossa) {
		Mossa = mossa;
	}
	public String getTipo() {
		return Tipo;
	}
	public void setTipo(String tipo) {
		Tipo = tipo;
	}
	public String getVigilancia() {
		return Vigilancia;
	}
	public void setVigilancia(String vigilancia) {
		Vigilancia = vigilancia;
	}
	public String getRaca() {
		return Raca;
	}
	public void setRaca(String raca) {
		Raca = raca;
	}
	public String getOrigem() {
		return Origem;
	}
	public void setOrigem(String origem) {
		Origem = origem;
	}
	public String getCadastrador() {
		return Cadastrador;
	}
	public void setCadastrador(String cadastrador) {
		Cadastrador = cadastrador;
	}
	
	public void addPorcos(int number) {
		Porcos += number;
	}
	
	public void removePorcos(int number) {
		Porcos -= number;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
