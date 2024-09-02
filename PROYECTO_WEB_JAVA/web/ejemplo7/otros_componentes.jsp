<%-- 
    Document   : otros_componentes
    Created on : 10 sept 2024, 9:28:38
    Author     : Curso Mañana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>COMPONENTES DIVERSOS DE UN FORMULARIO</h1>
        <form action="proceso.jsp">
            <p>
                1. Campo de texto normal <input type="text" name="txtNombre" required />
            </p>
            <p>
                2. Campo de texto encriptado <input type="password" name="txtClave" />
            </p>
            <p>
                3. Botón radio de selección simple:
                <input type="radio" name="radioGenero" value="H"/>Hombre
                <input type="radio" name="radioGenero" value="M"/>Mujer
            </p>
            <p>
                4. Caja check de selección simple:
                <input type="checkbox" name="chbAceptar" />¿Autoriza acceder a su datos personales? 
            </p>
            <p>
                5. Caja check de selección multiple: 
                <input type="checkbox" name="chbPasatiempo" value="Ajedrez" />Ajedrez
                <input type="checkbox" name="chbPasatiempo" value="Futbol" />Futbol
                <input type="checkbox" name="chbPasatiempo" value="Tenis" />Tenis
            </p>
            <p>
                6. Combo de selección simple:
                <select name="cboCodigoPais" size="1">
                    <option selected>Seleccionar</option>  
                    <option value="CL">Chile</option> 
                    <option value="PE">Perú</option> 
                    <option value="ES">España</option> 
                    <option value="MX">Mexico</option> 
                    <option value="UK">Inglaterra</option> 
                </select>
            </p>
            <p>
                7. Lista de selección multiple:
                <select name="lstMascota" multiple="true" size="3">
                    <option value="Gato">Gato</option>
                    <option value="Perro">Perro</option>
                    <option value="Cobaya">Cobaya</option>
                    <option value="Hamster">Hamster</option>
                    <option value="Cerdo">Cerdo</option>
                </select>
            </p>
            <p>
                8. Ingrese su correo:
                <input type="email" 
                       pattern=".+@hotmail.com" 
                       size="18"
                       placeholder="usuario@hotmail.com"
                       minlength="18"
                       maxlength="18"
                       list="listaEmailPorDefecto"
                       name ="micorreo"
                       required />
                <datalist id="listaEmailPorDefecto">
                    <option value="luis@hotmail.com" />
                    <option value="carlos@hotmail.com" />
                    <option value="miguel@hotmail.com" />
                    <option value="silvia@hotmail.com" />
                    <option value="maría@hotmail.com" />
                </datalist>
            </p>
            <p>
                <label for="txtTelefono"> 9. Ingrese su teléfono:</label>
                <input type="tel"
                       name="mitelefono"
                       id="txtTelefono"
                       pattern="[0-9]{9,9}"
                       size="10"
                       placeholder = "XXXXXXXXX"
                       minlength = "9"
                       maxlength= "9"
                       list = "listaTelefonosPorDefecto"
                       required>
                <datalist id="listaTelefonosPorDefecto">
                    <option value="654654456">
                    <option value="654654466">
                    <option value="654654456">
                    <option value="654654456">
                </datalist>
            </p>

            <p>
                <label for="lblReunion">10. Elija una hora para su reunión entre 9:00 y 18:00 horas:</label>
                <input type="time" 
                       name="txtHora" 
                       min="09:00" 
                       max="18:00"
                       id="lblReunion"
                       required>
            </p>

            <p>
                <label for="lblFechaHora">11. Elija una fecha, hora y minutos para su cita:</label>
                <input type="datetime-local" id="txtFechaHora" name="txtFechaHora">
            </p>
            <p>
                <input type="submit" name="cmdEnviar" />
            </p>    
        </form>

    </body>
</html>
