package es.altair.dao;

import java.io.ByteArrayOutputStream;
import java.util.List;

import es.altair.bean.Pelicula;
import es.altair.bean.Usuario;

public interface PeliculaDAO {

	List<Pelicula> listar (Usuario u);
	
	List<Pelicula> listarTodo (Usuario u);

	void insertar(Pelicula p);
	
	byte[] obtenerPortadaPorId(int idPelicula);
	
	void actualizar(String titulo, String director, int codigo, ByteArrayOutputStream os, String uuid, Usuario usuario);
	
	Pelicula obtenerPeliculaPorUUID(String uuid);
	
	void borrar(String uuid);
}
