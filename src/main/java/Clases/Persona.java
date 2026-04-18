
package Clases;

public class Persona {

    String nombre;
    String ciudad;
    String correo;
    String contacto;
    String password;
    
    public Persona() {
}

    public Persona(String nombre, String ciudad,String correo, String contacto) {

        this.nombre = nombre;
        this.ciudad = ciudad;
        this.correo = correo;
        this.contacto = contacto;
    }

    public String getNombre() { return nombre; }
    public String getCiudad() { return ciudad; }
    public String getCorreo() {return correo; }
    public String getContacto() { return contacto; }
    public String getPassword() { return password; }
    
    public void setNombre(String nombre) { this.nombre = nombre; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }
    public void setContacto(String contacto) { this.contacto = contacto; }
    public void setPassword(String password) { this.password = password; }
    public void setCorreo(String correo) { this.correo = correo; }
}