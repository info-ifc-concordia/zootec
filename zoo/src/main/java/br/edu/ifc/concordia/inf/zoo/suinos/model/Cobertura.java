package br.edu.ifc.concordia.inf.zoo.suinos.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Coberturas")
@Table(name="Coberturas")
public class Cobertura implements Serializable {
	
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String mossa;
	private String data_cobertura;
	private String data_previsao;
	private String tipo;
	private String cachaco;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getData_cobertura() {
		return data_cobertura;
	}
	public void setData_cobertura(String data_cobertura) {
		this.data_cobertura = data_cobertura;
	}
	public String getData_previsao() {
		return data_previsao;
	}
	public void setData_previsao(String data_previsao) {
		this.data_previsao = data_previsao;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getCachaco() {
		return cachaco;
	}
	public void setCachaco(String cachaco) {
		this.cachaco = cachaco;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
}
