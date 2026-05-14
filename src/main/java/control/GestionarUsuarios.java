package control;

import Clases.Administrador;
import Clases.Persona;
import Clases.Vendedor;
import java.io.*;
import java.util.ArrayList;

public class GestionarUsuarios {
    private ArrayList<Persona> listaUsuarios;
    private String rutaArchivo = "C:\\FoodExpress\\usuarios.txt";

    public GestionarUsuarios() {
        this.listaUsuarios = leerArchivo();
    }

    public void escribirArchivo() {
        File archivo = new File(rutaArchivo);

        if (!archivo.getParentFile().exists()) {
            archivo.getParentFile().mkdirs();
        }

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo, false))) {
            for (Persona u : listaUsuarios) {
                String tipo = (u instanceof Administrador) ? "Administrador" : "Vendedor";
                bw.write(tipo + "," + u.getNombre() + "," + u.getCiudad() + "," + 
                         u.getCorreo() + "," + u.getContacto() + "," + u.getPassword());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private ArrayList<Persona> leerArchivo() {
        File archivo = new File(rutaArchivo);
        ArrayList<Persona> listaLocal = new ArrayList<>();
        if (!archivo.exists()) return listaLocal;

        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] campos = linea.split(",");
                if (campos.length >= 6) {
                    if (campos[0].equals("Administrador")) {
                        listaLocal.add(new Administrador(campos[1], campos[2], campos[3], campos[4], campos[5], campos[0]));
                    } else {
                        listaLocal.add(new Vendedor(campos[1], campos[2], campos[3], campos[4], campos[5], campos[0]));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return listaLocal;
    }

    public Persona validarLogin(String correo, String password) {
        for (Persona u : listaUsuarios) {
            if (u.getCorreo().equalsIgnoreCase(correo) && u.getPassword().equals(password)) return u;
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
        if (!encontrado) listaUsuarios.add(p);
        escribirArchivo();
    }

    public void eliminarUsuario(String correo) {
        listaUsuarios.removeIf(u -> u.getCorreo().equalsIgnoreCase(correo));
        escribirArchivo();
    }

    public ArrayList<Persona> getLista() { return listaUsuarios; }
}