package es.altair.dao;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Pelicula;
import es.altair.bean.Usuario;
import es.altair.util.SessionProvider;

public class PeliculaDAOImpleHibernate implements PeliculaDAO {

	public List<Pelicula> listar(Usuario u) {
		
		List<Pelicula> peliculas = new ArrayList<Pelicula>();

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			peliculas = sesion.createQuery("FROM Pelicula p WHERE usuario=:usu").setParameter("usu", u).list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return peliculas;
	}

	public void insertar(Pelicula p) {
		
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			sesion.save(p);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public byte[] obtenerPortadaPorId(int idPelicula) {
		
		byte[] imagen = null;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			imagen = (byte[]) sesion.createQuery("Select p.portada From Pelicula p Where p.idPelicula=:id")
					.setParameter("id", idPelicula).uniqueResult();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return imagen;
	}

	public void actualizar(String titulo, String director, int codigo, ByteArrayOutputStream os, String uuid,
			Usuario usuario) {
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			if (os != null) {
				sesion.createQuery("UPDATE Pelicula SET titulo=:t, director=:d, codigo=:c, " 
						+ "portada=:p WHERE uuid=:clave")
						.setParameter("t", titulo)
						.setParameter("d", director)
						.setParameter("c", codigo)
						.setParameter("p", os.toByteArray())
						.setParameter("clave", uuid)
						.executeUpdate();
			} else {
				sesion.createQuery("UPDATE Pelicula SET titulo=:t, director=:d, codigo=:c, " 
						+ " WHERE uuid=:clave")
						.setParameter("t", titulo)
						.setParameter("d", director)
						.setParameter("c", codigo)
						.setParameter("clave", uuid)
						.executeUpdate();
			}

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public Pelicula obtenerPeliculaPorUUID(String uuid) {
		
		Pelicula p = new Pelicula();

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			p = (Pelicula) sesion.createQuery("FROM Pelicula p WHERE p.uuid=:clave").setParameter("clave", uuid)
					.uniqueResult();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		return p;
	}

	public void borrar(String uuid) {
		
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			sesion.createQuery("DELETE FROM Pelicula WHERE uuid=:clave").setParameter("clave", uuid).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public List<Pelicula> listarTodo(Usuario u) {
		
		List<Pelicula> peliculas = new ArrayList<Pelicula>();

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			peliculas = sesion.createQuery("FROM Pelicula").list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return peliculas;
	}

}
