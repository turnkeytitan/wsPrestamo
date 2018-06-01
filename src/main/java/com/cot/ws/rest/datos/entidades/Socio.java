package com.cot.ws.rest.datos.entidades;

public class Socio {
	private String nombre;
	private float tasa;
	private int monto;
	
	public Socio() {
	}
	
	public Socio(String nombre, float tasa, int monto) {
		this.nombre = nombre;
		this.tasa = tasa;
		this.monto = monto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public float getTasa() {
		return tasa;
	}
	public void setTasa(float tasa) {
		this.tasa = tasa;
	}
	public int getMonto() {
		return monto;
	}
	public void setMonto(int monto) {
		this.monto = monto;
	}
}
