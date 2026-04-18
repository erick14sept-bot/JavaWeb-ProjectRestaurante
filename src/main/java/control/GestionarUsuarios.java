package control;

import Clases.Persona;
import java.util.ArrayList;

public class GestionarUsuarios {
    private ArrayList<Persona> listaUsuarios;

    public GestionarUsuarios(ArrayList<Persona> listaExistente) {
        if (listaExistente == null) {
            this.listaUsuarios = new ArrayList<>();
        } else {
            this.listaUsuarios = listaExistente;
        }
    }

    public Persona validarLogin(String correo, String password) {
        for (Persona u : listaUsuarios) {
            if (u.getCorreo().equalsIgnoreCase(correo) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }

    public void agregarOEditarUsuario(Persona p) {
        boolean encontrado = false;
        for (int i = 0; i < listaUsuarios.size(); i++) {
            if (listaUsuarios.get(i).getCorreo().equalsIgnoreCase(p.getCorreo())) {
                listaUsuarios.set(i, p); 
                encontrado = true;
                break;
            }
        }
        if (!encontrado) {
            listaUsuarios.add(p); 
        }
    }

    public void eliminarUsuario(String correo) {
        for (int i = 0; i < listaUsuarios.size(); i++) {
            if (listaUsuarios.get(i).getCorreo().equalsIgnoreCase(correo)) {
                listaUsuarios.remove(i);
                break;
            }
        }
    }

    public ArrayList<Persona> getLista() {
        return listaUsuarios;
    }
}