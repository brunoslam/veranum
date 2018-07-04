package Modelo;

import javafx.beans.property.*;

import java.util.Date;

/**
 * Created by kaos on 04-11-15.
 */
public class Reserva {


    private final IntegerProperty idreserva;
    private final IntegerProperty idcliente;
    private final IntegerProperty idhotel;
    private final IntegerProperty idhabitacion;
    private final IntegerProperty preciofinaldiario;
    private final ObjectProperty<Date> fechacreacion;
    private final ObjectProperty<Date> fechainicioreserva;
    private final ObjectProperty<Date> fechafinreserva;
    private final IntegerProperty cantpersonas;
    private final IntegerProperty preciofinal;
    private final IntegerProperty cantadultos;
    private final IntegerProperty cantmenores;
    private final StringProperty estadoreserva;

    private final IntegerProperty totalcancelado;


    public Reserva(int idreserva, int idcliente, int idhotel,
                   int idhabitacion, int preciofinaldiario,
                   Date fechacreacion, Date fechainicioreserva,
                   Date fechafinreserva, int cantpersonas, int preciofinal,
                   int cantadultos, int cantmenores, String estadoreserva, int totalcancelado) {

        this.idreserva = new SimpleIntegerProperty(idreserva);
        this.idcliente = new SimpleIntegerProperty(idcliente);
        this.idhotel = new SimpleIntegerProperty(idhotel);
        this.idhabitacion = new SimpleIntegerProperty(idhabitacion);
        this.preciofinaldiario = new SimpleIntegerProperty(preciofinaldiario);
        this.fechacreacion = new SimpleObjectProperty<Date>(fechacreacion);
        this.fechainicioreserva = new SimpleObjectProperty<Date>(fechainicioreserva);
        this.fechafinreserva = new SimpleObjectProperty<Date>(fechafinreserva);
        this.cantpersonas = new SimpleIntegerProperty(cantpersonas);
        this.preciofinal = new SimpleIntegerProperty(preciofinal);
        this.cantadultos = new SimpleIntegerProperty(cantadultos);
        this.cantmenores = new SimpleIntegerProperty(cantmenores);
        this.estadoreserva = new SimpleStringProperty(estadoreserva);
        this.totalcancelado=new SimpleIntegerProperty(totalcancelado);

    }

    public int getIdreserva() {
        return idreserva.get();
    }

    public IntegerProperty idreservaProperty() {
        return idreserva;
    }

    public int getIdcliente() {
        return idcliente.get();
    }

    public IntegerProperty idclienteProperty() {
        return idcliente;
    }

    public int getIdhotel() {
        return idhotel.get();
    }

    public IntegerProperty idhotelProperty() {
        return idhotel;
    }

    public int getIdhabitacion() {
        return idhabitacion.get();
    }

    public IntegerProperty idhabitacionProperty() {
        return idhabitacion;
    }

    public int getPreciofinaldiario() {
        return preciofinaldiario.get();
    }

    public IntegerProperty preciofinaldiarioProperty() {
        return preciofinaldiario;
    }

    public Date getFechacreacion() {
        return fechacreacion.get();
    }

    public ObjectProperty<Date> fechacreacionProperty() {
        return fechacreacion;
    }

    public Date getFechainicioreserva() {
        return fechainicioreserva.get();
    }

    public ObjectProperty<Date> fechainicioreservaProperty() {
        return fechainicioreserva;
    }

    public Date getFechafinreserva() {
        return fechafinreserva.get();
    }

    public ObjectProperty<Date> fechafinreservaProperty() {
        return fechafinreserva;
    }

    public int getCantpersonas() {
        return cantpersonas.get();
    }

    public IntegerProperty cantpersonasProperty() {
        return cantpersonas;
    }

    public int getPreciofinal() {
        return preciofinal.get();
    }

    public IntegerProperty preciofinalProperty() {
        return preciofinal;
    }

    public int getCantadultos() {
        return cantadultos.get();
    }

    public IntegerProperty cantadultosProperty() {
        return cantadultos;
    }

    public int getCantmenores() {
        return cantmenores.get();
    }

    public IntegerProperty cantmenoresProperty() {
        return cantmenores;
    }

    public String getEstadoreserva() {
        return estadoreserva.get();
    }

    public StringProperty estadoreservaProperty() {
        return estadoreserva;
    }






    public int getTotalcancelado() {
        return totalcancelado.get();
    }

    public IntegerProperty totalcanceladoProperty() {
        return totalcancelado;
    }
}