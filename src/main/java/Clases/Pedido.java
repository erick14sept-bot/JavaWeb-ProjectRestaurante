package Clases;
import java.util.ArrayList;

public class Pedido {
    private String idVenta;
    private Cliente cliente;
    private double total;
    private ArrayList<Plato> items;

   
    public Pedido() {
        this.items = new ArrayList<>();
        this.total = 0;
    }

    public Pedido(String idVenta, Cliente cliente) {
        this.idVenta = idVenta;
        this.cliente = cliente;
        this.items = new ArrayList<>();
        this.total = 0; 
    }


    public void agregarPlato(Plato p) {
        this.items.add(p);
        this.total += p.getPrecio();
    }

    public ArrayList<Plato> getItems() {
        return items;
    }

    public String getIdVenta() { return idVenta; }
    public void setIdVenta(String idVenta) { this.idVenta = idVenta; }

    public Cliente getCliente() { return cliente; }
    public void setCliente(Cliente cliente) { this.cliente = cliente; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
}