<%-- 
    Document   : FormPaqueteActualizar
    Created on : 11-dic-2021, 16:51:12
    Author     : Luifran
--%>

<%@page import="logica.Empleado"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="logica.Paquete"%>
<%@page import="persistencia.ControladoraPersistencia"%>
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
        <h1>Modificar Paquete turístico</h1>
        <form action="SvPaqueteModificar" method="GET" id="paqueteTuristico">
            <%
                ControladoraPersistencia control = new ControladoraPersistencia();
                HttpSession misession = request.getSession();
                Paquete paqueteTuristico = (Paquete) misession.getAttribute("paquete");
            %>
            <div id="seccion-servicios">
                <div class="col-md-8">
                <label for="idPaquete">Id: </label>
                <input type="text" class="form-control" name="idPaquete" value="<% out.print(paqueteTuristico.getCodigo_paquete());%>" readonly><br>
                </div>
                
                    <% 
                        List<Servicio> serviciosActuales= paqueteTuristico.getServicios();
                        int i=0;
                        for(Servicio serv: serviciosActuales){
                    %>
                    <div class="col-md-8">
                    <label for="servicios">Servicio: </label>
                    <Select class="form-select" id ="servicios" name="servicios<%out.print(i);%>">
                    <option value="<%out.print(serv.getCodigo_servicio()); %>" selected><% out.print(serv.getNombre_servicio()); %></option>
                    <%
                        List<Servicio> listaServicios = control.consultarServicios();
                        for(Servicio service:listaServicios){
                    %>
                    <option value="<%out.print(service.getCodigo_servicio()); %>"><% out.print(service.getNombre_servicio()); %></option>
                    <% } %>
                    </select><br>
                    </div>
                <% i++;} %>
                
                
            </div>
                <button type="button" class="btn btn-secondary" onclick="insertarInputServicio()">Agregar</button><br><br>
            <div class="col-md-8">
            <label for="costo">Costo</label>
            <input type="number" class="form-control" name="costo" step="0.01" readonly="">
            </div><br>
            <input type="text" name="cantServicios" id="cant" value="<%out.print(i);%>" hidden readonly>
            <div style="text-align: center;">
                <button class="btn btn-dark" type="submit">Guardar</button>
            </div>
        </form>
                </div>  
                <%@include file="Footer.jsp" %>
        <script>
            var i =0+<%out.print(i);%>;
            function insertarInputServicio(){
                var input = document.getElementById("seccion-servicios");
                var select = document.getElementById("servicios");
                var cant = document.getElementById("cant");
                //input.innerHTML+="<label>Servicio: </label><select name='servicios"+i+"'>"+select.innerHTML+"</select><br>";
                input.innerHTML+="<div class='col-md-8'><label>Servicio: </label><select class='form-select' name='servicios"+i+"'>"+select.innerHTML+"</select></div>";
                cant.value=i+1;
                i++;
            }
            function cantInicial(){
                var cant = document.getElementById("cant");
                
            }
            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
