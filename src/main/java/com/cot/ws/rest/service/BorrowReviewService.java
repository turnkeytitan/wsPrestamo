package com.cot.ws.rest.service;

import com.cot.ws.rest.datos.DAO.SocioDAO;
import com.cot.ws.rest.datos.entidades.AgentsData;
import com.cot.ws.rest.datos.entidades.Prestamo;
import com.cot.ws.rest.datos.entidades.Socio;

import java.util.ArrayList;
import java.util.Iterator;

import javax.sound.midi.Soundbank;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/prestamo")
public class BorrowReviewService {
	
	@POST
	@Path("/validar")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	public Prestamo borrowAnalisys(AgentsData ad) {
		Prestamo p = null;
		ArrayList<Socio> socio;
		SocioDAO soc = new SocioDAO();
		int montobase = Integer.parseInt(ad.getAmount());
		socio = soc.getSociosByPrice(montobase);
		
		for (Iterator s = socio.iterator(); s.hasNext();) {
			Socio socio2 = (Socio) s.next();
			int cuota = (int) (montobase*socio2.getTasa()*0.01 + montobase/36);
			int pago= cuota * 36;
			if (p==null) {
				p = new Prestamo(montobase, socio2.getNombre(), cuota, pago, socio2.getTasa());
			}
			if (p.getTasa()>socio2.getTasa()) {
				p = new Prestamo(montobase, socio2.getNombre(), cuota, pago, socio2.getTasa());
			}
		}
		return p;
	}
}
