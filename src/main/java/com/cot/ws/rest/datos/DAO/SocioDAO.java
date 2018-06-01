package com.cot.ws.rest.datos.DAO;

import com.cot.ws.rest.commons.utils.Database;
import com.cot.ws.rest.datos.entidades.Socio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SocioDAO {
	private Database db = new Database();
	
	public ArrayList<Socio> getSociosByPrice(int price) {
		ArrayList<Socio> socio = null;
		try {
			socio = new ArrayList<Socio>();
			Connection con = db.openConnection();
			String sql = "select * from socio where monto_max>?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, price);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				socio.add(new Socio(rs.getString("nombre"), rs.getFloat("tasa"), rs.getInt("monto_max")));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return socio;
	}
}
