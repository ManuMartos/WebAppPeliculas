<%@page import="es.altair.dao.PeliculaDAO"%><%@page import="java.io.OutputStream"%><%@page import="es.altair.dao.PeliculaDAOImpleHibernate"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%
try {
	String idLibro = request.getParameter("imag");
	PeliculaDAO pDAO = new PeliculaDAOImpleHibernate();
	byte[] imagen = pDAO.obtenerPortadaPorId(Integer.parseInt(idLibro));
	try {
		if (imagen != null) {
			response.setContentType("image/jpeg");
			response.setHeader("Content-Disposition", "attachment");
			OutputStream o = response.getOutputStream();
			o.write(imagen);
			o.flush();
			o.close();
			return;
		}
} catch (IllegalStateException e) {}
} catch (Exception e) {}
%>