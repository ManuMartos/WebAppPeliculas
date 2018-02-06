package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.dao.PeliculaDAO;
import es.altair.dao.PeliculaDAOImpleHibernate;


/**
 * Servlet implementation class BorrarPelicula
 */
public class BorrarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarPelicula() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uuid = request.getParameter("uuid");
		
		PeliculaDAO pDAO = new PeliculaDAOImpleHibernate();
		pDAO.borrar(uuid);
		
		response.sendRedirect("jsp/principalUsu.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
