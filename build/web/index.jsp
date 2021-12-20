<%-- 
    Document   : index
    Created on : 08-dic-2021, 20:53:39
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
        <title>Inicio</title>
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
                    <a class="nav-link" href="FormClienteGestionar.jsp" >Clientes</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Productos
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="FormServicioGestionar.jsp">Servicios Turísticos</a></li>
                      <li><a class="dropdown-item" href="FormPaqueteGestionar.jsp">Paquetes Turísticos</a></li>
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

        <%
            
            if(userName == null){
        %>
        <div class="nosession">
            <div class="contenido-nosession">
            <h1>Agencia de Turismo</h1>
            <a href="Login.jsp" class="btn boton-simple">Login</a>
            <a href="FormEmpleado.jsp" class="btn boton-simple">Registrar Empleado</a>
            </div>
        </div>
        <% 
            }else{
        %>
        <div class="caja-negra">
            <h3>Agencia de Turismo</h3>
            <button class="btn boton-simple" onclick="mostrarVentas()" style="width: 8em;">Ventas</button>
            <button class="btn boton-simple" onclick="mostrarProductos()" style="width: 8em;">Productos</button>
            <button class="btn boton-simple" onclick="mostrarClientes()" style="width: 8em;">Clientes</button>
            <button class="btn boton-simple" onclick="mostrarEmpleados()" style="width: 8em;">Empleados</button>
        </div>
        <div class="contenedor">
            <div id="ventas">
                <h3>Ventas</h3>
                <a class="btn boton-dark" href="FormVenta.jsp">Nueva Venta</a><br>
                <a class="btn boton-dark" href="FormVentaGestionar.jsp">Gestionar Ventas</a>
            </div>
            <div id="productos" hidden>
                <h3>Productos</h3>
                <div id="servicios">
                    <a class="btn boton-dark" href="FormServicio.jsp">Agregar Servicio</a>
                    <a class="btn boton-dark" href="FormServicioGestionar.jsp">Gestionar Servicios</a>
                </div>
                <div id="paquetes">
                    <a class="btn boton-dark" href="FormPaquete.jsp">Agregar Paquetes turísticos</a>
                    <a class="btn boton-dark" href="FormPaqueteGestionar.jsp">Gestionar Paquetes turísticos</a>
                </div>
            </div>
            <div id="clientes" hidden>
                <h3>Clientes</h3>
                <a class="btn boton-dark" href="FormCliente.jsp">Agregar Cliente</a>
                <a class="btn boton-dark" href="FormClienteGestionar.jsp">Gestionar Cliente</a>
            </div>
            <div id="empleados" hidden>
                <h3>Empleados</h3>
                <a class="btn boton-dark" href="FormEmpleado.jsp">Agregar empleado</a>
                <a class="btn boton-dark" href="FormEmpleado.jsp">Agregar empleado</a>
            </div>
        </div>
      
        <% } %>
        <%@include file="Footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script>
            function mostrarProductos(){
                var productos=document.getElementById("productos");
                var clientes=document.getElementById("clientes");
                var empleados=document.getElementById("empleados");
                var ventas = document.getElementById("ventas");
                
                productos.removeAttribute("hidden");
                clientes.setAttribute("hidden","true");
                empleados.setAttribute("hidden","true");
                ventas.setAttribute("hidden","true");
            }
            function mostrarVentas(){
                var productos=document.getElementById("productos");
                var clientes=document.getElementById("clientes");
                var empleados=document.getElementById("empleados");
                var ventas = document.getElementById("ventas");
                
                ventas.removeAttribute("hidden");
                clientes.setAttribute("hidden","true");
                empleados.setAttribute("hidden","true");
                productos.setAttribute("hidden","true");
            }
            function mostrarClientes(){
                var productos=document.getElementById("productos");
                var clientes=document.getElementById("clientes");
                var empleados=document.getElementById("empleados");
                var ventas = document.getElementById("ventas");
                
                clientes.removeAttribute("hidden");
                productos.setAttribute("hidden","true");
                empleados.setAttribute("hidden","true");
                ventas.setAttribute("hidden","true");
            }
            function mostrarEmpleados(){
                var productos=document.getElementById("productos");
                var clientes=document.getElementById("clientes");
                var empleados=document.getElementById("empleados");
                var ventas = document.getElementById("ventas");
                
                empleados.removeAttribute("hidden");
                clientes.setAttribute("hidden","true");
                productos.setAttribute("hidden","true");
                ventas.setAttribute("hidden","true");
            }
            
        </script>
    </body>
</html>
