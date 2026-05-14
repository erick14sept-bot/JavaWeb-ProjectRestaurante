package Clases;

import java.io.Serializable;

public class Plato implements Serializable {
    private String codigoPlato;
    private String nombrePlato;
    private String descripcion;
    private double precio;
    private String categoria;

    public Plato(String codigoPlato, String nombrePlato, String descripcion, double precio, String categoria) {
        this.codigoPlato = codigoPlato;
        this.nombrePlato = nombrePlato;
        this.descripcion = descripcion;
        this.precio = precio;
        this.categoria = categoria;
    }

    public String getCodigoPlato() { return codigoPlato; }
    public String getNombrePlato() { return nombrePlato; }
    public String getDescripcion() { return descripcion; }
    public double getPrecio() { return precio; }
    public String getCategoria() { return categoria; }
}