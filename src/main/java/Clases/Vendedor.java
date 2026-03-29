package Clases;



public class Vendedor extends Persona {

    String password;
    String tipoEmpleado;
    
    public Vendedor() {
        super();
    }

    public Vendedor(String nombre, String ciudad, String correo, String contacto, String password, String tipoEmpleado) {
    super(nombre, ciudad, correo, contacto);
    this.password = password;
    this.tipoEmpleado = tipoEmpleado;
}
    public String getTipoEmpleado() { 
        return tipoEmpleado; 
    }
    public String getPassword() { 
        return password; 
    }
    public void setCiudad(String ciudad) {
    this.ciudad = ciudad;
}

public void setCorreo(String correo) {
    this.correo = correo;
}

public void setContacto(String contacto) {
    this.contacto = contacto;
}
public void setPassword(String password) {
    this.password = password;
}
public void setTipoEmpleado(String tipoEmpleado) {
    this.tipoEmpleado = tipoEmpleado;
}
}