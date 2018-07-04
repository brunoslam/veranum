package Modelo;

import javafx.beans.property.*;

import java.util.Date;

/**
 * Created by Palma Ávila on 14-11-2015.
 */
public class InspeccionSanitaria {
    private IntegerProperty idInspeccion;
    private StringProperty resolucionSanitaria;
    private ObjectProperty<Date> fechaResolucion;
    private StringProperty nombreHotel;
    private IntegerProperty numeroHabitacion;
    private StringProperty tipoHabitacion;

    public InspeccionSanitaria(int idInspeccion, String resolucionSanitaria, Date fechaResolucion, String nombreHotel, int numeroHabitacion, String tipoHabitacion) {
        this.idInspeccion = new SimpleIntegerProperty(idInspeccion);
        this.resolucionSanitaria = new SimpleStringProperty(resolucionSanitaria);
        this.fechaResolucion = new SimpleObjectProperty<Date>(fechaResolucion);
        this.nombreHotel = new SimpleStringProperty(nombreHotel);
        this.numeroHabitacion = new SimpleIntegerProperty(numeroHabitacion);
        this.tipoHabitacion = new SimpleStringProperty(tipoHabitacion);
    }


    public int getIdInspeccion() {
        return idInspeccion.get();
    }

    public IntegerProperty idInspeccionProperty() {
        return idInspeccion;
    }

    public String getResolucionSanitaria() {
        return resolucionSanitaria.get();
    }

    public StringProperty resolucionSanitariaProperty() {
        return resolucionSanitaria;
    }

    public Date getFechaResolucion() {
        return fechaResolucion.get();
    }

    public ObjectProperty<Date> fechaResolucionProperty() {
        return fechaResolucion;
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

    public String getTipoHabitacion() {
        return tipoHabitacion.get();
    }

    public StringProperty tipoHabitacionProperty() {
        return tipoHabitacion;
    }
}
