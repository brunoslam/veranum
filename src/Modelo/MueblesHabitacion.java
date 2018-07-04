package Modelo;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Created by Palma Ávila on 29-11-2015.
 */
public class MueblesHabitacion {
    private IntegerProperty idMueble;
    private StringProperty nombreMueble;
    private StringProperty estadoMueble;
    private IntegerProperty precioMueble;
    private StringProperty nombreHotel;
    private IntegerProperty numeroHabitacion;
    private  StringProperty tipoMueble;

    public MueblesHabitacion(int idMueble, String nombreMueble, String estadoMueble,  int precioMueble, String nombreHotel, int numeroHabitacion, String tipoMueble) {
        this.idMueble = new SimpleIntegerProperty(idMueble);
        this.nombreMueble = new SimpleStringProperty(nombreMueble);
        this.estadoMueble = new SimpleStringProperty(estadoMueble);
        this.precioMueble = new SimpleIntegerProperty(precioMueble);
        this.nombreHotel = new SimpleStringProperty(nombreHotel);
        this.numeroHabitacion = new SimpleIntegerProperty(numeroHabitacion);
        this.tipoMueble = new SimpleStringProperty(tipoMueble);
    }

    public String getTipoMueble() {
        return tipoMueble.get();
    }

    public StringProperty tipoMuebleProperty() {
        return tipoMueble;
    }

    public int getIdMueble() {
        return idMueble.get();
    }

    public IntegerProperty idMuebleProperty() {
        return idMueble;
    }

    public String getNombreMueble() {
        return nombreMueble.get();
    }

    public StringProperty nombreMuebleProperty() {
        return nombreMueble;
    }

    public int getPrecioMueble() {
        return precioMueble.get();
    }

    public IntegerProperty precioMuebleProperty() {
        return precioMueble;
    }

    public String getNombreHotel() {
        return nombreHotel.get();
    }

    public StringProperty nombreHotelProperty() {
        return nombreHotel;
    }

    public int getNumeroHabitacion() {
        return numeroHabitacion.get();
    }

    public IntegerProperty numeroHabitacionProperty() {
        return numeroHabitacion;
    }

    public String getEstadoMueble() {
        return estadoMueble.get();
    }

    public StringProperty estadoMuebleProperty() {
        return estadoMueble;
    }
}
