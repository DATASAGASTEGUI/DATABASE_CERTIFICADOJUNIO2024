<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action='http://localhost:8081/WALTER/wisl' method="POST">
            <input type="text" name="txtNumero" />
            <input type='submit' name='operacion' value='RAIZ CUADRADA' /> 
            <input type='submit' name='operacion' value='RAIZ CUBICA' /> 
            <input type='submit' name='operacion' value='CUADRADO' />
        </form>
    </body>
</html>
