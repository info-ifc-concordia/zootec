package br.edu.ifc.concordia.inf.zoo.suinos.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Porcos")
@Table(name="Porcos")

public class Porco implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String matriz;
	private Long nascimento;
	
	public Long getNascimento() {
		return nascimento;
	}
	public void setNascimento(Long long1) {
		this.nascimento = long1;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMatriz() {
		return matriz;
	}
	public void setMatriz(String matriz) {
		this.matriz = matriz;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
