================================================================================
INDEX
================================================================================

(0001) SEGUN SU PROPOSITO LAS SENTENCIAS SQL SE CLASIFICAN EN ESTAS  CATEGORIAS:
(0002) METODOS MAS COMUNES PARA EJECUTAR CONSULTAS SQL CON JAVA
(0003) QUE ES UNA FUNCTION EN MYSQL
(0004) QUE ES UN PROCEDURE EN MYSQL
(0005) QUE ES UN TRIGGER EN MYSQL
(0006) DIFERENCIAS CLAVES ENTRE FUNCTION, PROCEDURE Y TRIGGER
(0007) TIPOS DE DATOS EN MYSQL
(0008) TIPOS DE DATOS EN MYSQL Y SU EQUIVALENTE EN JAVA
(0009) IMPLEMENTACION DE UNA FUNCTION MYSQL CON JAVA
(0010) IMPLEMENTACION DE UN PROCEDURE MYSQL CON JAVA
(0011) IMPLEMENTACION DE UN TRIGGER MYSQL CON JAVA
(0012) SENTENCIA SQL ALTER
(0013) COMANDOS BAT CON MYSQL
(0014) CREAR USUARIOS Y DAR PRIVILEGIOS

================================================================================
(0001) SEGUN SU PROPOSITO LAS SENTENCIAS SQL SE CLASIFICAN EN ESTAS  CATEGORIAS:
================================================================================

1. DDL - DATA DEFINITION LANGUAGE - LENGUAJE DE DEFINICION DE DATOS
-------------------------------------------------------------------
Este   grupo   incluye   sentencias que permiten crear, modificar y  eliminar la 
estructura de las bases  de datos  (tablas, índices, vistas, etc.).  No trabajan 
con los datos en sí, sino con  los  objetos  que  los contienen. Las principales 
sentencias DDL son:

CREATE: Crea objetos como tablas, índices, vistas, esquemas, etc.
Ejemplo: CREATE TABLE Empleado (id INT, nombre VARCHAR(50));

ALTER: Modifica la estructura de un objeto existente (como  agregar  o  eliminar 
columnas en una tabla).
Ejemplo: ALTER TABLE Empleado ADD salario DECIMAL(10,2);

DROP: Elimina un objeto de la base de datos (como una tabla o índice).
Ejemplo: DROP TABLE Empleado;

TRUNCATE: Elimina  todos  los registros  de una tabla sin eliminar su estructura 
(más rápida que DELETE, ya que no genera logs).

Ejemplo: TRUNCATE TABLE Empleado;

2. DML - DATA MANIPULATION LANGUAGE - LENGUAJE DE MANIPULACION DE DATOS
-----------------------------------------------------------------------
Este conjunto de sentencias se utiliza para gestionar los datos  dentro  de  las 
tablas. Son las operaciones que   permiten   insertar,  actualizar,  eliminar  y 
consultar los datos en una base de datos. Las principales sentencias DML son:

INSERT: Inserta nuevos registros en una tabla.
Ejemplo: INSERT INTO Empleado (id, nombre, salario) VALUES (1, 'Juan', 1000);

UPDATE: Actualiza los registros existentes en una tabla.
Ejemplo: UPDATE Empleado SET salario = 1200 WHERE id = 1;

DELETE: Elimina uno o varios registros de una tabla.
Ejemplo: DELETE FROM Empleado WHERE id = 1;

SELECT: Recupera datos de una o más tablas.
Ejemplo: SELECT * FROM Empleado;

3. DCL - DATA CONTROL LANGUAGE - LENGUAJE DE CONTROL DE DATOS
-------------------------------------------------------------
Este conjunto de sentencias se usa para controlar los permisos y accesos  a  los 
datos dentro de una base de datos. Las sentencias DCL más comunes son:

GRANT: Otorga permisos a un usuario o rol para realizar acciones en la  base  de 
datos.
Ejemplo: GRANT SELECT ON Empleado TO usuario1;

REVOKE: Revoca los permisos otorgados previamente a un usuario o rol.
Ejemplo: REVOKE SELECT ON Empleado FROM usuario1;

4. TCL - TRANSACTION CONTROL LANGUAGE - LENGUAJE DE CONTROL DE TRANSACCIONES
----------------------------------------------------------------------------
Las sentencias TCL se utilizan para gestionar las transacciones  en  la  base de 
datos, permitiendo controlar cómo y cuándo se aplican los cambios realizados por
las sentencias DML. Las principales sentencias TCL son:

COMMIT: Confirma   los   cambios   realizados   en   una  transacción y los hace 
permanentes en la base de datos.
Ejemplo: COMMIT;

ROLLBACK: Revierte los cambios realizados en una transacción no confirmada.
Ejemplo: ROLLBACK;

SAVEPOINT: Define   un   punto   de   restauración   dentro  de una transacción, 
permitiendo un rollback parcial hasta ese punto.
Ejemplo: SAVEPOINT punto_guardado;

SET TRANSACTION: Establece las características de  la  transacción actual,  como
 el nivel de aislamiento.
Ejemplo: SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

5. SENTENCIAS DE CONTROL DE FLUJO
---------------------------------
Estas   sentencias   permiten   estructurar   el control del flujo dentro de los 
procedimientos almacenados, funciones o triggers. Son propias de los sistemas de
bases de datos, pero algunas tienen sintaxis  específica  dependiendo  del  SGBD 
(Sistema de Gestión de Bases de Datos). Las más comunes son:

IF: Controla la ejecución condicional de sentencias.
Ejemplo:
IF (salario > 1000) THEN 
   UPDATE Empleado SET salario = salario * 1.1; 
END IF;

CASE: Proporciona una evaluación condicional múltiple dentro de una sentencia SQL.
Ejemplo: 
SELECT nombre, 
       CASE WHEN salario > 1000 THEN 'Alto' ELSE 'Bajo' END AS rango_salario 
FROM Empleado;

LOOP, WHILE, REPEAT: Sentencias de control iterativo, utilizadas  para ciclos en 
procedimientos almacenados.
Ejemplo:

WHILE contador < 10 DO
    INSERT INTO Empleado (nombre, salario) VALUES ('Empleado' || contador, 1000);
    SET contador = contador + 1;
END WHILE;
================================================================================
(0002) METODOS MAS COMUNES PARA EJECUTAR CONSULTAS SQL CON JAVA
================================================================================

1. EXECUTEUPDATE()
------------------

Este método se utiliza para ejecutar sentencias SQL que modifican los datos o la
estructura de la base de datos, como INSERT, UPDATE, DELETE,  y  sentencias  DDL 
como CREATE, ALTER, DROP, etc. Devuelve un valor entero que representa el número
de filas afectadas por la consulta.

EJEMPLO:

String sqlInsert = "INSERT INTO Empleado (id, nombre, salario) VALUES (1, 'Juan', 1000)";
Statement statement = conexion.createStatement();
int filasAfectadas = statement.executeUpdate(sqlInsert);
System.out.println(filasAfectadas + " fila(s) insertadas");

String sqlUpdate = "UPDATE Empleado SET salario = 1200 WHERE id = 1";
filasAfectadas = statement.executeUpdate(sqlUpdate);
System.out.println(filasAfectadas + " fila(s) actualizada(s)");

String sqlDelete = "DELETE FROM Empleado WHERE id = 1";
filasAfectadas = statement.executeUpdate(sqlDelete);
System.out.println(filasAfectadas + " fila(s) eliminada(s)");

2. EXECUTE()
------------
Este método se utiliza para  ejecutar  cualquier  tipo  de  consulta  SQL, tanto 
sentencias que devuelven un conjunto de resultados (como SELECT) como sentencias 
que no lo hacen (como INSERT, UPDATE, DELETE, o DDL). execute() es más  genérico
y devuelve un valor booleano:

true si la consulta produce un conjunto de resultados (como un SELECT).
false si la consulta no produce un conjunto de resultados (como  INSERT, UPDATE, 
DELETE, CREATE, etc.).

EJEMPLO:

// Ejecutar una sentencia SELECT con execute()
String sqlSelect = "SELECT * FROM Empleado";
boolean tieneResultados = statement.execute(sqlSelect);

if (tieneResultados) {
    ResultSet resultSet = statement.getResultSet();
    while (resultSet.next()) {
        System.out.println("ID: " + resultSet.getInt("id"));
    }
}

// Ejecutar una sentencia UPDATE con execute()
String sqlUpdate = "UPDATE Empleado SET salario = 1200 WHERE id = 1";
boolean esActualizacion = statement.execute(sqlUpdate);
if (!esActualizacion) {
    System.out.println("Sentencia UPDATE ejecutada, sin conjunto de resultados.");
}

3. DIFERENCIAS CLAVE ENTRE EXECUTEUPDATE() Y EXECUTE()
------------------------------------------------------
executeUpdate(): Se usa específicamente  para  sentencias  DML  (INSERT, UPDATE, 
DELETE) o DDL (CREATE, ALTER, DROP). Devuelve el número de filas afectadas.

execute(): Es más  versátil  y  puede ejecutar cualquier tipo de  consulta  SQL. 
Devuelve true si la consulta genera un conjunto de resultados (como SELECT),   o 
false si no lo hace (como INSERT, UPDATE, DELETE).

4. EXECUTEQUERY()
-----------------
Este   método   se  utiliza exclusivamente para ejecutar sentencias SELECT,  que 
devuelven un ResultSet con los datos obtenidos de la consulta.

EJEMPLO:

String sqlSelect = "SELECT * FROM Empleado";
ResultSet resultSet = statement.executeQuery(sqlSelect);

while (resultSet.next()) {
    System.out.println("ID: " + resultSet.getInt("id"));
}

RESUMEN
-------
executeUpdate(): Para   INSERT, UPDATE, DELETE  y  operaciones DDL. Devuelve  el 
número de filas afectadas.

execute(): Puede ejecutar cualquier tipo de consulta. Devuelve true si genera un
ResultSet (como SELECT), o false si no lo hace.

executeQuery(): Exclusivo para consultas SELECT. Devuelve  un  ResultSet con los 
resultados.

Estos métodos permiten ejecutar  diferentes  tipos de operaciones en una base de 
datos desde Java, dependiendo de si necesitas modificar los datos, la estructura 
de la base de datos, o consultar información.
--------------------------------------------------------------------------------
================================================================================
(0003) QUE ES UNA FUNCTION EN MYSQL
================================================================================
--------------------------------------------------------------------------------
Function (Función)

Una   función   en   MySQL   es un bloque de código reutilizable que realiza una 
operación  y  devuelve  un  valor. Es   comúnmente   utilizada  para  cálculos y 
manipulaciones de datos que se pueden realizar dentro de una consulta SQL.

Características:

Retorna un valor: Siempre devuelve un  valor  único  (puede  ser un tipo de dato 
como INT, VARCHAR, DATE, etc.).

Uso en consultas: Puede  ser  llamada  dentro de una sentencia SQL (por ejemplo, 
dentro de un SELECT, WHERE, ORDER BY).

Entrada: Acepta parámetros de entrada, pero no parámetros de salida.

Determinismo: Idealmente, las  funciones deben ser deterministas, es decir,  que 
devuelvan el mismo resultado para los mismos parámetros de entrada.

Ejemplo:

-- CREAR FUNCTION

CREATE FUNCTION obtener_sueldo_total(idEmpleado INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE sueldo_total DECIMAL(10, 2);
    SELECT salario INTO sueldo_total FROM Empleado WHERE id = idEmpleado;
    RETURN sueldo_total;
END;

-- LLAMAR FUNCTION

SELECT obtener_sueldo_total(1);
--------------------------------------------------------------------------------
================================================================================
(0004) QUE ES UN PROCEDURE EN MYSQL
================================================================================
--------------------------------------------------------------------------------
Procedure (Procedimiento Almacenado)

Un   procedimiento   almacenado   es   un bloque de código más general que puede 
ejecutar   múltiples   sentencias   SQL. A   diferencia   de  una  función,  los
procedimientos no siempre devuelven un valor, y pueden realizar  operaciones más
complejas, como modificar datos o ejecutar lógica condicional.

Características:

No siempre retorna un valor: Un procedimiento puede o no devolver resultados.  A
menudo se usa para modificar datos, no solo para obtenerlos.

Uso independiente: Se invoca usando la instrucción CALL.

Entrada/Salida: Puede tener parámetros de entrada, salida o de entrada/salida.

Mayor flexibilidad: Puede contener varias sentencias SQL, como INSERT, UPDATE,
DELETE, SELECT, y trabajar con transacciones.

Ejemplo:

-- CREAR PROCEDURE

CREATE PROCEDURE actualizar_sueldo(idEmpleado INT, nuevoSueldo DECIMAL(10, 2))
BEGIN
    UPDATE Empleado SET salario = nuevoSueldo WHERE id = idEmpleado;
END;
Llamada:

-- LLAMAR PROCEDURE

CALL actualizar_sueldo(1, 1500); 
--------------------------------------------------------------------------------
================================================================================
(0005) QUE ES UN TRIGGER EN MYSQL
================================================================================
--------------------------------------------------------------------------------
Trigger (Disparador)

Un trigger es un bloque de código que se  ejecuta automáticamente en respuesta a
un evento  (como INSERT, UPDATE, o DELETE)  que  ocurre en una tabla específica.
 
Se utilizan para automatizar tareas y mantener la integridad de los datos.

Características:

No se invoca directamente: Se ejecuta automáticamente cuando  ocurre  un  evento 
específico en una tabla.

No retorna valores: Los triggers no devuelven resultados, pero  pueden  realizar 
modificaciones en otras tablas o registros.

Eventos: Se  dispara  antes  o  después   de  un evento (BEFORE o AFTER) en  las 
operaciones de INSERT, UPDATE, o DELETE.

Utilidad: Útil para realizar auditorías, validaciones o cálculos automáticos  en
respuesta a cambios en los datos.

Ejemplo:

-- CREAR TRIGGER

CREATE TRIGGER before_insert_empleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    IF NEW.salario < 0 THEN
        SET NEW.salario = 0;
    END IF;
END;

-- LLAMAR TRIGGER

Funciona automáticamente cada vez que inserta un  registro en la tabla Empleado.
--------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
(01) QUE ES UN TRIGGER
-- -----------------------------------------------------------------------------
Los triggers en  MySQL  son objetos  que permiten  ejecutar  automáticamente  un 
conjunto de instrucciones SQL antes o después de que ocurra un evento específico 
en  una  tabla. Los  triggers  son  útiles  para  aplicar  reglas,  validaciones 
automáticas, auditorías, o modificaciones automáticas de datos.
-- -----------------------------------------------------------------------------
(02) EVENTOS QUE ACTIVAN UN TRIGGERS
-- -----------------------------------------------------------------------------
INSERT: El trigger se activa cuando se inserta un nuevo registro.
UPDATE: El trigger se activa cuando se actualiza un registro existente.
DELETE: El trigger se activa cuando se elimina un registro existente.

Cada  uno de estos eventos puede activar  un  trigger  antes (BEFORE)  o después 
(AFTER) de la operación.
-- -----------------------------------------------------------------------------
(03) MOMENTOS CUANDO DEBE EJECUTARSE EL TRIGGER
-- -----------------------------------------------------------------------------
BEFORE: Antes de que ocurra el evento.
AFTER : Después de que ocurra el evento.
SCOPE : El trigger se asocia con una tabla específica, y  sólo se dispara en esa
        tabla.
-- -----------------------------------------------------------------------------
(04) COMBINACIONES POSIBLES PARA CREAR TRIGGERS
-- -----------------------------------------------------------------------------
Así que se pueden crear triggers con combinaciones como:

BEFORE INSERT
AFTER INSERT
BEFORE UPDATE
AFTER UPDATE
BEFORE DELETE
AFTER DELETE

Estos son los únicos eventos que activan triggers en MySQL.
-- -----------------------------------------------------------------------------
(05) ESTRUCTURA BASICA DE UN TRIGGER
-- -----------------------------------------------------------------------------
CREATE TRIGGER nombre_trigger
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON nombre_tabla
FOR EACH ROW
comandos_SQL;

LEYENDA
-------

nombre_trigger				: Nombre del trigger.
{BEFORE | AFTER}			: Define si se ejecuta antes o después del evento.
{INSERT | UPDATE | DELETE}	: Tipo de evento que activará el trigger.
nombre_tabla				: La tabla sobre la cual se ejecuta el trigger.
FOR EACH ROW				: Se ejecuta para cada fila afectada.
-- -----------------------------------------------------------------------------
(05) VARIABLES DISPONIBLES EN TRIGGERS
-- -----------------------------------------------------------------------------
OLD.column_name: Se refiere al valor anterior de la columna (solo para UPDATE y DELETE).
NEW.column_name: Se refiere al valor nuevo de la columna (para INSERT y UPDATE).
================================================================================
(0006) DIFERENCIAS CLAVES ENTRE FUNCTION, PROCEDURE Y TRIGGER
================================================================================
--------------------------------------------------------------------------------
IMAGEN 0001

Funciones: Se usan en consultas SQL para devolver un valor calculado.

Procedimientos almacenados: Se utilizan para ejecutar tareas más complejas, como
modificar datos y ejecutar múltiples sentencias SQL.

Triggers: Se ejecutan automáticamente en respuesta  a  eventos  en las tablas, y 
son útiles para realizar validaciones automáticas o tareas de auditoría.
--------------------------------------------------------------------------------
================================================================================
(0007) TIPOS DE DATOS EN MYSQL
================================================================================
En MySQL, los tipos de datos se agrupan en varias categorías  principales  según 
el tipo de información que almacenan. A continuación, se presenta  un  resumende 
las categorías y los tipos de datos más comunes:
--------------------------------------------------------------------------------
1. TIPOS NUMERICOS

Se utilizan para almacenar valores numéricos, tanto enteros como decimales.

Numéricos Enteros:

TINYINT: Almacena enteros muy pequeños. Rango: -128 a 127 (o 0 a 255 sin signo).

SMALLINT: Enteros pequeños. Rango: -32,768 a 32,767 (o 0 a 65,535 sin signo).

MEDIUMINT: Enteros medianos. Rango: -8,388,608 a 8,388,607 (o 0 a 16,777,215 sin signo).

INT (INTEGER): Enteros estándar. Rango: -2,147,483,648 a 2,147,483,647 (o 0 a 4,294,967,295 sin signo).

BIGINT: Enteros grandes. Rango: -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807 (o 0 a 18,446,744,073,709,551,615 sin signo).

Numéricos Decimales:

DECIMAL(M,D): Almacena números decimales exactos. Se utiliza para datos financieros. M es el número total de dígitos y D el número de decimales.
Ejemplo: DECIMAL(10,2) almacena un número con hasta 8 dígitos enteros y 2 decimales.

FLOAT(M,D): Almacena números de punto flotante (aproximados) con precisión simple. Rango aproximado: -3.402823466E+38 a 3.402823466E+38.

DOUBLE(M,D): Almacena números de punto flotante con precisión doble. Rango aproximado: -1.7976931348623157E+308 a 1.7976931348623157E+308.
--------------------------------------------------------------------------------
2. TIPOS DE FECHA Y HORA

Estos tipos de datos se usan para almacenar valores de fecha, hora o ambos.

DATE: Almacena solo la fecha. Formato: YYYY-MM-DD.
Ejemplo: '2024-10-02'

TIME: Almacena solo la hora. Formato: HH:MM:SS.
Ejemplo: '15:30:00'

DATETIME: Almacena tanto la fecha como la hora. Formato: YYYY-MM-DD HH:MM:SS.
Ejemplo: '2024-10-02 15:30:00'

TIMESTAMP: Similar a DATETIME, pero almacena la hora en formato UTC y se actualiza automáticamente si se configura. Rango: 1970-01-01 00:00:01 UTC a 2038-01-19 03:14:07 UTC.

YEAR: Almacena solo el año. Formato: YYYY.
Ejemplo: 2024.
--------------------------------------------------------------------------------
3. TIPOS DE CADENAS DE TEXTO

Se utilizan para almacenar texto, como caracteres, palabras o párrafos.

CHAR(M): Cadena de texto de longitud fija (rellena con espacios si es necesario). M indica la longitud máxima (de 0 a 255).
Ejemplo: CHAR(10) almacena exactamente 10 caracteres.

VARCHAR(M): Cadena de texto de longitud variable. M indica la longitud máxima (de 0 a 65,535).
Ejemplo: VARCHAR(100) almacena hasta 100 caracteres.

TEXT: Almacena grandes cantidades de texto (hasta 65,535 caracteres).

TINYTEXT: Almacena hasta 255 caracteres.

MEDIUMTEXT: Almacena hasta 16,777,215 caracteres.

LONGTEXT: Almacena hasta 4,294,967,295 caracteres.
--------------------------------------------------------------------------------
4. TIPOS DE DATOS BINARIOS

Se utilizan para almacenar datos binarios, como archivos, imágenes o información cifrada.

BINARY(M): Similar a CHAR, pero almacena datos binarios de longitud fija.

VARBINARY(M): Similar a VARCHAR, pero almacena datos binarios de longitud variable.

BLOB: Almacena datos binarios grandes.

TINYBLOB: Hasta 255 bytes.

BLOB: Hasta 65,535 bytes.

MEDIUMBLOB: Hasta 16,777,215 bytes.

LONGBLOB: Hasta 4,294,967,295 bytes.
--------------------------------------------------------------------------------
5. TIPOS DE DATOS BOOLEANOS

BOOLEAN o BOOL: Es un alias para TINYINT(1). En MySQL, los valores booleanos se representan como 1 (verdadero) o 0 (falso).
--------------------------------------------------------------------------------
6. TIPOS DE DATOS ENUMERADOS

ENUM('valor1', 'valor2', ...): Conjunto de valores permitidos predefinidos, donde solo se puede almacenar uno de esos valores.
Ejemplo: ENUM('Pequeño', 'Mediano', 'Grande').

SET('valor1', 'valor2', ...): Similar a ENUM, pero permite almacenar uno o más valores del conjunto.

Ejemplo: SET('Lectura', 'Escritura', 'Ejecución').
--------------------------------------------------------------------------------
================================================================================
(0008) TIPOS DE DATOS EN MYSQL Y SU EQUIVALENTE EN JAVA
================================================================================
--------------------------------------------------------------------------------
1. TIPOS NUMERICOS

MySQL						JAVA					DESCRIPCION
-----						----					-----------
TINYINT						byte					Enteros pequeños (8 bits).
SMALLINT					short					Enteros pequeños (16 bits).
MEDIUMINT, INT (INTEGER)	int						Enteros estándar (32 bits).
BIGINT						long					Enteros grandes (64 bits).
DECIMAL(M,D)				java.math.BigDecimal	Números decimales exactos.
FLOAT(M,D)					float					Números de punto flotante de precisión simple.
DOUBLE(M,D)					double					Números de punto flotante de precisión doble.
--------------------------------------------------------------------------------
2. TIPOS DE FECHA Y HORA

MySQL						JAVA					DESCRIPCION
-----						----					-----------
DATE						java.sql.Date			Fecha (sin hora).
TIME						java.sql.Time			Hora (sin fecha).
DATETIME, TIMESTAMP			java.sql.Timestamp		Fecha y hora (con precisión de segundos).
YEAR						int						Año, generalmente representado como un entero.
--------------------------------------------------------------------------------
3. TIPOS DE CADENAS DE TEXTO

MySQL							JAVA		DESCRIPCION
-----							----		-----------
CHAR(M)							String		Cadenas de longitud fija.
VARCHAR(M)						String		Cadenas de longitud variable.
TEXT							String		Texto de longitud grande.
TINYTEXT, MEDIUMTEXT, LONGTEXT	String		Texto en diferentes tamaños según MySQL.
--------------------------------------------------------------------------------
4. TIPOS DE DATOS BINARIOS

MySQL						JAVA		DESCRIPCION
-----						----		-----------
BINARY(M)					byte[]		Datos binarios de longitud fija.
VARBINARY(M)				byte[]		Datos binarios de longitud variable.
BLOB						byte[]		Datos binarios grandes, como imágenes o archivos.
--------------------------------------------------------------------------------
5. TIPOS BOOLEANOS

MySQL							JAVA		DESCRIPCION
-----							----		-----------
BOOLEAN (alias de TINYINT(1))	boolean		Representa valores true (1) o false (0).
--------------------------------------------------------------------------------
6. TIPOS ENUMERADOS Y CONJUNTOS

MySQL							JAVA	DESCRIPCION
-----							----	-----------
ENUM('val1', 'val2',...)		String	Valores predefinidos, representados como cadenas de texto.
SET('val1', 'val2',...)			String	Conjunto de valores predefinidos, almacenados como texto.
--------------------------------------------------------------------------------
7. RESUMEN GENERAL

CATEGORIA				MYSQL					JAVA
---------				----					----
Numéricos				INT, BIGINT, DECIMAL	int, long, BigDecimal
Fecha y Hora			DATE, TIME, TIMESTAMP	java.sql.Date, Time, Timestamp
Cadenas de Texto		CHAR, VARCHAR, TEXT		String
Binarios				BINARY, BLOB			byte[]
Booleanos				BOOLEAN					boolean
Enumerados/Conjuntos	ENUM, SET				String

Cada tipo de dato de MySQL tiene un equivalente en Java que te permite  trabajar 
de manera eficiente con los valores almacenados en tu  base  de datos  desde  un 
programa Java.
--------------------------------------------------------------------------------
================================================================================
(0009) IMPLEMENTACION DE UNA FUNCTION MYSQL CON JAVA
================================================================================

package function;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Principal02 {

    public static void main(String[] args) {
        // URL de conexión a la base de datos
        String url = "jdbc:mysql://localhost:3307/tienda";
        String user = "root";
        String password = "12345678";

        Connection connection = null;
        CallableStatement cs = null;

        try {
            // Establecer conexión a la base de datos
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Conexión establecida.");

            // Llamada a la función calcular_area_circulo
            float radio = 5.0f; // El radio que deseas usar
            String query = "{ ? = CALL calcular_area_circulo(?) }";
            cs = connection.prepareCall(query);

            // Registrar el parámetro de salida (el tipo de retorno de la función)
            cs.registerOutParameter(1, java.sql.Types.FLOAT);
            cs.setFloat(2, radio); // Establecer el parámetro de entrada (radio)

            // Ejecutar la función
            cs.execute();

            // Obtener el resultado
            float area = cs.getFloat(1);
            System.out.println("El área del círculo con radio " + radio + " es: " + area);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (cs != null) {
                    cs.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}

/*
-- (1) CREAR FUNCION

DROP FUNCTION IF EXISTS calcular_area_circulo;

DELIMITER //
CREATE FUNCTION calcular_area_circulo(radio FLOAT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN ROUND(3.14159 * POW(radio,2),2);
END //
DELIMITER ;

-- (2) LLAMAR FUNCION

SELECT calcular_area_circulo(5);
 */

================================================================================
(0010) IMPLEMENTACION DE UN PROCEDURE MYSQL CON JAVA
================================================================================

public Date obtenerFechaNacimiento(Connection conexion, int idAlumno) {
    Date fechaNacimiento = null;
    CallableStatement callableStatement = null;
    
    try {
        callableStatement = conexion.prepareCall("{CALL obtener_fecha_nacimiento(?, ?)}");
        
        // Establecer el parámetro de entrada
        callableStatement.setInt(1, idAlumno);
        
        // Registrar el parámetro de salida
        callableStatement.registerOutParameter(2, java.sql.Types.DATE);
        
        // Ejecutar el procedimiento
        callableStatement.execute();
        
        // Obtener el resultado del parámetro de salida
        fechaNacimiento = callableStatement.getDate(2);
        
    } catch (SQLException e) {
        e.printStackTrace(); // Manejo de excepciones
    } finally {
        if (callableStatement != null) {
            try {
                callableStatement.close(); // Cerrar el CallableStatement
            } catch (SQLException e) {
                e.printStackTrace(); // Manejo de excepciones
            }
        }
    }
    
    return fechaNacimiento;
}

/*
DROP PROCEDURE IF EXISTS obtener_fecha_nacimiento;

DELIMITER //

CREATE PROCEDURE obtener_fecha_nacimiento (IN idAlumno_i INT, OUT fecha_nacimiento_o DATE)
BEGIN
    -- Cuerpo del procedimiento (Se puede obviar)
	
    -- Ejemplo de consulta
    SELECT fecha_nacimiento INTO fecha_nacimiento_o
    FROM Alumno
    WHERE idAlumno = idAlumno_i;

END //
DELIMITER ;
*/

================================================================================
(0011) IMPLEMENTACION DE UN TRIGGER MYSQL CON JAVA
================================================================================

package ejemploWalter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;

public class Principal1 {

    public static void main(String[] args) {
        Connection conexion = ConexionMysql.obtenerConexion();
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            if (crearTrigger(conexion)) {
                System.out.println("OK: CREAR TRIGGER");
                if (lanzarTrigger(conexion)) {
                    System.out.println("OK: LANZAR TRIGGER");
                } else {
                    System.out.println("ERROR: LANZAR TRIGGER");
                }
            } else {
                System.out.println("ERROR: QUERY");
            }

        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static boolean crearTrigger(Connection conexion) {
        boolean bandera = true;
        String dropTrigger = "DROP TRIGGER IF EXISTS before_insert_empleado;";
        String createTrigger = "CREATE TRIGGER before_insert_empleado\n"
                + "BEFORE INSERT ON Empleado\n"
                + "FOR EACH ROW\n"
                + "BEGIN\n"
                + "    IF NEW.salario < 0 THEN\n"
                + "        SET NEW.salario = 0;\n"
                + "    END IF;\n"
                + "END;";
        try {
            Statement statement = conexion.createStatement();
            // Primero se elimina el trigger existente
            statement.execute(dropTrigger);
            // Luego se crea el nuevo trigger
            statement.execute(createTrigger);

        } catch (SQLException e) {
            bandera = false;
            System.out.println(e);
        }
        return bandera;
    }

    public static boolean lanzarTrigger(Connection conexion) {
        boolean bandera = true;
        String nombre = "Ismael Alva";
        String puesto = "Diseñador";
        double salario = 2455.23;
        String fecha_contratacion = "2023-01-01";
        String query = "INSERT INTO Empleado (nombre, puesto, salario, fecha_contratacion) "
                + "VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, puesto);
            ps.setDouble(3, salario);
            ps.setString(4, fecha_contratacion);
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                System.out.println("OK: INSERT");
            } else {
                System.out.println("ERROR: INSERT");
            }
        } catch (SQLException e) {
            System.out.println(e);
            bandera = false;
        }
        return bandera;
    }

}

================================================================================
(0012) SENTENCIA SQL ALTER
================================================================================

*******************************
***   AGREGAR UNA COLUMNA   ***
*******************************

(1)

ALTER TABLE nombre_tabla 
ADD COLUMN nueva_columna VARCHAR(255);

********************************
***   ELIMINAR UNA COLUMNA   ***
********************************

ALTER TABLE nombre_tabla 
DROP COLUMN columna_existente;

****************************************************
***   MODIFICAR EL TIPO DE DATO DE UNA COLUMNA   ***
****************************************************

ALTER TABLE nombre_tabla 
MODIFY COLUMN columna_existente INT(11);

*********************************
***   RENOMBRAR UNA COLUMNA   ***
*********************************

ALTER TABLE nombre_tabla 
CHANGE COLUMN columna_vieja columna_nueva VARCHAR(255);

*******************************
***   RENOMBRAR UNA TABLA   ***
*******************************

ALTER TABLE nombre_tabla 
RENAME TO nuevo_nombre_tabla;

**************************************
***   AGREGAR UNA CLAVE PRIMARIA   ***
**************************************

ALTER TABLE nombre_tabla 
ADD PRIMARY KEY (columna_existente);

***************************************
***   ELIMINAR UNA CLAVE PRIMARIA   ***
***************************************

ALTER TABLE nombre_tabla 
DROP PRIMARY KEY;

*****************************
***   AGREGAR UN INDICE   ***
*****************************

ALTER TABLE nombre_tabla 
ADD INDEX nombre_indice (columna_existente);

******************************
***   ELIMINAR UN INDICE   ***
******************************

ALTER TABLE nombre_tabla 
DROP INDEX nombre_indice;

**********************************************************
***   AGREGAR UNA COLUMNA CON UNA RESTRICCION UNIQUE   ***
**********************************************************

ALTER TABLE nombre_tabla 
ADD COLUMN nueva_columna VARCHAR(255) UNIQUE;

****************************************************************************************************
***   CAMBIAR EL NOMBRE DE UNA COLUMNA (SOLO CAMBIAR EL NOMBRE, SIN MODIFICAR EL TIPO DE DATOS   ***
****************************************************************************************************

ALTER TABLE nombre_tabla 
CHANGE COLUMN columna_vieja columna_nueva columna_vieja_tipo_de_datos;

***********************************************************
***   AGREGAR UNA COLUMNA CON UN VALOR PREDETERMINADO   ***
***********************************************************

ALTER TABLE nombre_tabla 
ADD COLUMN nueva_columna INT DEFAULT 0;

*******************************************
***   ELIMINAR UNA RESTRICCION UNIQUE   ***
*******************************************

ALTER TABLE nombre_tabla 
DROP INDEX nombre_columna;

**********************************************
***   AGREGAR UNA COLUMNA AUTO_INCREMENT   ***
**********************************************

ALTER TABLE nombre_tabla 
ADD COLUMN nueva_columna INT AUTO_INCREMENT PRIMARY KEY;

**********************************************************
***   CAMBIAR EL MOTOR DE ALMACENAMIENTO DE LA TABLA   ***
**********************************************************

ALTER TABLE nombre_tabla 
ENGINE = InnoDB;

================================================================================
(0013) COMANDOS BAT CON MYSQL
================================================================================

1. RESPALDAR DATA

mysqldump -u root -p12345678 -h localhost -P3307 --no-create-info biblioteca author book client transaction > DATA.SQL

2. RESPALDAR SCHEMA

mysqldump -u root -p12345678 -h localhost -P3307 -d biblioteca > SCHEMA.SQL

================================================================================
(0014) CREAR USUARIOS Y DAR PRIVILEGIOS
================================================================================

-- CREAR USUARIO

CREATE USER 'walter'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678';
CREATE USER 'arturo'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678';

-- MOSTRAR TODOS LOS USUARIOS CREADOS

SELECT user, host, authentication_string FROM mysql.user;

-- CAMBIAR LA CONTRASEÑA DE UN USUARIO

ALTER USER 'walter'@'localhost' IDENTIFIED BY 'abcdefgh';

-- ASIGNAR A UN USUARIO TODOS LOS PRIVILEGIOS SOBRE UNA BASE DE DATOS

GRANT ALL PRIVILEGES ON BDTRANSACCIONES.* TO 'walter'@'localhost';
FLUSH PRIVILEGES;

-- ASIGNAR A UN USUARIO SOLO PRIVILEGIOS SELECT

GRANT SELECT ON BDTRANSACCIONES.* TO 'arturo'@'localhost';
FLUSH PRIVILEGES;

-- ASIGNAR A UN USUARIO SOLO PRIVILEGIOS SELECT, INSERT, UPDATE Y DELETE

GRANT SELECT, INSERT, UPDATE, DELETE ON mi_base_datos.* TO 'walter'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT ON mi_base_datos.* TO 'walter'@'localhost';
GRANT INSERT ON mi_base_datos.* TO 'walter'@'localhost';
GRANT UPDATE ON mi_base_datos.* TO 'walter'@'localhost';
GRANT DELETE ON mi_base_datos.* TO 'walter'@'localhost';

-- REVOCAR ALGUNOS PRIVILEGIOS A UN USUARIO

REVOKE INSERT, UPDATE ON mi_base_datos.* FROM 'usuario1'@'localhost';
FLUSH PRIVILEGES;

-- REVOCAR TODOS LOS PRIVILEGIOS A UN USUARIO

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'walter'@'localhost';
FLUSH PRIVILEGES;

-- Explicación:
-- ALL PRIVILEGES revoca todos los privilegios que el usuario tenga sobre cualquier base de datos.
-- GRANT OPTION revoca la capacidad del usuario para otorgar privilegios a otros usuarios.


-- -----------------------------------------------------------------------------
-- Actualizar los privilegios:
-- Después   de   otorgar  o  modificar  los privilegios de un usuario, es buena 
-- práctica ejecutar el -- siguiente comando para asegurarte de  que los cambios 
-- surtan efecto de inmediato:
-- -----------------------------------------------------------------------------

-- MOSTRAR EL USUARIO ACTUAL CONECTADO EN EL SISTEMA

SELECT USER();
SELECT CURRENT_USER();

-- ELIMINAR UN USUARIO

DROP USER 'walter'@'localhost';

-- PROBAR EL USUARIO CREADO INGRESANDO DESDE LA CONSOLA
-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u walter -p123456789 -P3307

-- VERIFICAR LOS PRIVILEGIOS DE UN USUARIO

SHOW GRANTS FOR 'walter'@'localhost';
SHOW GRANTS FOR 'arturo'@'localhost';

-- RESUMEN PRIVILEGIOS

-- -----------------------------------------------------------------------------
Aquí tienes un resumen de todos los privilegios que se pueden  otorgar en MySQL, 
con una breve descripción de cada uno:
-- -----------------------------------------------------------------------------
Privilegio	Descripción
-- -----------------------------------------------------------------------------
ALL PRIVILEGES	Otorga todos los privilegios disponibles.
SELECT			Permite consultar datos de una tabla o base de datos.
INSERT			Permite insertar nuevos registros en una tabla.
UPDATE			Permite modificar registros existentes en una tabla.
DELETE			Permite eliminar registros de una tabla.
CREATE			Permite crear nuevas bases de datos o tablas.
DROP			Permite eliminar bases de datos o tablas.
-- -----------------------------------------------------------------------------
ALTER			Permite modificar la estructura de una tabla o base de datos
                (ejemplo: agregar/eliminar columnas).
-- -----------------------------------------------------------------------------
INDEX			Permite crear o eliminar índices en tablas.
GRANT OPTION	Permite otorgar o revocar privilegios a/de otros usuarios.
REFERENCES		Permite crear claves foráneas entre tablas.
CREATE VIEW		Permite crear vistas.
SHOW VIEW		Permite ver la definición de una vista.
CREATE ROUTINE	Permite crear procedimientos almacenados y funciones.
ALTER ROUTINE	Permite modificar o eliminar procedimientos almacenados y funciones.
EXECUTE			Permite ejecutar procedimientos almacenados y funciones.
TRIGGER			Permite crear y eliminar triggers en tablas.
LOCK TABLES		Permite bloquear tablas para control manual de acceso concurrente.
EVENT			Permite crear, eliminar y manejar eventos programados.
-- -----------------------------------------------------------------------------
FILE			Permite leer y escribir archivos en el servidor usando sentencias como 
                LOAD DATA INFILE o SELECT INTO OUTFILE.
-- -----------------------------------------------------------------------------
RELOAD			Permite ejecutar comandos que recargan configuraciones como FLUSH.
SHUTDOWN		Permite apagar el servidor MySQL.
PROCESS			Permite ver información sobre los procesos en ejecución del servidor.
SUPER			Permite ejecutar operaciones administrativas avanzadas como detener
                conexiones o cambiar variables globales.
-- -----------------------------------------------------------------------------				
REPLICATION SLAVE	Permite que el servidor se conecte como esclavo en la replicación.
REPLICATION CLIENT	Permite consultar el estado del maestro y esclavo en la replicación.
CREATE USER			Permite crear, modificar y eliminar cuentas de usuario.
SHOW DATABASES		Permite ver la lista de bases de datos en el servidor.
-- -----------------------------------------------------------------------------

-- GRANT OPTION

El GRANT OPTION en MySQL es una cláusula que, cuando se usa al otorgar privilegios a un usuario, le da al usuario la capacidad de otorgar esos mismos privilegios a otros usuarios.

Significado de GRANT OPTION:
Permitir otorgar privilegios: Cuando un usuario recibe privilegios con la cláusula GRANT OPTION, ese usuario puede otorgar esos mismos privilegios a otros usuarios de la base de datos. Es decir, si un usuario tiene SELECT, INSERT y UPDATE con GRANT OPTION, podrá otorgar esos mismos permisos a otro usuario.

Herencia de privilegios: El usuario que recibe privilegios con GRANT OPTION puede heredarlos a otros usuarios. Sin embargo, no puede otorgar permisos adicionales que él mismo no posea.

Ejemplo básico de uso:
sql
Copiar código
GRANT ALL PRIVILEGES ON *.* TO 'walter'@'localhost' WITH GRANT OPTION;
Este comando otorga todos los privilegios sobre todas las bases de datos (*.*) al usuario 'walter'@'localhost', junto con la capacidad de otorgar esos privilegios a otros usuarios.

¿Por qué es importante?
Delegación de permisos: Un administrador de base de datos puede otorgar privilegios a un usuario con GRANT OPTION para que este pueda, a su vez, delegar esos permisos a otros sin intervención del administrador.

Control sobre la seguridad: Otorgar GRANT OPTION es una acción poderosa, ya que permite a los usuarios cambiar la estructura de seguridad de la base de datos. Debe usarse con cuidado, ya que puede crear cadenas de usuarios que deleguen privilegios.

Ejemplo práctico:
Si un usuario admin1 tiene GRANT OPTION, puede otorgar privilegios a otros usuarios:
sql
Copiar código
GRANT SELECT, INSERT ON mi_base_datos.* TO 'user1'@'localhost';
Si admin1 tiene esos permisos con GRANT OPTION, también podrá ejecutar la siguiente sentencia para permitir que user1 haga lo mismo:

sql
Copiar código
GRANT SELECT, INSERT ON mi_base_datos.* TO 'user1'@'localhost' WITH GRANT OPTION;
Ahora, el usuario user1 podrá otorgar esos mismos privilegios a otros usuarios.

Resumen:
GRANT OPTION permite a un usuario delegar los privilegios que posee a otros usuarios.
Es importante usarlo con precaución, ya que puede llevar a una propagación inesperada de privilegios si no se gestiona adecuadamente.











