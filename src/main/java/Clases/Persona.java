package Clases;

import java.io.Serializable;

public abstract class Persona implements Serializable {
    protected String nombre;
    protected String ciudad;
    protected String correo;
    protected String contacto;
    protected String password;
    protected String tipo;

    public Persona(String nombre, String ciudad, String correo, String contacto, String password, String tipo) {
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.correo = correo;
        this.contacto = contacto;
        this.password = password;
        this.tipo = tipo;
    }

    public String getNombre() { return nombre; }
    public String getCiudad() { return ciudad; }
    public String getCorreo() { return correo; }
    public String getContacto() { return contacto; }
    public String getPassword() { return password; }
    public String getTipo() { return tipo; }
}