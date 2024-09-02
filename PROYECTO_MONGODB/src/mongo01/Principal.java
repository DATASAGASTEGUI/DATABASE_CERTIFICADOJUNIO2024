package mongo01;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.Document;
import java.util.Arrays;

public class Principal {

    public static void main(String[] args) {
        String databaseName = "campusfp";
        String serverName = "localhost";//127.0.0.1
        int puerto = 27017;

        // Crear la conexión al servidor de MongoDB
        MongoClient mc = new MongoClient(serverName, puerto);

        // Obtener la base de datos
        MongoDatabase database = mc.getDatabase(databaseName);

        System.out.println("OK: CONEXION");

        // Obtener la colección "alumno"
        MongoCollection<Document> alumno = database.getCollection("alumno");

        // 1. OBTENER EL NUMERO DE DOCUMENTOS DE LA COLECCION
        long cantidadDocumentos = alumno.countDocuments();
        System.out.println("Cantidad Documentos: " + cantidadDocumentos);

        // 2. MOSTRAR TODOS LOS DOCUMENTOS DE LA COLECCION
        try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                System.out.println(doc.toJson());
            }
        }
        /*
        // 3. INSERTAR UN DOCUMENTO
        Document documento = new Document();
        
        documento.append("_id", "A6");
        documento.append("nombre", "Carlos");
        documento.append("edad", 23);
        documento.append("estatura", 1.72);
        documento.append("jobis", Arrays.asList("Futbool", "Tenis"));

        alumno.insertOne(documento);
        System.out.println("Documento insertado correctamente.");
        
        // 2. MOSTRAR TODOS LOS DOCUMENTOS DE LA COLECCION
        try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                System.out.println(doc.toJson());
            }
        }
        */
        

        // 4. MOSTRAR DOCUMENTO POR CAMPOS
        Document resultado = alumno.find(Filters.eq("_id", "A6")).first();
        if (resultado != null) {
            System.out.println("Mostrando documento por campos:");
            System.out.println("ID: " + resultado.getString("_id"));
            System.out.println("Nombre: " + resultado.getString("nombre"));
            System.out.println("Edad: " + resultado.getInteger("edad"));
            System.out.println("Estatura: " + resultado.getDouble("estatura"));
            System.out.println("Jobis: " + resultado.get("jobis"));
        }



        // 5. ACTUALIZAR UN DOCUMENTO
        alumno.updateOne(
                Filters.eq("_id", "A6"),
                Updates.set("nombre", "Carlos Actualizado")
        );
                // 2. MOSTRAR TODOS LOS DOCUMENTOS DE LA COLECCION
        try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            while (cursor.hasNext()) {
                Document doc = cursor.next();
                System.out.println(doc.toJson());
            }
        }
        System.out.println("Documento actualizado correctamente.");



        // 6. ELIMINAR UN DOCUMENTO
        alumno.deleteOne(Filters.eq("_id", "A6"));
        System.out.println("Documento eliminado correctamente.");
        
        alumno.deleteMany(Filters.eq("nombre", "Luis"));
        System.out.println("Documento eliminado correctamente.");
        
    }
}
