<%@page import="java.util.List"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="es.altair.bean.Pelicula"%>
<%@page import="es.altair.dao.PeliculaDAOImpleHibernate"%>
<%@page import="es.altair.dao.PeliculaDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Peliculas del Usuario</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">

<style>
body {background-color: #e3f2fd;}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

		<div class="collapse navbar-collapse" id="exCollapsingNavbar">
            <ul class="nav navbar-nav">
                <li class="nav-item"><a href="" class="nav-link">Bienvenido  <%=((Usuario)session.getAttribute("usuLogeado")).getNombre()%></a>
				</li>
				<li class="nav-item active"><a href="" class="nav-link">Principal Usuario</a></li>                
            </ul>
            
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
            	<li class="nav-item"><a class="nav-link" href="../CerrarSesion">Cerrar Sesion</a></li>
            </ul>                  
        </div>
        
	</nav>
	
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
			Usuario u = (Usuario) session.getAttribute("usuLogeado");
			if (session.getAttribute("usuLogeado") == null || session.isNew() || u.getTipo() != 0) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
				return;
			} else {
				PeliculaDAO pDAO = new PeliculaDAOImpleHibernate();
				List<Pelicula> peliculas = pDAO.listar((Usuario) session.getAttribute("usuLogeado"));
		%>

		<br/>
		<br/>
		<br/>
		<br/>

		<div class="row col-md-12 col-md-offset-2">
			<table class="table table-striped">
				<thead>
					<a href="anadirPelicula.jsp" class="btn btn-primary btn-xs pull-right"><b>+</b>
						Añadir Pelicula</a>
					<tr>
						<th>Título</th>
						<th>Director</th>
						<!-- <th>Codigo</th> -->
						<th>Portada</th>
						<th></th>
					</tr>
				</thead>
				<%
					for (Pelicula p : peliculas) {
				%>
				<tr>
					<td><%=p.getTitulo()%></td>
					<td><%=p.getDirector()%></td>
					<%-- <td><%=p.getCodigo()%></td> --%>
					<td><img alt="Portada"
						src="image.jsp?imag=<%=p.getIdPelicula()%>" class="img-thumbnail"
						width="120" height="150"></td>
					<td>
						<button type="button" class="btn btn-success"
							onclick="location.href='editarPelicula.jsp?uuid=<%=p.getUuid()%>'">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							Actualizar
						</button> <!-- Button trigger modal -->
						<button type="button" class="btn btn-danger" data-toggle="modal"
							data-target="#borrarPelicula<%=p.getIdPelicula()%>">
							<i class="fa fa-times" aria-hidden="true"></i> Borrar
						</button> <!-- Modal -->
						<div class="modal fade" id="borrarPelicula<%=p.getIdPelicula()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Borrar
											Pelicula</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										¿Desea borrar la pelicula
										<%=p.getTitulo()%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarPelicula?uuid=<%=p.getUuid()%>'">Sí</button>
									</div>
								</div>
							</div>
						</div>

					</td>
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