package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.altair.bean.Usuario;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImpleHibernate;

/**
 * Servlet implementation class EditarUsuarioo
 */
public class EditarUsuarioo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuarioo() {
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
		
		/*int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));*/
        String login = request.getParameter("login");
        String password =request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        Integer tipo = Integer.parseInt(request.getParameter("tipoo"));
        /*Integer.parseInt(request.getParameter("tipo"));*/
        
        UsuarioDAO uDAO = new UsuarioDAOImpleHibernate();
        uDAO.Editar(login,password,nombre,email,tipo);
        
		
		response.sendRedirect("jsp/principalAdmin.jsp");
	}

}
