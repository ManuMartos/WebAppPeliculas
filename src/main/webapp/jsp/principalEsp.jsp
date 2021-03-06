<%@page import="es.altair.dao.UsuarioDAOImpleHibernate"%>
<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.bean.Pelicula"%>
<%@page import="es.altair.dao.PeliculaDAOImpleHibernate"%>
<%@page import="es.altair.dao.PeliculaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina Usuario Especial</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">

<style>
body {background-color: #e3f2fd;}

nav {background-color: #2545E6;}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-md  navbar-light">

		<div class="collapse navbar-collapse" id="exCollapsingNavbar">
            <ul class="nav navbar-nav">
                <li class="nav-item"><a href="" class="nav-link">Bienvenido  <%=((Usuario)session.getAttribute("usuLogeado")).getNombre()%></a>
				</li>
				<li class="nav-item active"><a href="" class="nav-link">Principal Usu Especial</a></li>                
            </ul>
            
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
            	<li class="nav-item"><a class="nav-link" href="../CerrarSesion">Cerrar Sesion</a></li>
            </ul>                  
        </div>
        
	</nav>
	
		<br/>
		<br/>
	
	<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<%
					String error = request.getParameter("mensaje");
					if (error != null) {
				%>
				<div class="alert alert-warning alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">x</button>
					<strong>Info!</strong>
					<%=error%>
				</div>
				<%
					}
				%>
			</div>
		</div>
		
		
	
	<div class="container">
	
		<%
		if (session.getAttribute("usuLogeado") == null || session.isNew()) {
			response.sendRedirect("../index.jsp?mensaje=Inicie sesion");
		} else {
			UsuarioDAO uDAO = new UsuarioDAOImpleHibernate();
			List<Usuario> usuarios = uDAO.listar((Usuario) session.getAttribute("usuLogeado")); %>
		
		<br/>
		<br/>
		
		<div class="row col-md-12 col-md-offset-2">
			<table class="table table-striped">
				<thead>
					<a href="anadirUsuarioEsp.jsp" class="btn btn-success btn-xs pull-right"><b>+</b>
						A�adir Usuario</a>
					<!-- <a href="" class="btn btn-success btn-xs pull-right">
						Actualizar Usuario</a> -->
					<tr>
						<th>Id</th>
						<th>Login</th>
						<th>Nombre</th>
						<th>Email</th>
						<th>Tipo</th>
						<th></th>
					</tr>
				</thead>
				<%
					for (Usuario u : usuarios) {
				%>
				<tr>
					<td><%=u.getIdUsuario()%></td>
					<td><%=u.getLogin()%></td>
					<td><%=u.getNombre()%></td>
					<td><%=u.getEmail()%></td>
					<td><%=u.getTipo()%></td>
					
				</tr>
				<%
					}
				%>
			</table>
		</div>
		
		<br/>
		<br/>
		<br/>		
		<%
			}
		%>	
		
		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesi�n");
			} else {
				PeliculaDAO pDAO = new PeliculaDAOImpleHibernate();
				List<Pelicula> peliculas = pDAO.listarTodo((Usuario) session.getAttribute("usuLogeado"));
		%>
		
		<div class="row col-md-12 col-md-offset-2">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>T�tulo</th>
						<th>Director</th>
						<th>Codigo</th>
						<th>Portada</th>
						<th>Usuario</th>
					</tr>
				</thead>
				<%
					for (Pelicula p : peliculas) {
				%>
				<tr>
					<td><%=p.getTitulo()%></td>
					<td><%=p.getDirector()%></td>
					<td><%=p.getCodigo()%></td>
					<td><img alt="Portada"
						src="image.jsp?imag=<%=p.getIdPelicula()%>" class="img-thumbnail"
						width="120" height="150"></td>
					<!-- <td></td> -->
					<td><%=p.getUsuario().getIdUsuario()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<%
			}
		%>	
	
	</div>

<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>