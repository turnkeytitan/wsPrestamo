package com.cot.ws.rest.commons.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
	private Connection conn;
	public Connection openConnection() {
		final String URL = "jdbc:mysql://localhost:8089/prestamo?useSSL=false";
		final String USER = "root";
		final String PASSWORD = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			System.out.println("No fue posible conectarse a la base de datos:\n"+e);
		}
		return conn;
	}
	public Connection closeConnection() {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println("Hubo un error al desconectarse de la base de datos:\n"+e);
		}
		return conn;
	}
}
