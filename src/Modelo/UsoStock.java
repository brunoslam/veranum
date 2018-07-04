package Modelo;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Created by Palma Ávila on 30-11-2015.
 */
public class UsoStock {
    private StringProperty nombreMenu;
    private IntegerProperty idInsumo;
    private StringProperty nombreInsumo;
    private IntegerProperty cantidad;

    public UsoStock(String nombreMenu, int idInsumo, String nombreInsumo, int cantidad) {
        this.nombreMenu = new SimpleStringProperty(nombreMenu);
        this.idInsumo = new SimpleIntegerProperty(idInsumo);
        this.nombreInsumo = new SimpleStringProperty(nombreInsumo);
        this.cantidad = new SimpleIntegerProperty(cantidad);
    }

    public String getNombreInsumo() {
        return nombreInsumo.get();
    }

    public StringProperty nombreInsumoProperty() {
        return nombreInsumo;
    }

    public String getNombreMenu() {
        return nombreMenu.get();
    }

    public StringProperty nombreMenuProperty() {
        return nombreMenu;
    }

    public int getIdInsumo() {
        return idInsumo.get();
    }

    public IntegerProperty idInsumoProperty() {
        return idInsumo;
    }

    public int getCantidad() {
        return cantidad.get();
    }

    public IntegerProperty cantidadProperty() {
        return cantidad;
    }
}
