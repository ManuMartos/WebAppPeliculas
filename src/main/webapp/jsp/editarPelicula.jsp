<%@page import="es.altair.bean.Pelicula"%>
<%@page import="es.altair.dao.PeliculaDAOImpleHibernate"%>
<%@page import="es.altair.dao.PeliculaDAO"%>
<%@page import="es.altair.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Pelicula</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">

<style>
body {background-color: #e3f2fd;}
</style>
</head>
<body>
</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

		<div class="collapse navbar-collapse" id="exCollapsingNavbar">
            <ul class="nav navbar-nav">
                <li class="nav-item"><a href="" class="nav-link">Bienvenido  <%=((Usuario)session.getAttribute("usuLogeado")).getNombre()%></a>
				</li>
				<li class="nav-item"><a href="principalUsu.jsp" class="nav-link">Principal Usuario</a></li>
				<li class="nav-item active"><a href="anadirPelicula.jsp" class="nav-link">Editar Pelicula</a></li>               
            </ul>
            
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
            	<li class="nav-item"><a class="nav-link" href="../CerrarSesion">Cerrar Sesion</a></li>
            </ul>                  
        </div>
        
	</nav>


	<div class="container">
		
		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesi�n");
			} else {
				PeliculaDAO pDAO = new PeliculaDAOImpleHibernate();
				Pelicula p = pDAO.obtenerPeliculaPorUUID(request.getParameter("uuid"));
		%>
		
		<br/>
		<br/>
		<br/>
		<br/>

		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="../EditarPelicula" method="post" role="form"
						enctype="multipart/form-data">
						<h3>Editar Pelicula</h3>
						<input type="hidden" name="uuid" id="uuid" value="<%=p.getUuid()%>">
						<div class="form-group">
							<label for="titulo">T�tulo</label> <input type="text"
								name="titulo" id="titulo" class="form-control"
								value="<%=p.getTitulo()%>">
						</div>
						<div class="form-group">
							<label for="director">Director</label> <input type="text" name="director"
								id="director" class="form-control" value="<%=p.getDirector()%>">
						</div>
						<div class="form-group">
							<label for="codigo">Codigo</label> <input type="number" name="codigo"
								id="codigo" class="form-control" value="<%=p.getCodigo()%>">
						</div>
						<div class="form-group">
								<img alt="Portada"
						src="image.jsp?imag=<%=p.getIdPelicula()%>" class="img-thumbnail"
						width="50" height="50">
								<input type="file"
								class="form-control" id="portada" name="portada">
						</div>
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary">
						</div>
					</form>
				</div>
			</div>
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