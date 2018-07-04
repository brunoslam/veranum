package Modelo;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Created by kaos on 09-11-15.
 */
public class TipoHabitacion {

    private IntegerProperty idtipohabitacion;
    private StringProperty nombretipohabitacion;
    private IntegerProperty capacidadpersonas;


    public TipoHabitacion(int idtipohabitacion, String nombretipohabitacion, int capacidadpersonas) {
        this.idtipohabitacion = new SimpleIntegerProperty(idtipohabitacion);
        this.nombretipohabitacion = new SimpleStringProperty(nombretipohabitacion);
        this.capacidadpersonas = new SimpleIntegerProperty(capacidadpersonas);



    }


    public int getIdtipohabitacion() {
        return idtipohabitacion.get();
    }

    public IntegerProperty idtipohabitacionProperty() {
        return idtipohabitacion;
    }

    public String getNombretipohabitacion() {
        return nombretipohabitacion.get();
    }

    public StringProperty nombretipohabitacionProperty() {
        return nombretipohabitacion;
    }

    public int getCapacidadpersonas() {
        return capacidadpersonas.get();
    }

    public IntegerProperty capacidadpersonasProperty() {
        return capacidadpersonas;
    }
}
