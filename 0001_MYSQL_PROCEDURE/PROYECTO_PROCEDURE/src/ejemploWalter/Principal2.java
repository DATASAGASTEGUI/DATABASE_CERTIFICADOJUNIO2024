package ejemploWalter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;

public class Principal2 {

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
        String createTrigger = leerTriggerDesdeArchivo();
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

    public static String leerTriggerDesdeArchivo() {
        File f;
        FileReader fr;
        BufferedReader br;

        String nra = "dataWalter/querys.sql";
        String fila = "";

        StringBuilder cadena = new StringBuilder();
        try {
            f = new File(nra);
            fr = new FileReader(f);
            br = new BufferedReader(fr);

            while ((fila = br.readLine()) != null) {
                cadena.append(fila).append("\n");
                System.out.println(cadena);
            }
        } catch (Exception e) {
            cadena = null;
        }
        return cadena.toString();
    }

}
