<%-- 
    Document   : FormVentaActualizar
    Created on : 13-dic-2021, 8:34:10
    Author     : Luifran
--%>

<%@page import="logica.Empleado"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="./Estilos/estilos.css" rel="stylesheet" type="text/css" />
        <script src="./Estilos/js.js" type="text/javascript"></script>
        <title>Venta-Agencia turismo</title>
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top" >
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
        <h1 style="text-align:center;">Nueva Venta</h1>
        <%
            Controladora control = new Controladora();
            //HttpSession sessionUsuario = request.getSession();
            Empleado miEmpleado = (Empleado)sessionUsuario.getAttribute("empleado");
        %>
        <form class="row g-3 needs-validation" novalidate action="SvVenta" method="POST">
            <div class="col-md-6">
            <label>Cliente: </label>
            <select class="form-select" name="cliente">
                <%
                    List<Cliente>listaClientes=control.consultarClientes();
                    for(Cliente client:listaClientes){
                %>
                <option value="<%out.print(client.getId_cliente());%>"><%out.print(client.getNombre_cliente()+" "+client.getApellido_cliente()+"-"+client.getId_cliente());%></option>
                <%}%>
            </select><br>
            </div>
            <div class="col-md-6">
                <label for="fecha">Fecha: </label>
                <input class="form-control" type="date" name="fecha" required>
            </div>
            <div>
                <input  class="form-check-input" type="radio" id="servicio_turistico" name="producto" onclick="seleccionarProducto()" required><label for="servicio_turistico">Servico</label><br>
                <input  class="form-check-input" type="radio" id="paquete_turistico" name="producto" onclick="seleccionarProducto()" required><label for="paquete_turistico" >Paquete Turistico</label><br>
            </div>
            <div class="col-md-6">
            <label>Servicio: </label>
            <select class="form-select" id="servicio" name="servicio" oninput="mostrarDetalleServicio()" disabled required>
                <option value="" disabled selected>Seleccione...</option>
                <%
                    List<Servicio>listaServicios=control.consultarServicios();
                    List<Paquete> listaPaquetes = control.consultarPaquetes();
                    for(Servicio serv:listaServicios){
                %>
                <option value="<%out.print(serv.getCodigo_servicio());%>"><%out.print(serv.getNombre_servicio());%></option>
                <% } %>
            </select><br>
            </div>
            <div class="col-md-6">
            <label>Paquete: </label>
            <select class="form-select" id="paquete" name="paquete" oninput="mostrarDetallePaquete()" disabled required>
                <option disabled value="" selected>Seleccione...</option>
                <% 
                    for(Paquete paq:listaPaquetes){
                %>
                <option value="<%out.print(paq.getCodigo_paquete());%>"><%out.print(paq.getCodigo_paquete());%></option>
                <%}%>
            </select><br>
            </div>
            <div class="col-md-6">
                <h5 style="text-align: center;">Detalle de servicio:</h5>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <td>Nombre</td>
                            <td>Descripcion</td>
                            <td>Precio</td>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                        <%for(Servicio serv:listaServicios){%>
                        <tr id="<%out.print(serv.getCodigo_servicio());%>" hidden>
                            <td id="servicioCol1"><%out.print(serv.getNombre_servicio());%></td>
                            <td id="servicioCol2"><%out.print(serv.getDescripcion());%></td>
                            <td id="servicioCol3">$<%out.print(serv.getCosto_servicio());%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <h5 style="text-align:center;">Detalle de paquete:</h5>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <td>Codigo</td>
                            <td>Servicios</td>
                            <td>Precio</td>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                        <%for(Paquete paq:listaPaquetes){%>
                        <tr id="<%out.print(paq.getCodigo_paquete());%>" hidden>
                            <%List<Servicio> serviciosPaquete = paq.getServicios();%>
                            <td ><%out.print(paq.getCodigo_paquete());%></td>
                            <td >
                                <%
                                    for(Servicio s : serviciosPaquete){
                                    out.print(s.getNombre_servicio()+"+");
                                    }
                                %>
                            </td>
                            <td >$<%out.print(paq.getCosto_paquete());%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <div class="col-md-8">
            <label>Forma de pago: </label>
            <select class="form-select" name="medio_pago" required>
                <option value="efectivo">Efectivo</option>
                <option value="Tarjeta de Débito">Tarjeta de Débito</option>
                <option value="Tarjeta de Crédito">Tarjeta de Crédito</option>
                <option value="Monedero Virtual">Monedero Virtual</option>
                <option value="Transferencia">Transferencia</option>
            </select><br>
            </div>
            <div class="col-md-6">
            <label for="empleado">Vendedor:</label>
            <input class="form-control" type="text" name="empleado" value="<%out.print(miEmpleado.getId_empleado());%>" hidden>
            <input class="form-control" type="text" name="empleado" value="<%out.print(miEmpleado.getNombre_empleado()+"-"+miEmpleado.getId_empleado());%>" disabled>
            </div>
            <div style="text-align: center;">
                <button class="btn btn-dark" type="submit">Guardar</button>
            </div>
        </form>
            
            </div>
           
            <%@include file="Footer.jsp" %>
            
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
})()         ; 
                var idAnterior =null;
                function mostrarDetalleServicio(){
                    var tbody = document.getElementById("tbody");
                    if(idAnterior!=null){
                        var anterior = document.getElementById(idAnterior);
                        anterior.setAttribute("hidden","true");
                    }
                    
                    var selectServicio = document.getElementById("servicio").value;
                    var detalleServicio = document.getElementById(selectServicio);
                    
                    
                    detalleServicio.removeAttribute("hidden");
                    idAnterior = selectServicio;
                }
                
                var idAnteriorP = null;
                function mostrarDetallePaquete(){
                    
                    if(idAnteriorP!=null){
                        var anterior = document.getElementById(idAnteriorP);
                        anterior.setAttribute("hidden","true");
                    }
                    
                    var selectPaquete = document.getElementById("paquete").value;
                    var detallePaquete = document.getElementById(selectPaquete);
                    
                    
                    detallePaquete.removeAttribute("hidden");
                    idAnteriorP = selectPaquete;
                }
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
