****************
***   0001   ***
****************

(1) MYSQL

CREATE TABLE persona (
    idPersona INT          AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(50),
    frutas    JSON
);

(2) JAVA: INSERTAR UN JSON

--------------------------------------------------------------------------------
// CREAR UNA CONEXION A LA BASE DE DATOS
String url = "jdbc:mysql://localhost:3306/bdregistro"; 
String usuario = "root";
String contraseña = "12345678"; 
String[] frutas = {"manzana", "naranja", "plátano"};
--------------------------------------------------------------------------------
// CONVERTIR UN ARRAY DE FRUTAS A UNA CADENA JSON USANDO GSON
Gson gson = new Gson();
String frutasJson = gson.toJson(frutas);
--------------------------------------------------------------------------------
// PREPARAR Y EJECUTAR LA SENTENCIA INSERT SQL
String sql = "INSERT INTO persona (nombre, frutas) VALUES (?, ?)";
PreparedStatement ps = conexion.prepareStatement(sql);
ps.setString(1, "Juan");  
ps.setString(2, frutasJson);  // JSON con la lista de frutas
ps.executeUpdate();
--------------------------------------------------------------------------------

(2) JAVA: RECUPERAR UN JSON

// PREPARAR Y EJECUTAR LA SENTENCIA SELECT SQL EL CUAL NOS DEVUELVE REGISTROS
String sql = "SELECT frutas FROM personas WHERE nombre = ?";
PreparedStatement ps = conexion.prepareStatement(sql);
ps.setString(1, "Juan");  // Nombre de la persona
ResultSet rs = ps.executeQuery();
if (rs.next()) { // Si hay resultados
  String frutasJson = rs.getString("frutas"); // Obtener el campo json como string
  System.out.println("JSON crudo desde MySQL: " + frutasJson); // Mostrar el JSON en formato crudo
  Gson gson = new Gson();
  String[] frutas = gson.fromJson(frutasJson, String[].class); // Convertir el JSON a un array de Strings usando Gson
  // Mostrar las frutas en pantalla
  System.out.println("Lista de frutas:");
  for (String fruta : frutas) {
       System.out.println(fruta);
  }
} else {
  System.out.println("No se encontró el registro.");
}  

****************
***   0002   ***
****************

// CREAR UN ARRAY DE CADENAS
String[] frutas = {"manzana", "naranja", "plátano"};
// USAR STREAMS PARA IMPRIMIR CADA ELEMENTO
System.out.println("Lista de frutas:");
Arrays.stream(frutas).forEach(System.out::println)
// USAR  String.join() PARA UNIR LOS ELEMENTOS DE UN ARRAY EN UNA SOLA CADENA
System.out.println("Lista de frutas:");
System.out.println(String.join(", ", frutas));
// USAR Arrays.toString() PARA CONVERTIR EL ARRAY EN UNA CADENA
System.out.println("Lista de frutas:");
System.out.println(Arrays.toString(frutas));
// USAR UN BUCLE FORMA PARA IMPRIMIR CADA ELEMENTO DEL ARRAY
System.out.println("Lista de frutas:");
for (String fruta : frutas) {
     System.out.println(fruta);
}

****************
***   0003   ***
****************

-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS BDPROBANDO;

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS BDPROBANDO;

-- Usar la base de datos
USE BDPROBANDO;

-- Crear la tabla 'persona' con un campo JSON
CREATE TABLE persona (
    idPersona INT AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(50),
    frutas    JSON
);

-- Insertar un registro con datos en formato JSON
INSERT INTO persona (nombre, frutas) VALUES ('Juan', JSON_ARRAY('manzana', 'naranja', 'plátano'));

-- Seleccionar todos los registros de la tabla 'persona'
SELECT * FROM persona;

-- Mostrar el primer elemento de la lista JSON
SELECT JSON_EXTRACT(frutas, '$[0]') AS primer_fruta FROM persona WHERE nombre = 'Juan';

****************
***   0004   *** FECHA
****************

(0) HTML

<input type="datetime-local" id="txtFechaHora" name="txtFechaHora">

(1) MYSQL

CREATE TABLE citas (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL
);

INSERT INTO citas (fecha_hora) VALUES ('2024-09-11 14:30:00');

-- EXTRAER LA FECHA Y HORA POR SEPARADO
SELECT DATE(fecha_hora) AS fecha, TIME(fecha_hora) AS hora
FROM citas;


(2) JAVA

Para insertar los datos recogidos del campo datetime-local en la base de datos, puedes usar una consulta SQL similar a esta:

String query = "INSERT INTO citas (fecha_hora) VALUES (?)";
PreparedStatement ps = conexion.prepareStatement(query)) {
// Suponiendo que tienes la fecha y hora en un String
String fechaHora = "2024-09-11 14:30:00";
ps.setString(1, fechaHora);
ps.executeUpdate();
System.out.println("Cita insertada con éxito.");



