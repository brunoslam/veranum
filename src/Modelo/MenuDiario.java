package Modelo;

import javafx.beans.property.*;

import java.util.Date;

/**
 * Created by Palma Ávila on 29-11-2015.
 */
public class MenuDiario {
    private IntegerProperty idMenu;
    private StringProperty nombreMenu;
    private StringProperty tipoMenu;
    private ObjectProperty<Date> fechaMenu;

    public MenuDiario(int idMenu, String nombreMenu, String tipoMenu, Date fechaMenu) {
        this.idMenu = new SimpleIntegerProperty(idMenu);
        this.nombreMenu = new SimpleStringProperty(nombreMenu);
        this.tipoMenu = new SimpleStringProperty(tipoMenu);
        this.fechaMenu = new SimpleObjectProperty<Date>(fechaMenu);
    }

    public int getIdMenu() {
        return idMenu.get();
    }

    public IntegerProperty idMenuProperty() {
        return idMenu;
    }

    public String getNombreMenu() {
        return nombreMenu.get();
    }

    public StringProperty nombreMenuProperty() {
        return nombreMenu;
    }

    public String getTipoMenu() {
        return tipoMenu.get();
    }

    public StringProperty tipoMenuProperty() {
        return tipoMenu;
    }

    public Date getFechaMenu() {
        return fechaMenu.get();
    }

    public ObjectProperty<Date> fechaMenuProperty() {
        return fechaMenu;
    }
}
