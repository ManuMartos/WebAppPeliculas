package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import es.altair.bean.Usuario;
import es.altair.util.SessionProvider;

public class UsuarioDAOImpleHibernate implements UsuarioDAO {
	
	private String pass = "Libros123$%";

	public Usuario comprobarUsuario(String login, String password) {
		
		Usuario usu = null;


		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usu = (Usuario) sesion
					.createQuery(
							"SELECT u FROM Usuario u WHERE login=:l " + "AND password=AES_ENCRYPT(:p, :passphrase)")
					.setParameter("l", login).setParameter("p", password).setParameter("passphrase", pass)
					.uniqueResult();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return usu;
	}

	public int insertar(Usuario usu) {
		
		int filas = 0;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

					
			if (usu.getTipo() > 2) {
				usu.setTipo(0);
			}else if (usu.getTipo() < 0) {
				usu.setTipo(0);
			}
			
			filas = sesion
					.createSQLQuery("INSERT INTO usuarios (login, password, nombre, email, tipo)"
							+ "values (:l, AES_ENCRYPT(:p, :passphrase), :n, :e, :t)")
					.setParameter("l", usu.getLogin()).setParameter("p", usu.getPassword())
					.setParameter("passphrase", pass).setParameter("n", usu.getNombre())
					.setParameter("e", usu.getEmail()).setParameter("t", usu.getTipo()).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		return filas;
	}

	public boolean validarEmail(Usuario usu) {
		
		boolean correcto = true;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			if ((Usuario) sesion.createQuery("From Usuario Where email=:e")
					.setParameter("e", usu.getEmail())
					.uniqueResult() != null)
				correcto = false;

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return correcto;
	}

	public List<Usuario> listar(Usuario u) {
		
		List<Usuario> usuarios = new ArrayList<Usuario>();

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usuarios = sesion.createQuery("FROM Usuario").list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return usuarios;
	}

	public void borrar(int idUsuario) {
		
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			sesion.createQuery("DELETE FROM Usuario WHERE idUsuario=:clave").setParameter("clave", idUsuario).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public List<Usuario> listarUsu(Usuario u) {
		
		String email = "";
		
		List<Usuario> usuarios = new ArrayList<Usuario>();

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usuarios = sesion.createQuery("FROM Usuario WHERE email").list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return usuarios;
	}

	

}
