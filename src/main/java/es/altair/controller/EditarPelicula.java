package es.altair.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import es.altair.bean.Usuario;
import es.altair.dao.PeliculaDAO;
import es.altair.dao.PeliculaDAOImpleHibernate;

/**
 * Servlet implementation class EditarPelicula
 */
@MultipartConfig
public class EditarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarPelicula() {
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
		
		String titulo = request.getParameter("titulo");
		String director = request.getParameter("director");
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String uuid = request.getParameter("uuid");
		
		// Tratamiento de la imagen
		Part filePart = request.getPart("portada");
		
		InputStream inputS = null;
		ByteArrayOutputStream os = null;
		if (!getFileName(filePart).equals("")) {
			inputS = filePart.getInputStream();
			
			// Escalar la imagen
			BufferedImage imageBuffer = ImageIO.read(inputS);
			Image tmp = imageBuffer.getScaledInstance(640, 640, BufferedImage.SCALE_FAST);
			BufferedImage buffered = new BufferedImage(640, 640, BufferedImage.TYPE_INT_RGB);
			buffered.getGraphics().drawImage(tmp, 0, 0, null);
			
			os = new ByteArrayOutputStream();
			ImageIO.write(buffered, "jpg", os);
		}
		
		HttpSession sesion = request.getSession();
		
		PeliculaDAO pDAO = new PeliculaDAOImpleHibernate();
		pDAO.actualizar(titulo, director, codigo, os, uuid, 
				((Usuario)sesion.getAttribute("usuLogeado")));
		
		response.sendRedirect("jsp/principalUsu.jsp");
	}
	
	private String getFileName(Part filePart) {
		for(String content : filePart.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename"))
				return content.substring(content.indexOf("=")+1).trim().replace("\"", "");
		}
		return null;
	}

}
