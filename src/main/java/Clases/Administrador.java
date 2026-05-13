package Clases;

import java.io.Serializable;

public class Administrador extends Persona implements Serializable {
    public Administrador(String nombre, String ciudad, String correo, String contacto, String password, String tipo) {
        super(nombre, ciudad, correo, contacto, password, tipo);
    }
}