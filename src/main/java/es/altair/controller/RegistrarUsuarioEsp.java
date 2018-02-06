package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Usuario;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImpleHibernate;

/**
 * Servlet implementation class RegistrarUsuarioEsp
 */
public class RegistrarUsuarioEsp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarUsuarioEsp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		int tipo = Integer.parseInt(request.getParameter("tipo"));
		
		Usuario usu = new Usuario(login, password, nombre, email, tipo);
		
		UsuarioDAO uDAO = new UsuarioDAOImpleHibernate();
		
		int filas = 0;
		String msg = "";		
		
		if (uDAO.validarEmail(usu)) {
			filas = uDAO.insertar(usu);
			if (filas == 1) {
				msg = "Usuario Registrado";
				
				response.sendRedirect("jsp/principalEsp.jsp?mensaje="+msg);
			}
			else {
				msg = "Error al Registrar al Usuario";
				
				response.sendRedirect("jsp/principalEsp.jsp?mensaje="+msg);
			}
		} else {
			msg = "Email ya registrado. Intentelo con otro email";
			
			response.sendRedirect("jsp/principalEsp.jsp?mensaje="+msg);
		}
	}

}
