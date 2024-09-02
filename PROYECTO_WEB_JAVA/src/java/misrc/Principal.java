package misrc;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

public class Principal {

    public static void main(String[] args) {
        String databaseName = "campusfp";
        String serverName = "localhost";
        int puerto = 27017;

        // Create MongoDB client
        MongoClient mc = new MongoClient(serverName, puerto);
        MongoDatabase database = mc.getDatabase(databaseName);
        MongoCollection<Document> alumno = database.getCollection("alumno");

        List<String> identificadores_al = new ArrayList<>();

        try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            Document doc = null;
            while (cursor.hasNext()) {
                doc = cursor.next();
                System.out.println(doc);
            }
            System.out.println(doc);
            String idAlumno = doc.getString("idAlumno");
            System.out.println(idAlumno);
            int numero = Integer.parseInt(idAlumno.substring(1))+1;
            String clave = "A" + numero;
            System.out.println(clave);
        }
    }

}
