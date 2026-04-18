package Clases;

public class Plato {

    String codigoPlato;
    String nombrePlato;
    String descripcion;
    double precio;
    String categoria;


    public Plato(String codigoPlato, String nombrePlato, String descripcion, double precio, String categoria) {

        this.codigoPlato = codigoPlato;
        this.nombrePlato = nombrePlato;
        this.descripcion = descripcion;
        this.precio = precio;
        this.categoria = categoria;
    }

    public String getNombrePlato() { return nombrePlato; }
    public double getPrecio() { return precio; }
    public String getCodigoPlato() { return codigoPlato; }
    public String getDescripcion () { return descripcion; }
    public String getCategoria() { return categoria; }
    
    public void setNombrePlato(String nombre) { this.nombrePlato = nombre; }
    public void setPrecio(double precio) { this.precio = precio; }
    public void setDescripcion(String desc) { this.descripcion = desc; }
    public void setCategoria(String cat) { this.categoria = cat; }

    
}
