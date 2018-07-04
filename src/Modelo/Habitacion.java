package Modelo;

/**
 * Created by Palma Avila on 03/11/2015.
 */
import javafx.beans.property.*;


public class Habitacion {
    private IntegerProperty idhabitacion;
    private IntegerProperty idhotel;
    private IntegerProperty idtipodehabitacion;
    private IntegerProperty precio;
    private IntegerProperty idinspeccion;
    private IntegerProperty numeroreal;

    //private StringProperty nombreHotel;
    //private StringProperty tipoHabitacion;
    //private StringProperty resolucionSanitaria;

    public Habitacion(int idhabitacion, int idhotel, int idtipodehabitacion,
                      int precio, int idinspeccion, int numeroreal) {
        this.idhabitacion = new SimpleIntegerProperty(idhabitacion);
        this.idhotel = new SimpleIntegerProperty(idhotel);
        this.idtipodehabitacion = new SimpleIntegerProperty(idtipodehabitacion);
        this.precio = new SimpleIntegerProperty(precio);
        this.idinspeccion = new SimpleIntegerProperty(idinspeccion);
        this.numeroreal = new SimpleIntegerProperty(numeroreal);



    }


    public int getIdhabitacion() {
        return idhabitacion.get();
    }

    public IntegerProperty idhabitacionProperty() {
        return idhabitacion;
    }

    public int getIdhotel() {
        return idhotel.get();
    }

    public IntegerProperty idhotelProperty() {
        return idhotel;
    }

    public int getIdtipodehabitacion() {
        return idtipodehabitacion.get();
    }

    public IntegerProperty idtipodehabitacionProperty() {
        return idtipodehabitacion;
    }

    public int getPrecio() {
        return precio.get();
    }

    public IntegerProperty precioProperty() {
        return precio;
    }

    public int getIdinspeccion() {
        return idinspeccion.get();
    }

    public IntegerProperty idinspeccionProperty() {
        return idinspeccion;
    }

    public int getNumeroreal() {
        return numeroreal.get();
    }

    public IntegerProperty numerorealProperty() {
        return numeroreal;
    }
}