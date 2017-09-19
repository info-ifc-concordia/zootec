package br.edu.ifc.concordia.inf.zoo.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="produtions")
@Table(name="prodution")
public class Produtions implements Serializable{
	
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String type_animal;
	private double insumo1;
	private double insumo2;
	private double insumo3;
	private double insumo4;
	private double insumo5;
	private double insumo6;
	private double insumo7;
	private double insumo8;
	private double insumo9;
	private double insumo10;
	private double insumo11;
	private double insumo12;
	private double qtd_final;
	private String user;
	private String date;
	private String name_ration;
	private String disable;
	
	
	public String getType_animal() {
		return type_animal;
	}
	public void setType_animal(String type_animal) {
		this.type_animal = type_animal;
	}
	public double getInsumo1() {
		return insumo1;
	}
	public String getDisable() {
		return disable;
	}
	public void setDisable(String disable) {
		this.disable = disable;
	}
	public void setInsumo1(double insumo1) {
		this.insumo1 = insumo1;
	}
	public double getInsumo2() {
		return insumo2;
	}
	public void setInsumo2(double insumo2) {
		this.insumo2 = insumo2;
	}
	public double getInsumo3() {
		return insumo3;
	}
	public void setInsumo3(double insumo3) {
		this.insumo3 = insumo3;
	}
	public double getInsumo4() {
		return insumo4;
	}
	public void setInsumo4(double insumo4) {
		this.insumo4 = insumo4;
	}
	public double getInsumo5() {
		return insumo5;
	}
	public void setInsumo5(double insumo5) {
		this.insumo5 = insumo5;
	}
	public double getInsumo6() {
		return insumo6;
	}
	public void setInsumo6(double insumo6) {
		this.insumo6 = insumo6;
	}
	public double getInsumo7() {
		return insumo7;
	}
	public void setInsumo7(double insumo7) {
		this.insumo7 = insumo7;
	}
	public double getInsumo8() {
		return insumo8;
	}
	public void setInsumo8(double insumo8) {
		this.insumo8 = insumo8;
	}
	public double getInsumo9() {
		return insumo9;
	}
	public void setInsumo9(double insumo9) {
		this.insumo9 = insumo9;
	}
	public double getInsumo10() {
		return insumo10;
	}
	public void setInsumo10(double insumo10) {
		this.insumo10 = insumo10;
	}
	public double getInsumo11() {
		return insumo11;
	}
	public void setInsumo11(double insumo11) {
		this.insumo11 = insumo11;
	}
	public double getInsumo12() {
		return insumo12;
	}
	public void setInsumo12(double insumo12) {
		this.insumo12 = insumo12;
	}
	public double getQtd_final() {
		return qtd_final;
	}
	public void setQtd_final(double qtd_final) {
		this.qtd_final = qtd_final;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName_ration() {
		return name_ration;
	}
	public void setName_ration(String name_ration) {
		this.name_ration = name_ration;
	}

	
}
