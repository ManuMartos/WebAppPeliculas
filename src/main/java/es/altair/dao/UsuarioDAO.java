package es.altair.dao;

import java.io.ByteArrayOutputStream;
import java.util.List;
import es.altair.bean.Usuario;

public interface UsuarioDAO {

	Usuario comprobarUsuario(String login, String password);
	
	int insertar(Usuario usu);

	boolean validarEmail(Usuario usu);
	
	List<Usuario> listar (Usuario u);
	
	void borrar(int idUsuario);
	
	Usuario listarUsu(Usuario u);
	
	void Editar(String login, String password, String nombre, String email, int tipo);
	
	Usuario obtenerPorId(int id);
}
