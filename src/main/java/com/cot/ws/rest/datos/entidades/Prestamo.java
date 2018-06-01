package com.cot.ws.rest.datos.entidades;

public class Prestamo {
	private int monto;
	private String socio;
	private int cuota;
	private int pago;
	private float tasa;
	
	public Prestamo() {
	}
	public Prestamo(int monto, String socio, int cuota, int pago, float tasa) {
		this.monto = monto;
		this.socio = socio;
		this.cuota = cuota;
		this.pago = pago;
		this.tasa = tasa;
	}
	public String getSocio() {
		return socio;
	}
	public void setSocio(String socio) {
		this.socio = socio;
	}
	public int getCuota() {
		return cuota;
	}
	public void setCuota(int cuota) {
		this.cuota = cuota;
	}
	public int getPago() {
		return pago;
	}
	public void setPago(int pago) {
		this.pago = pago;
	}
	public float getTasa() {
		return tasa;
	}
	public void setTasa(float tasa) {
		this.tasa = tasa;
	}
	public float getMonto() {
		return monto;
	}
	public void setMonto(int monto) {
		this.monto = monto;
	}
}
