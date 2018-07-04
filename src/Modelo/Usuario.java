package Modelo;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Created by kaos on 02-11-15.
 */
public class Usuario {


    private final IntegerProperty idusuario;
    private final StringProperty nombreusuario;
    private final IntegerProperty idcliente;
    private final IntegerProperty idrol;
    private final StringProperty password;


    public Usuario(int idusuario, String nombreusuario, int idcliente, int idrol, String password) {
        this.idusuario = new SimpleIntegerProperty(idusuario);
        this.nombreusuario = new SimpleStringProperty(nombreusuario);
        this.idcliente = new SimpleIntegerProperty(idcliente);
        this.idrol = new SimpleIntegerProperty(idrol);
        this.password = new SimpleStringProperty(password);
    }


    public int getIdusuario() {
        return idusuario.get();
    }

    public IntegerProperty idusuarioProperty() {
        return idusuario;
    }

    public String getNombreusuario() {
        return nombreusuario.get();
    }

    public StringProperty nombreusuarioProperty() {
        return nombreusuario;
    }

    public int getIdcliente() {
        return idcliente.get();
    }

    public IntegerProperty idclienteProperty() {
        return idcliente;
    }

    public int getIdrol() {
        return idrol.get();
    }

    public IntegerProperty idrolProperty() {
        return idrol;
    }

    public String getPassword() {
        return password.get();
    }

    public StringProperty passwordProperty() {
        return password;
    }
}
