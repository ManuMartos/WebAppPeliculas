<%@page import="es.altair.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Añadir Usuario</title>
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
				<li class="nav-item"><a href="principalAdmin.jsp" class="nav-link">Principal Administrador</a></li>
				<li class="nav-item active"><a href="" class="nav-link">Registro Usuario</a></li>              
            </ul>
            
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
            	<li class="nav-item"><a class="nav-link" href="../CerrarSesion">Cerrar Sesion</a></li>
            </ul>                  
        </div>
        
	</nav>


	<div class="container">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				
		%>
		
		<br/>
		<br/>
		<br/>
		<br/>

		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="../RegistrarUsuarioAdmin" class="form-horizontal" method="post">
                                <div class="form-group">
                                	<label>Login</label>
                                	<input type="text" id="login" name="login" placeholder="Login" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                	<label>Password</label>
                                    <input type="password" id="password" name="password" placeholder="Password" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                <label>Nombre</label>
                                    <input type="text" id="nombre" name="nombre" placeholder="Nombre" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                <label>Email</label>
                                    <input type="email" id="email" name="email" placeholder="Email" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                <label>Tipo de Usuario</label>
                                <ul>
                                    	<li>Puede ser tipo:</li>
                                    	<li>0 para el un usuario normal</li>
                                    	<li>1 para un usuario administrador</li>
                                    	<li>2 para un usuario especial</li>
                                </ul>
                                    <input type="tipo" id="tipo" name="tipo" placeholder="Tipo" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">
										<i class="fa fa-sign-in"></i> Registrar
									</button>
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