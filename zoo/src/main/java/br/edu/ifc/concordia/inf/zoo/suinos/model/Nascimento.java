package br.edu.ifc.concordia.inf.zoo.suinos.model;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity(name="Nascimentos")
@Table(name="Nascimentos")

public class Nascimento implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String mossa;
	private String data_cobertura;
	private String data;
	private String cachaco;
	
	private int vivos;
	private int natimortos;
	private int mumificados;
	private int total_mortos;
	private int total;
	
	private String status;
	
	public String getData_cobertura() {
		return data_cobertura;
	}
	public void setData_cobertura(String data_cobertura) {
		this.data_cobertura = data_cobertura;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getTotal_mortos() {
		return total_mortos;
	}
	public void setTotal_mortos(int total_mortos) {
		this.total_mortos = total_mortos;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMossa() {
		return mossa;
	}
	public void setMossa(String mossa) {
		this.mossa = mossa;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getCachaco() {
		return cachaco;
	}
	public void setCachaco(String cachaco) {
		this.cachaco = cachaco;
	}
	public int getVivos() {
		return vivos;
	}
	public void setVivos(int vivos) {
		this.vivos = vivos;
	}
	public int getNatimortos() {
		return natimortos;
	}
	public void setNatimortos(int natimortos) {
		this.natimortos = natimortos;
	}
	public int getMumificados() {
		return mumificados;
	}
	public void setMumificados(int mumificados) {
		this.mumificados = mumificados;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
