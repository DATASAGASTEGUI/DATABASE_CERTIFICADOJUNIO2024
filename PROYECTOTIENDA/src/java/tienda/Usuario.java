package tienda;

import java.sql.Date;

public class Usuario {

    private int idUsuario;
    private String nombre;
    private String apellidos;
    private String username;
    private String password;
    private Date fechaNacimiento;

    public Usuario() {
        this.idUsuario = 0;
        this.nombre = "";
        this.apellidos = "";
        this.username = "";
        this.password = "";
        this.fechaNacimiento = null;
    }

    public Usuario(int idUsuario, String nombre, String apellidos, String username, String password, Date fecha_nacimiento) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.username = username;
        this.password = password;
        this.fechaNacimiento = fecha_nacimiento;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fecha_nacimiento) {
        this.fechaNacimiento = fecha_nacimiento;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", apellidos=" + apellidos + ", username=" + username + ", password=" + password + ", fecha_nacimiento=" + fechaNacimiento + '}';
    }
}
