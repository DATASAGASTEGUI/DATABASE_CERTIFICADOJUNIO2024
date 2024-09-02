package mongo02;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

public class ConexionMongodb {

    // Atributo de la conexión
    private static MongoClient mongoClient;
    private static MongoDatabase mongoDatabase;

    // Parámetros de la conexión
    private static final String DATABASE = "campusfp";
    private static final String SERVERNAME = "localhost";
    private static final int PORT = 27017;

    // Método para establecer la conexión
    public static void setConexion(boolean flag) {
        if (flag) {
            // Usar MongoClient de la versión 3.x
            MongoClientURI uri = new MongoClientURI("mongodb://" + SERVERNAME + ":" + PORT);
            mongoClient = new MongoClient(uri);
            mongoDatabase = mongoClient.getDatabase(DATABASE);
        } else {
            if (mongoClient != null) {
                mongoClient.close();  // Cerrar la conexión
                mongoDatabase = null;
            }
        }
    }

    // Método para obtener la conexión a la base de datos
    public static MongoDatabase getConexion() {
        return mongoDatabase;
    }
}
