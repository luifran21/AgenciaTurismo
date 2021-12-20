<%-- 
    Document   : FormVentaGestionar
    Created on : 13-dic-2021, 8:33:55
    Author     : Luifran
--%>

<%@page import="logica.Paquete"%>
<%@page import="logica.Venta"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.ControladoraPersistencia"%>
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
        <h1>Lista de Ventas realizadas</h1>
        <a class="btn btn-dark" href="FormVenta.jsp">Nueva Venta</a><br><br>
        <table class="table">
            <thead class="table-dark">
                <tr>
            <td>Numero de Venta</td>
            <td>Fecha de venta</td>
            <td>Cliente</td>
            <td><a href="FormServicioGestionar.jsp">Id Servicio</a></td>
            <td><a href="FormPaqueteGestionar.jsp">Id Paquete</a></td>
            <td>Monto Total</td>
            <td>Medio de Pago</td>
            <td>Empleado</td>
            <td>Acción</td></tr>
            </thead>
            <tbody>
                <%
            ControladoraPersistencia control = new ControladoraPersistencia();
            List<Venta> listaVentas = new ArrayList<>();
            listaVentas=control.consultarVentas();
            SimpleDateFormat sf= new SimpleDateFormat("dd/MM/yyyy");
            Servicio servicio;
            for(Venta venta: listaVentas){
                Date fecha = venta.getFecha_venta();
                servicio=venta.getServicio();
        %>
        <tr Style="border:2px;vertical-align: middle">
            <td><% out.print(venta.getNum_venta()); %></td>
            <td><% try{out.print(sf.format(fecha));}catch(Exception ex){} %></td>
            <td><% out.print(venta.getCliente().getId_cliente()); %></td>
            <td><button class="btn" type="button"  data-bs-toggle="tooltip" data-bs-placement="top" title="Click para ver Detalles" onclick="mostrarDetalle(<% try{out.print(venta.getServicio().getCodigo_servicio());}catch(Exception ex){out.print("-");} %>)"><% try{out.print(venta.getServicio().getCodigo_servicio());}catch(Exception ex){out.print("-");} %></button></td>
            <td><button class="btn" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Click para ver Detalles" onclick="mostrarDetalleP(<%try{out.print(venta.getPaquete().getCodigo_paquete());}catch(Exception ex){out.print("-");}%>)"><% try{out.print(venta.getPaquete().getCodigo_paquete());}catch(Exception ex){out.print("-");} %></button></td>
            <td>$<% try{out.print(Math.round(venta.getServicio().getCosto_servicio()*100.0)/100.0);}catch(Exception ex){out.print(Math.round(venta.getPaquete().getCosto_paquete()*100.0)/100.0);} %></td>
            <td><% out.print(venta.getMedio_pago()); %></td>
            <td><% out.print(venta.getEmpleado().getId_empleado()); %></td>
            <td>
                <form class="btn" action="SvVentaModificar" method="POST">
                    <input type="hidden" name="venta" value="<% out.print(venta.getNum_venta()); %>">
                    <button class="btn btn-dark" type="submit">Editar</button>
                </form>
                <form class="btn" action="SvVentaEliminar" method="POST">
                    <input type="hidden" name="venta" value="<% out.print(venta.getNum_venta()); %>">
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
        <script>
            function mostrarDetalle(id){
                var msg= "";
                switch(id){
                    <% List<Servicio>listaServicios = control.consultarServicios();
                        for(Servicio service:listaServicios){%>
                    case <%out.print(service.getCodigo_servicio());%>:
                                alert("Detalle de Servicio: <%out.print(service.getCodigo_servicio());%>\nNombre: <%out.print(service.getNombre_servicio());%> \nPrecio: <%out.print(service.getCosto_servicio());%>");
                    break;
                    <%}%>
                }
                //alert("Hola");
                }
                
                function mostrarDetalleP(id){
                var msg= "";
                switch(id){
                    <% List<Paquete>listaPaquetes = control.consultarPaquetes();
                        for(Paquete paquete:listaPaquetes){
                            List<Servicio> listServs = paquete.getServicios();
                    %>
                    case <%out.print(paquete.getCodigo_paquete());%>:
                                alert("Detalle de Paquete: <%out.print(paquete.getCodigo_paquete());%>\nServicios:\n <%for(Servicio s:listServs){out.print("-"+s.getNombre_servicio());%>\n<%}%> \nPrecio: <%out.print(paquete.getCosto_paquete());%>");
                    break;
                    <%}%>
                }
                //alert("Hola");
                }
        </script>
    
    </body>
</html>
