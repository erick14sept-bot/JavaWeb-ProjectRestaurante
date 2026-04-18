package control;

import Clases.Plato;
import java.util.ArrayList;

public class GestionarPlatos {
    private ArrayList<Plato> lista;

    public GestionarPlatos(ArrayList<Plato> listaExistente) {
        this.lista = (listaExistente != null) ? listaExistente : new ArrayList<>(); 
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
        if (!encontrado) {
            lista.add(p);
        }
    }

    public ArrayList<Plato> getLista() {
        return lista; 
    }
}