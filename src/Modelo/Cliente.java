package Modelo;


import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 * Created by kaos on 23-10-15.
 */
public class Cliente {


    private final IntegerProperty idCliente;
    private final StringProperty rutCliente;
    private final StringProperty nombre;
    private final StringProperty apPaterno;
    private final StringProperty apMaterno;
    private final StringProperty emailCliente;
    private final StringProperty telefonoCliente;


    public Cliente(int idCliente, String rutCliente, String nombre, String apPaterno, String apMaterno, String emailCliente, String telefonoCliente) {
        this.idCliente = new SimpleIntegerProperty(idCliente);
        this.rutCliente = new SimpleStringProperty(rutCliente);
        this.nombre = new SimpleStringProperty(nombre);
        this.apPaterno = new SimpleStringProperty(apPaterno);
        this.apMaterno = new SimpleStringProperty(apMaterno);
        this.emailCliente = new SimpleStringProperty(emailCliente);
        this.telefonoCliente = new SimpleStringProperty(telefonoCliente);
    }


    public int getIdCliente() {
        return idCliente.get();
    }



    public String getRutCliente() {
        return rutCliente.get();
    }



    public String getNombre() {
        return nombre.get();
    }



    public String getApPaterno() {
        return apPaterno.get();
    }


    public String getApMaterno() {
        return apMaterno.get();
    }



    public String getEmailCliente() {
        return emailCliente.get();
    }


    public String getTelefonoCliente() {
        return telefonoCliente.get();
    }

}


