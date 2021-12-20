<%-- 
    Document   : FormServicioActualizar
    Created on : 11-dic-2021, 8:36:18
    Author     : Luifran
--%>

<%@page import="logica.Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Servicio"%>
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
            if(userName==null){
                response.sendRedirect("Login.jsp");
            }
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
                <div class="contenedor-form">
        <h1>Editar Servicio Turiístico</h1>
        <form action="SvServicioModificar" method="GET">
            <% 
                HttpSession misession = request.getSession();
                Servicio servicio = (Servicio)misession.getAttribute("servicio");
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
            %>
            <div class="col-md-8">
                <label for="id">Id:</label>
                <input type="text" class="form-control" name="id_servicio" value="<% out.print(servicio.getCodigo_servicio()); %>" required readonly ><br>
            </div>
            <div class="col-md-8">
                <label for="nombre" >Nombre:</label>
                <input type="text" class="form-control" name="nombre" value="<% out.print(servicio.getNombre_servicio()); %>" required><br>
            </div>
            <div class="col-md-8">
                <label for="descripcion" >Descripción:</label>
                <input type="text" class="form-control" name="descripcion" value="<% out.print(servicio.getDescripcion()); %>" required><br>
            </div>
            <div class="col-md-8">
                <label for="fecha" >Fecha de servicio:</label>
                <input type="date" class="form-control" name="fecha" value="<% try{ out.print(sf.format(servicio.getFecha_servicio())); }catch (Exception ex) {} %>" required><br>
            </div>
            <div class="col-md-8">
                <label for="costo" >Costo de servicio</label>
                <input type="number" class="form-control" name="costo" step="0.01" value="<% out.print(servicio.getCosto_servicio()); %>" required><br>
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
})(
            </script>
            
    </body>
</html>
