<html>
<head>
<title>Web App Peliculas</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="fonts/font-awesome.min.css">

<link rel="stylesheet" href="css/propioIndex.css">

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
                <li class="nav-item"><a href="#" class="nav-link">Web Peliculas</a></li>
                
            </ul>
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
                <li class="nav-item order-2 order-md-1">
                <li class="dropdown order-1">
                    <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-outline-secondary dropdown-toggle">Login <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-menu-right mt-1">
                      <li class="p-3">
                            <form role="form" method="POST" action="ValidarUsuario">
                                <div class="form-group">
                                	<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" autofocus required="required">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="required">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">
										<i class="fa fa-sign-in"></i> Enviar
									</button>
                                </div>
                                
                            </form>
                        </li>
                    </ul>
                </li>
                
                <!-- Registrar -->
                
                <li class="dropdown order-2">
                    <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-outline-secondary dropdown-toggle">Registrar <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-menu-right mt-1">
                      <li class="p-3">
                            <form action="RegistrarUsuario" class="form-horizontal" method="post">
                                <div class="form-group">
                                	<input type="text" id="login" name="login" placeholder="Login" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" id="password" name="password" placeholder="Password" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" id="nombre" name="nombre" placeholder="Nombre" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" id="email" name="email" placeholder="Email" class="form-control input-md" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">
										<i class="fa fa-sign-in"></i> Registrar
									</button>
                                </div>
                                
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
            
        </div>
	</nav>
	<br/>
	<br/>
	<br/>
	<br/>
	<div class="container">
	
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
	</div>
	
	<!-- Contenedor -->
	<div class="pricing-wrapper clearfix">
		<!-- Titulo -->
		<h1 class="pricing-table-title">Peliculas de Estreno</h1>

		<div class="pricing-table">
			<h3 class="pricing-title">El corredor del Laberinto</h3>
			<!-- Lista de Caracteristicas / Propiedades -->
			<ul class="table-list">
				<li><img src="images/cartel-de-el-corredor-del-laberinto-3.jpg" width="250px" height="350px"></li>
				<li>Codigo: <span> 35781</span></li>
			</ul>
		</div>
		
		<div class="pricing-table recommended">
			<h3 class="pricing-title">El Cuaderno de Sara</h3>
			<!-- Lista de Caracteristicas / Propiedades -->
			<ul class="table-list">
				<li><img src="images/el_cuaderno_de_sara-607798944-large.jpg" width="250px" height="350px"></li>
				<li>Codigo: <span> 35523</span></li>
			</ul>
		</div>

		<div class="pricing-table">
			<h3 class="pricing-title">El Gran Showman</h3>
			<!-- Lista de Caracteristicas / Propiedades -->
			<ul class="table-list">
				<li><img src="images/elgranshowman.jpg" width="250px" height="350px"></li>
				<li>Codigo: <span> 44123</span></li>
			</ul>
		</div>

		<div class="pricing-table recommended">
			<h3 class="pricing-title">Thor: Ragnarok</h3>
			<!-- Lista de Caracteristicas / Propiedades -->
			<ul class="table-list">
				<li><img src="images/thor.jpg" width="250px" height="350px"></li>
				<li>Codigo: <span> 67367</span></li>
			</ul>
		</div>
		
		<div class="pricing-table">
			<h3 class="pricing-title">It</h3>
			<!-- Lista de Caracteristicas / Propiedades -->
			<ul class="table-list">
				<li><img src="images/it.jpg" width="250px" height="350px"></li>
				<li>Codigo: <span> 12390</span></li>
			</ul>
		</div>
		
		<div class="pricing-table recommended">
			<h3 class="pricing-title">La Momia</h3>
			<!-- Lista de Caracteristicas / Propiedades -->
			<ul class="table-list">
				<li><img src="images/momia.jpg" width="250px" height="350px"></li>
				<li>Codigo: <span> 67367</span></li>
			</ul>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
