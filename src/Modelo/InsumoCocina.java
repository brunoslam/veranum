package Modelo;

import javafx.beans.property.*;

import java.util.Date;
/**
 * Created by Palma Avila on 22-11-2015.
 */
public class InsumoCocina {

    private StringProperty nombreHotel;
    private IntegerProperty idInsumo;
    private StringProperty nombreInsumo;
    private IntegerProperty cantidadInsumo;
    private IntegerProperty cantidadInsumoIdeal;
    private ObjectProperty<Date> fecha;

    public InsumoCocina(String nombreHotel, int idInsumo, String nombreInsumo, int cantidadInsumo, int cantidadInsumoIdeal, Date fecha) {
        this.nombreHotel = new SimpleStringProperty(nombreHotel);
        this.idInsumo = new SimpleIntegerProperty(idInsumo);
        this.nombreInsumo = new SimpleStringProperty(nombreInsumo);
        this.cantidadInsumo = new SimpleIntegerProperty(cantidadInsumo);
        this.cantidadInsumoIdeal = new SimpleIntegerProperty(cantidadInsumoIdeal);
        this.fecha = new SimpleObjectProperty<Date>(fecha);
    }

    public String getNombreHotel() {
        return nombreHotel.get();
    }

    public StringProperty nombreHotelProperty() {
        return nombreHotel;
    }

    public int getIdInsumo() {
        return idInsumo.get();
    }

    public IntegerProperty idInsumoProperty() {
        return idInsumo;
    }

    public String getNombreInsumo() {
        return nombreInsumo.get();
    }

    public StringProperty nombreInsumoProperty() {
        return nombreInsumo;
    }

    public int getCantidadInsumo() {
        return cantidadInsumo.get();
    }

    public IntegerProperty cantidadInsumoProperty() {
        return cantidadInsumo;
    }

    public int getCantidadInsumoIdeal() {
        return cantidadInsumoIdeal.get();
    }

    public IntegerProperty cantidadInsumoIdealProperty() {
        return cantidadInsumoIdeal;
    }

    public Date getFecha() {
        return fecha.get();
    }

    public ObjectProperty<Date> fechaProperty() {
        return fecha;
    }
}
