package Modelo;

import javafx.beans.property.*;

public class Hotel {
    private IntegerProperty idHotel;
    private StringProperty nombreRegion;
    private StringProperty nombreCiudad;
    private StringProperty nombreUbicacion;
    private StringProperty nombreHotel;
    private IntegerProperty nroHabVip;
    private IntegerProperty nroHabBusiness;
    private IntegerProperty nroHabClassic;


    public Hotel(int idHotel, String nombreRegion,
                 String nombreCiudad, String nombreUbicacion,
                 String nombreHotel, int nroHabVip,
                 int nroHabBusiness, int nroHabClassic) {
        this.idHotel = new SimpleIntegerProperty(idHotel);
        this.nombreRegion = new SimpleStringProperty(nombreRegion);
        this.nombreCiudad = new SimpleStringProperty(nombreCiudad);
        this.nombreUbicacion = new SimpleStringProperty(nombreUbicacion);
        this.nombreHotel = new SimpleStringProperty(nombreHotel);
        this.nroHabVip = new SimpleIntegerProperty(nroHabVip);
        this.nroHabBusiness = new SimpleIntegerProperty(nroHabBusiness);
        this.nroHabClassic = new SimpleIntegerProperty(nroHabClassic);
    }


    public int getIdHotel() {
        return idHotel.get();
    }

    public IntegerProperty idHotelProperty() {
        return idHotel;
    }

    public String getNombreRegion() {
        return nombreRegion.get();
    }

    public StringProperty nombreRegionProperty() {
        return nombreRegion;
    }

    public String getNombreCiudad() {
        return nombreCiudad.get();
    }

    public StringProperty nombreCiudadProperty() {
        return nombreCiudad;
    }

    public String getNombreUbicacion() {
        return nombreUbicacion.get();
    }

    public StringProperty nombreUbicacionProperty() {
        return nombreUbicacion;
    }

    public String getNombreHotel() {
        return nombreHotel.get();
    }

    public StringProperty nombreHotelProperty() {
        return nombreHotel;
    }

    public int getNroHabVip() {
        return nroHabVip.get();
    }

    public IntegerProperty nroHabVipProperty() {
        return nroHabVip;
    }

    public int getNroHabBusiness() {
        return nroHabBusiness.get();
    }

    public IntegerProperty nroHabBusinessProperty() {
        return nroHabBusiness;
    }

    public int getNroHabClassic() {
        return nroHabClassic.get();
    }

    public IntegerProperty nroHabClassicProperty() {
        return nroHabClassic;
    }
}