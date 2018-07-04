package Modelo;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Created by Palma Ávila on 08-11-2015.
 */
public class Hab {
    private IntegerProperty idhabitacion;
    private StringProperty nombreHotel;
    private StringProperty tipoHabitacion;
    private IntegerProperty precio;
    private StringProperty resolucionSanitaria;
    private IntegerProperty numeroreal;

    public Hab(int idhabitacion, String nombreHotel, String tipoHabitacion, int precio, String resolucionSanitaria, int numeroreal) {
        this.idhabitacion = new SimpleIntegerProperty(idhabitacion);
        this.nombreHotel = new SimpleStringProperty(nombreHotel);
        this.tipoHabitacion = new SimpleStringProperty(tipoHabitacion);
        this.precio = new SimpleIntegerProperty(precio);
        this.resolucionSanitaria = new SimpleStringProperty(resolucionSanitaria);
        this.numeroreal = new SimpleIntegerProperty(numeroreal);
    }

    public int getIdhabitacion() {
        return idhabitacion.get();
    }

    public IntegerProperty idhabitacionProperty() {
        return idhabitacion;
    }

    public void setIdhabitacion(int idhabitacion) {
        this.idhabitacion.set(idhabitacion);
    }

    public String getNombreHotel() {
        return nombreHotel.get();
    }

    public StringProperty nombreHotelProperty() {
        return nombreHotel;
    }

    public void setNombreHotel(String nombreHotel) {
        this.nombreHotel.set(nombreHotel);
    }

    public String getTipoHabitacion() {
        return tipoHabitacion.get();
    }

    public StringProperty tipoHabitacionProperty() {
        return tipoHabitacion;
    }

    public void setTipoHabitacion(String tipoHabitacion) {
        this.tipoHabitacion.set(tipoHabitacion);
    }

    public int getPrecio() {
        return precio.get();
    }

    public IntegerProperty precioProperty() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio.set(precio);
    }

    public String getResolucionSanitaria() {
        return resolucionSanitaria.get();
    }

    public StringProperty resolucionSanitariaProperty() {
        return resolucionSanitaria;
    }

    public void setResolucionSanitaria(String resolucionSanitaria) {
        this.resolucionSanitaria.set(resolucionSanitaria);
    }

    public int getNumeroreal() {
        return numeroreal.get();
    }

    public IntegerProperty numerorealProperty() {
        return numeroreal;
    }

    public void setNumeroreal(int numeroreal) {
        this.numeroreal.set(numeroreal);
    }
}
