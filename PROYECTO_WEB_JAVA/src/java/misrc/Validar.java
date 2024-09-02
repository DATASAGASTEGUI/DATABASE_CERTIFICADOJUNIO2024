package misrc;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

public class Validar {

    public static boolean edad(String edad) {
        String er = "[0-9]+";
        boolean correcto = edad.matches(er) && Integer.parseInt(edad) > 0
                && Integer.parseInt(edad) < 150;
        return correcto;
    }

    public static boolean estatura(String estatura) {
        String er = "[012]{1}\\.[0-9]{2}";    //1.72
        boolean correcto = estatura.matches(er);
        return correcto;
    }

    public static boolean nombre(String nombre) {
        String er = "[a-zA-ZñÑáéíóú]+";
        boolean correcto = nombre.matches(er);
        return correcto;
    }

    public static String idAlumno(MongoCollection<Document> alumno) {
        String clave = "";
        try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            Document doc = null;
            while (cursor.hasNext()) {
                doc = cursor.next();
            }
            String idAlumno = doc.getString("idAlumno");
            int numero = Integer.parseInt(idAlumno.substring(1)) + 1;
            clave = "A" + numero;
        }
        return clave;
    }
}
