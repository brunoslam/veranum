package Modelo;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
/**
 * Created by Palma Ávila on 01-11-2015.
 */


public class ServicioExtra{
    private IntegerProperty idServicio;
    private StringProperty nombreServicio;
    private IntegerProperty precioServicio;

    public ServicioExtra(int idServicio, String nombreServicio, int precioServicio){
        this.idServicio = new SimpleIntegerProperty(idServicio);
        this.nombreServicio = new SimpleStringProperty(nombreServicio);
        this.precioServicio = new SimpleIntegerProperty(precioServicio);
    }

    public int getIdServicio(){
        return idServicio.get();
    }

    public void setIdServicio(Integer idServicio){
        this.idServicio = new SimpleIntegerProperty(idServicio);
    }

    public String getNombreServicio(){
        return nombreServicio.get();
    }

    public void setNombreServicio(String nombreServicio){
        this.nombreServicio = new SimpleStringProperty(nombreServicio);
    }

    public int getPrecioServicio(){
        return precioServicio.get();
    }

    public void setPrecioServicio(Integer precioServicio){
        this.precioServicio = new SimpleIntegerProperty(precioServicio);
    }

    public IntegerProperty idServicioProperty(){
        return idServicio;
    }

    public StringProperty nombreServicioProperty(){
        return nombreServicio;
    }

    public IntegerProperty precioServicioProperty(){
        return precioServicio;
    }

}