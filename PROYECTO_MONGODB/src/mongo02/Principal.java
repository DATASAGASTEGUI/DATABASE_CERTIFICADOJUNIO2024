package mongo02;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.bson.Document;

public class Principal {

    public static void main(String[] args) {
        // Ajustar el nivel de logging para MongoDB a WARNING
        Logger mongoLogger = Logger.getLogger("org.mongodb.driver");
        mongoLogger.setLevel(Level.WARNING);

        // Realizar la conexion con el servidor MongoDB
        ConexionMongodb.setConexion(true);
        // Obtener la conexión a la base de datos en el servidor MongoDB
        MongoDatabase mongoDatabase = ConexionMongodb.getConexion();
        // Obtener la colección
        MongoCollection<Document> coleccion = mongoDatabase.getCollection("alumno");
        try {
            MongoCursor<Document> cursor = coleccion.find().iterator();
            while (cursor.hasNext()) {
                Document doc = cursor.next();

                //System.out.println(doc.toJson());
                // VALIDAR Y OBTENER LOS CAMPOS
                String idAlumno = doc.containsKey("idAlumno") ? doc.getString("idAlumno") : null;
                String nombre = doc.containsKey("nombre") ? doc.getString("nombre") : null;
                Integer edad = doc.containsKey("edad") ? doc.getInteger("edad") : null;
                Double estatura = doc.containsKey("estatura") ? doc.getDouble("estatura") : null;

                // MOSTRAR LA INFORMACION DEL ALUMNO
                System.out.println("ID Alumno: " + (idAlumno != null ? idAlumno : "No especificado"));
                System.out.println("Nombre   : " + (nombre != null ? nombre : "No especificado"));
                System.out.println("Edad     : " + (edad != null ? edad : "No especificado"));
                System.out.println("Estatura : " + (estatura != null ? estatura : "No especificado"));
            }
        } catch (Exception e) {
            System.out.println("ERROR: CONEXION");
        }
    }
}
