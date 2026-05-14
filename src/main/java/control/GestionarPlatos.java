package control;

import Clases.Plato;
import java.io.*;
import java.util.ArrayList;

public class GestionarPlatos {
    private ArrayList<Plato> lista;
    private String rutaArchivo = "C:\\FoodExpress\\platos.txt";

    public GestionarPlatos() {
        this.lista = leerArchivo();
    }

    public void escribirArchivo() {
    File archivo = new File(rutaArchivo);
    if (!archivo.getParentFile().exists()) {
        archivo.getParentFile().mkdirs();
    }


    try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo, false))) {
        for (Plato p : lista) {
            bw.write(p.getCodigoPlato() + "," + p.getNombrePlato() + "," + 
                     p.getDescripcion() + "," + p.getPrecio() + "," + p.getCategoria());
            bw.newLine();
        }

    } catch (IOException e) {
        e.printStackTrace(); 
    }
}

    private ArrayList<Plato> leerArchivo() {
        File archivo = new File(rutaArchivo);
        ArrayList<Plato> listaLocal = new ArrayList<>();
        if (!archivo.exists()) return listaLocal;

        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] campos = linea.split(",");
                if (campos.length >= 5) {
                    listaLocal.add(new Plato(campos[0], campos[1], campos[2], Double.parseDouble(campos[3]), campos[4]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return listaLocal;
    }

    public void agregarOEditar(Plato p) {
        boolean encontrado = false;
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getCodigoPlato().equals(p.getCodigoPlato())) {
                lista.set(i, p); 
                encontrado = true; 
                break;
            }
        }
        if (!encontrado) lista.add(p);
        escribirArchivo();
    }

    public void eliminarPlato(String codigo) {
        lista.removeIf(p -> p.getCodigoPlato().equals(codigo));
        escribirArchivo();
    }

    public ArrayList<Plato> getLista() { return lista; }
}