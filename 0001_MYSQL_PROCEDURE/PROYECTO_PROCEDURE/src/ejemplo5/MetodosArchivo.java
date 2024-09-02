package ejemplo5;

import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;

public class MetodosArchivo {

    public static String leerQueryTrigger() {
        File f;
        FileReader fr;
        BufferedReader br;

        String nra = "data/querys.sql";
        String fila = "";

        StringBuilder cadena = new StringBuilder();
        try {
            f = new File(nra);
            fr = new FileReader(f);
            br = new BufferedReader(fr);

            while ((fila = br.readLine()) != null) {
                cadena.append(fila).append("\n");
                //System.out.println(cadena);
            }

        } catch (Exception e) {

        }
        return cadena.toString();
    }

}
