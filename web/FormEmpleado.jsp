<%-- 
    Document   : FormEmpleado
    Created on : 08-dic-2021, 17:20:42
    Author     : Luifran
--%>

<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="./Estilos/estilos.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sessionUsuario = request.getSession();
            String userName=null;
            userName=(String)sessionUsuario.getAttribute("usuario");
            Empleado empleado =(Empleado) sessionUsuario.getAttribute("empleado");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp">Turismo</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="FormClienteGestionar.jsp">Clientes</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Productos
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="FormServicioGestionar.jsp">Servicios Turísticos</a></li>
                      <li><a class="dropdown-item" href="FormPaqueteGestionar.jsp">Paquetes Turísticos</a></li>
                      <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                  </li>
                  <%if(userName != null){%>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><%out.print(empleado.getNombre_empleado());%></a> 
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="FormServicioGestionar.jsp">Mi información</a></li>
                      <li>
                          <form action="SvLogin" method="GET">
                            <button type="submit" class="dropdown-item">LogOut</button>
                          </form>
                      </li>
                    </ul>
                  </li>
                  <%}%>
                </ul>
              </div>
            </div>
        </nav>
                
        <div class="container-mg contenedor-form">
            <h1 style="text-align: center;">Registro de Empleado</h1><br>
            <form class="row needs-validation" novalidate action="SvEmpleado" method="POST">
                <div class="mb-3 row">
                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input name="nombre" type="text" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="apellido" class="col-sm-2 col-form-label">Apellido</label>
                    <div class="col-sm-10">
                        <input name="apellido" type="text" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="direccion" class="col-sm-2 col-form-label">Dirección</label>
                    <div class="col-sm-10">
                        <input name="direccion" type="text" class="form-control"required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="fecha_nac" class="col-sm-2 col-form-label">Fecha de nacimiento</label>
                    <div class="col-sm-10">
                        <input name="fecha_nac" type="date" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="dni" class="col-sm-2 col-form-label">DNI</label>
                    <div class="col-sm-10">
                        <input name="dni" type="text" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="nacionalidad" class="col-sm-2 col-form-label">Nacionalidad</label>
                    <div class="col-sm-10">
                        <input name="nacionalidad" type="text" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="celular" class="col-sm-2 col-form-label">Celular</label>
                    <div class="col-sm-10">
                        <input name="celular" type="text" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input name="email" type="email" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="usuario" class="col-sm-2 col-form-label">Nombre de usuario</label>
                    <div class="col-sm-10">
                        <input name="usuario" type="text" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="clave" class="col-sm-2 col-form-label">Contraseña</label>
                    <div class="col-sm-10">
                        <input name="clave" type="password" class="form-control" required><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="cargo" class="col-sm-2 col-form-label">Cargo</label>
                    <div class="col-sm-10">
                        <input name="cargo" type="text" class="form-control" required=""><br>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-2 col-form-label">Sueldo</label>
                    <div class="col-sm-10">
                        <input name="sueldo" type="number" step="0.01"  class="form-control" required><br>
                    </div>
                </div>
                
                <div style="text-align: center;">
                <button class="btn btn-dark" type="submit">Guardar</button>
                </div>
            </form>  
        </div>
        <%@include file="Footer.jsp" %>    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
        <script>
            (function () {
  'use strict'
  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
        </script>
    </body>
</html>
