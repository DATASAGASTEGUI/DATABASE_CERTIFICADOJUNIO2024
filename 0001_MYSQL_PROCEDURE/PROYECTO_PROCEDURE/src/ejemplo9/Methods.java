package ejemplo9;

import java.sql.*;
import javax.swing.*;

public class Methods {

    public static Connection obtainConnection() {
        String url = "jdbc:mysql://localhost:3306/BDTRANSACCIONES";
        String user = "root";
        String key = "12345678";
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url, user, key);
        } catch (SQLException e) {
            connection = null;
        }
        return connection;
    }

    public static boolean userExists(Connection connection, String user) {
        String query = "SELECT COUNT(*) FROM mysql.user WHERE user = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println("Error checking user: " + e.getMessage());
        }
        return false;
    }

    public static void createUser(Connection connection, String username, String password) {
        String query = "CREATE USER ?@'localhost' IDENTIFIED BY ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            int affectedRow = ps.executeUpdate();
            if (affectedRow >= 0) {
                JOptionPane.showMessageDialog(null, "User " + username + " created successfully.", "Information", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null, "User " + username + " not created.", "Information", JOptionPane.INFORMATION_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error not expected", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void showUsers(Connection connection, DefaultListModel dlm) {
        String query = "SELECT user FROM mysql.user";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String user = rs.getString("user");
                dlm.addElement(user);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error not expected", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void showPrivileges(Connection connection, DefaultListModel dlm) {
        String[] privileges = {
            "ALL PRIVILEGES", "SELECT", "INSERT", "UPDATE", "DELETE",
            "CREATE", "DROP", "ALTER", "INDEX", "EXECUTE"
        };

        // Clear the current list model to avoid duplicates
        dlm.clear();

        // Add privileges to the DefaultListModel
        for (String privilege : privileges) {
            dlm.addElement(privilege);
        }
    }

    public static void deleteUser(Connection connection, String username, DefaultListModel dlm, JList lstDisplay) {
        String query = "DROP USER ?@'localhost'";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
            int i = lstDisplay.getSelectedIndex();
            dlm.remove(i);

            JOptionPane.showMessageDialog(null, "User " + username + " deleted successfully.", "Information", JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error not expected", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void grantPrivileges(Connection connection, String username, String[] privileges) {
        String query = "";
        PreparedStatement ps = null;
        String s = "";
        for (String privilege : privileges) {
            s = s + privilege + ",";
        }
        s = s.substring(0, s.length() - 1);
        System.out.println("Privileges: " + s);
        query = "GRANT " + s + " ON BDTRANSACCIONES.* TO '" + username + "'@'localhost';";
        try {
            ps = connection.prepareStatement(query);
            ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error not expected", "Error", JOptionPane.ERROR_MESSAGE);
        }

        String flushQuery = "FLUSH PRIVILEGES";
        try {
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(flushQuery);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error not expected", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // 5. revokePrivileges
    public static void revokePrivileges(Connection connection, String username, String[] privileges) {
        String query = "";
        PreparedStatement ps = null;
        String s = "";
        for (String privilege : privileges) {
            s = s + privilege + ",";
        }
        s = s.substring(0, s.length() - 1);
        System.out.println("Privileges: " + s);
        query = "REVOKE " + s + " ON BDTRANSACCIONES.* FROM '" + username + "'@'localhost';";
        try {
            ps = connection.prepareStatement(query);
            ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error not expected", "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    public static void displayPrivileges(Connection connection, String username, DefaultListModel dlmTP) {
        String query = "SHOW GRANTS FOR '" + username + "'@'localhost';";
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            dlmTP.clear();  // Limpiamos la lista de privilegios previamente mostrada

            while (rs.next()) {
                // Cada fila contiene una declaración de privilegio como 'GRANT SELECT, INSERT ON ...'
                String grant = rs.getString(1);
                System.out.println("Grant: " + grant);

                // Extraemos solo los privilegios de la cadena del 'GRANT' usando una expresión regular
                // Buscamos la parte que viene después de 'GRANT ' y antes de 'ON'
                String privilegesPart = grant.substring(grant.indexOf("GRANT ") + 6, grant.indexOf(" ON"));

                // Separamos los privilegios por comas y espacios para obtener cada uno
                String[] privilegesArray = privilegesPart.split(",\\s*");

                // Agregamos cada privilegio individualmente a la lista
                for (String privilege : privilegesArray) {
                    dlmTP.addElement(privilege.trim());
                }
            }

            // Informamos al usuario que los privilegios fueron recuperados

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error retrieving privileges.", "Error", JOptionPane.ERROR_MESSAGE);
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
