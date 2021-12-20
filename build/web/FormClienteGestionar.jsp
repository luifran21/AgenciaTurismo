
<%@page import="logica.Empleado"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.ControladoraPersistencia"%>
<%@page import="servlets.SvCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="./Estilos/estilos.css" rel="stylesheet" type="text/css" />
        <title>Gestionar Clientes</title>
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
            <div style="text-align: center; margin-bottom:2%;">
                <h1>Clientes</h1>
                <a class="btn btn-dark" href="FormCliente.jsp">Agregar nuevo cliente</a><br>
            </div>
            
        <table class="table">
            <thead class="table-dark">
                <tr>
            <td>Nombre</td>
            <td>Apellido</td>
            <td>fecha Nac.</td>
            <td>DNI</td>
            <td>Direccion</td>
            <td>Nacionalidad</td>
            <td>Email</td>
            <td>Celular</td>
            <td>Accion</td></tr>
            </thead>
            <tbody>
                <%
            ControladoraPersistencia control = new ControladoraPersistencia();
            List<Cliente> listaClientes = new ArrayList<>();
            listaClientes=control.consultarClientes();
            SimpleDateFormat sf= new SimpleDateFormat("dd/MM/yyyy");
            for(Cliente client: listaClientes){
                Date fecha = client.getFecha_nac_cliente();
        %>
        <tr Style="border:2px; vertical-align: middle;">
            <td><% out.print(client.getNombre_cliente()); %></td>
            <td><% out.print(client.getApellido_cliente()); %></td>
            <td><% try{out.print(sf.format(fecha));}catch(Exception ex){} %></td>
            <td><% out.print(client.getDni_cliente()); %></td>
            <td><% out.print(client.getDireccion_cliente()); %></td>
            <td><% out.print(client.getNacionalidad_cliente()); %></td>
            <td><% out.print(client.getEmail_cliente()); %></td>
            <td><% out.print(client.getCelular_cliente()); %></td>
            <td>
                <form  class="btn" action="SvModificarCliente" method="POST">
                    <input type="hidden" name="cliente" value="<% out.print(client.getId_cliente()); %>">
                    <button class="btn btn-dark" type="submit">Editar</button>
                </form>
                <form class="btn" action="SvEliminarCliente" method="POST">
                    <input type="hidden" name="cliente" value="<% out.print(client.getId_cliente()); %>">
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
