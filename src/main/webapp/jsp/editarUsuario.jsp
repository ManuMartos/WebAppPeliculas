<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="es.altair.dao.UsuarioDAOImpleHibernate"%>
<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Usuario</title>

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
				<li class="nav-item"><a href="principalAdmin.jsp" class="nav-link">Principal Administrador</a></li> 
				<li class="nav-item active"><a href="" class="nav-link">Editar Usuario</a></li>               
            </ul>
            
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
            	<li class="nav-item"><a class="nav-link" href="../CerrarSesion">Cerrar Sesion</a></li>
            </ul>                  
        </div>
        
	</nav>


	<div class="container">
		
		<%
		if (session.getAttribute("usuLogeado") == null || session.isNew()) {
			response.sendRedirect("../index.jsp?mensaje=Inicie sesion");
		} else {
			UsuarioDAO uDAO = new UsuarioDAOImpleHibernate();
			Usuario usuarios = uDAO.obtenerPorId(Integer.parseInt(request.getParameter("idUsuario"))); %>
		
		

		<br/>
		<br/>
		<br/>
		<br/>

		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="../EditarUsuarioo" method="post" role="form"
						enctype="multipart/form-data">
						<h3>Editar Usuario</h3>
						<input type="hidden" name="idUsuario" id="idUsuario" value="<%=usuarios.getIdUsuario()%>">
						<div class="form-group">
							<label for="login">Login</label> <input type="text"
								name="login" id="login" class="form-control"
								value="<%=usuarios.getLogin()%>">
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password" name="password"
								id="password" class="form-control" value="">
						</div>
						<div class="form-group">
							<label for="nombre">Nombre</label> <input type="text" name="nombre"
								id="nombre" class="form-control" value="<%=usuarios.getNombre()%>">
						</div>
						
						<div class="form-group">
							<label for="email">Email</label> <input type="text" name="email"
								id="email" class="form-control" value="<%=usuarios.getEmail()%>">
						</div>
						
						<div class="form-group">
							<label for="tipo">Tipo</label> <input type="number" name="tipoo"
								id="tipo" class="form-control" value="<%=usuarios.getTipo()%>">
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