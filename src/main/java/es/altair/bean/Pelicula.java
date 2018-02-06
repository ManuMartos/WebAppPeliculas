package es.altair.bean;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

@Entity
@Table(name="peliculas")
public class Pelicula implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPelicula;
	private String titulo;
	private String director;
	private int codigo;
	private byte[] portada;
	private String uuid;
	
	
	@ManyToOne
	@JoinColumn(name="idUsuario")
	private Usuario usuario;
	
	public Pelicula() {
		// TODO Auto-generated constructor stub
	}

	

	public Pelicula(String titulo, String director, int codigo, byte[] portada, String uuid,
			Usuario usuario) {
		super();
		this.titulo = titulo;
		this.director = director;
		this.codigo = codigo;
		this.portada = portada;
		this.uuid = uuid;
		this.usuario = usuario;
	}


	public int getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public byte[] getPortada() {
		return portada;
	}

	public void setPortada(byte[] portada) {
		this.portada = portada;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}



	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}



	@Override
	public String toString() {
		return "Pelicula [idPelicula=" + idPelicula + ", titulo=" + titulo + ", director=" + director + ", codigo="
				+ codigo + ", portada=" + Arrays.toString(portada) + ", uuid=" + uuid + ", usuario=" + usuario + "]";
	}
	
}
