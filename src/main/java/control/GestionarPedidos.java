package control;

import Clases.Pedido;
import java.util.ArrayList;

public class GestionarPedidos {
    private ArrayList<Pedido> historialVentas;

    public GestionarPedidos(ArrayList<Pedido> historialExistente) {
        this.historialVentas = (historialExistente != null) ? historialExistente : new ArrayList<>();
    }

    public void registrarVenta(Pedido ventaFinalizada) {
        historialVentas.add(ventaFinalizada);
    }

    public double calcularRecaudacionTotal() {
        double granTotal = 0;
        for (Pedido p : historialVentas) {
            granTotal += p.getTotal();
        }
        return granTotal;
    }

    public ArrayList<Pedido> getHistorial() {
        return historialVentas;
    }
}