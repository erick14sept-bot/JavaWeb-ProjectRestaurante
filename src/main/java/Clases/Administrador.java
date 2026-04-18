package Clases;

public class Administrador extends Persona {

    private String tipoEmpleado;
    private String password;

    public Administrador() {
        super();
    }

    public Administrador(String nombre, String ciudad, String correo, String contacto, String password, String tipoEmpleado) {
        super(nombre, ciudad, correo, contacto);
        this.tipoEmpleado = tipoEmpleado;
        this.password = password;
    }

    public String getTipoEmpleado() {
        return tipoEmpleado;
    }

    public void setTipoEmpleado(String tipoEmpleado) {
        this.tipoEmpleado = tipoEmpleado;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}