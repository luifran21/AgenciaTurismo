
function seleccionarProducto(){
                    var servicio= document.getElementById("servicio_turistico");
                    var paquete = document.getElementById("paquete_turistico");
                    var selectServicio = document.getElementById("servicio");
                    var selectPaquete = document.getElementById("paquete");
                    
                    if(servicio.checked){
                        selectServicio.removeAttribute("disabled");
                        selectPaquete.setAttribute("disabled","true");
                    }else if(paquete.checked){
                        selectPaquete.removeAttribute("disabled");
                        selectServicio.setAttribute("disabled","true");
                    }
                }
