package Clases;

import java.io.Serializable;

public class Vendedor extends Persona implements Serializable {
    public Vendedor(String nombre, String ciudad, String correo, String contacto, String password, String tipo) {
        super(nombre, ciudad, correo, contacto, password, tipo);
    }
}