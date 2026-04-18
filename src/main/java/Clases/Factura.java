package Clases;

import java.util.Date;

public class Factura {

    Date fecha;
    double totalVenta;
    Pedido pedido;

    public Factura(Pedido pedido){
        this.fecha = new Date();
        this.pedido = pedido;
    }

    public double getTotalVenta(){
        return totalVenta;
    }
}
