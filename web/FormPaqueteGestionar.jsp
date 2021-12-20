<%@page import="logica.Controladora"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Paquete"%>
<%@page import="java.util.List"%>
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
                
        <div class="contenedor-tabla">
        <h1>Paquetes Turísticos</h1>
        <a class="btn btn-dark" href="FormPaquete.jsp">Agregar Paquete turístico</a><br><br>
        <%
            List<Paquete>listaPaquetes = new ArrayList<>();
            Controladora controlPaquete = new Controladora();
            listaPaquetes = controlPaquete.consultarPaquetes();
        %>
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <td>Codigo</td>
                    <td>Servicios</td>
                    <td>Costo</td>
                    <td>Acción</td>
                </tr>
            </thead>
            <tbody>
                <%
                    for(Paquete paquete:listaPaquetes){
                        
                    
                %>
                <tr style="border:2px; vertical-align: middle;">
                    <td><% out.print(paquete.getCodigo_paquete()); %></td>
                    <td>
                        <% 
                            List<Servicio>listaServicios = paquete.getServicios();
                            for(Servicio serv:listaServicios){
                                out.print(serv.getNombre_servicio()+"<br>");
                            } 
                        %>
                    </td>
                    <td>$<% out.print(Math.round(paquete.getCosto_paquete()*100.0)/100.0); %></td>
                    <td>
                        
                        <form class="btn"action="SvPaqueteModificar" method="POST">
                            <input class="btn btn-dark" type="hidden" name="paquete" value="<% out.print(paquete.getCodigo_paquete()); %>">
                            <button class="btn btn-dark" type="submit">Editar</button>
                        </form>
                        <form class="btn" action="SvPaqueteEliminar" method="POST">
                            <input type="hidden" name="paquete" value="<% out.print(paquete.getCodigo_paquete()); %>">
                            <button class="btn btn-dark" type="submit">Eliminar</button>
                        </form>
                        
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </div>
            <%@include file="Footer.jsp" %>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
