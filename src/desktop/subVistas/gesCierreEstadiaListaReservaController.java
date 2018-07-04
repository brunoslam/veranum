package desktop.subVistas;


import ConexionDB.ConexionDB;
import Modelo.Habitacion;
import Modelo.Reserva;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ResourceBundle;

/**
 * Created by kaos on 22-11-15.
 */
public class gesCierreEstadiaListaReservaController implements  Initializable{

   private ObservableList<Reserva> lista = FXCollections.observableArrayList();



    @FXML
    Label lblNhabitacion;
    @FXML
    Label lblTipohabitacion;
    @FXML
    Label lbldateCrea;
    @FXML
    Label lbldateIni;
    @FXML
    Label lbldateFin;
    @FXML
    Label lblPrecioDiario;
    @FXML
    Label lblPrecioFinal;
    @FXML
    Label lblError;
    @FXML
    Button btnSelect;
    @FXML
    Button btnCancel;

    @FXML
    DatePicker dateCrea;

    @FXML
    private TableView<Reserva> tblReserva = new TableView<>();
    @FXML
    TableColumn<Reserva, Integer> colId;
    @FXML
    TableColumn<Reserva, Integer> colIdhotel;
    @FXML
    TableColumn<Reserva, Integer> colIdHabitacion;
    @FXML
    TableColumn<Reserva, Integer> colPrecioDiario;
    @FXML
    TableColumn<Reserva, LocalDate>conFechaCrea;
    @FXML
    TableColumn<Reserva, LocalDate>colFechaini;
    @FXML
    TableColumn<Reserva, LocalDate>colFechaFin;
    @FXML
    TableColumn<Reserva, Integer> colCantPersona;
    @FXML
    TableColumn<Reserva, Integer> colPrecioFinal;


    @Override
    public void initialize(URL url, ResourceBundle rb){

        colId.setCellValueFactory(new PropertyValueFactory<Reserva, Integer>("idreserva"));
        colIdhotel.setCellValueFactory(new PropertyValueFactory<Reserva, Integer>("idhotel"));
        colIdHabitacion.setCellValueFactory(new PropertyValueFactory<Reserva, Integer>("idhabitacion"));
        colPrecioDiario.setCellValueFactory(new PropertyValueFactory<Reserva, Integer>("preciofinaldiario"));
        conFechaCrea.setCellValueFactory(new PropertyValueFactory<Reserva, LocalDate>("fechacreacion"));
        colFechaini.setCellValueFactory(new PropertyValueFactory<Reserva, LocalDate>("fechainicioreserva"));
        colFechaFin.setCellValueFactory(new PropertyValueFactory<Reserva, LocalDate>("fechafinreserva"));
        colCantPersona.setCellValueFactory(new PropertyValueFactory<Reserva, Integer>("cantpersonas"));
        colPrecioFinal.setCellValueFactory(new PropertyValueFactory<Reserva, Integer>("preciofinal"));

        llenarTabla();
    }



    public void llenarTabla() {

        Connection con = ConexionDB.GetConnection();
        int idCliente=gesCierreEstadiaController.clienteactual.getIdCliente();

        try {


            Statement st;
            ResultSet rs = null;

            String sql = "EXEC ReservasPorClienteObtenerSinPagar @IdCliente ="+idCliente+";";
            rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {

                lista.add(

                        new Reserva(
                                rs.getInt(1),
                                rs.getInt(2),
                                rs.getInt(3),
                                rs.getInt(4),
                                rs.getInt(5),
                                rs.getDate(6),
                                rs.getDate(7),
                                rs.getDate(8),
                                rs.getInt(9),
                                rs.getInt(10),
                                rs.getInt(11),
                                rs.getInt(12),
                                rs.getString(13),
                                rs.getInt(14)

                        )

                );


            }


            tblReserva.setItems(lista);

        } catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con = null;

        }


    }

    @FXML
    public void clickTabla(MouseEvent t) {


        if (tblReserva.getSelectionModel().getSelectedItem() == null)
        {

            lblError.setText("Debe seleccionar una reserva");

        }else {

            lblError.setText("");
            btnSelect.setDisable(false);
            Reserva reserva = tblReserva.getSelectionModel().getSelectedItem();

            Habitacion habitacion = obtenDatosHabitacion(reserva.getIdhotel(),reserva.getIdhabitacion());

            lblNhabitacion.setText(Integer.toString(habitacion.getNumeroreal()));
            lblTipohabitacion.setText(obtenerTipoHabitacion(habitacion.getIdtipodehabitacion()));

            lbldateCrea.setText(reserva.getFechacreacion().toString());
            lbldateIni.setText(reserva.getFechainicioreserva().toString());
            lbldateFin.setText(reserva.getFechafinreserva().toString());
            lblPrecioDiario.setText(Integer.toString(reserva.getPreciofinaldiario()));
            lblPrecioFinal.setText(Integer.toString(reserva.getPreciofinal()));



        }
    }


    public Habitacion obtenDatosHabitacion (int idHotel, int idHabitacion){

        Habitacion hab=null;

        Connection con= ConexionDB.GetConnection();


        try {



            Statement st;
            ResultSet rs = null;

            String sql = "select * from Habitacion where IdHabitacion="+idHabitacion+" and IdHotel="+idHotel+";";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){



                Habitacion habitacion=     new Habitacion(
                                rs.getInt(1),
                                rs.getInt(2),
                                rs.getInt(3),
                                rs.getInt(4),
                                rs.getInt(5),
                                rs.getInt(6)
                        );


            hab=habitacion;


            }




        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;

        }


        return hab;
    }

    public String obtenerTipoHabitacion (int idTipohabitacion){

        String tipoh=null;

        Connection con= ConexionDB.GetConnection();


        try {



            Statement st;
            ResultSet rs = null;

            String sql = "select NombreTipoHabitacion from TipoHabitacion where IdTipoHabitacion="+idTipohabitacion+";";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                String tip=rs.getString(1);


            tipoh=tip;


            }




        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;

        }


        return tipoh;
    }



    @FXML
    public void seleccionReserva(ActionEvent event) throws IOException {


        if (tblReserva.getSelectionModel().getSelectedItem() == null)

        {

            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Advertencia");
            alert.setHeaderText("Error");
            alert.setContentText("Seleccionar correctamente una reservar");

            alert.showAndWait();


        } else {


            //Cliente cliente = new Cliente(2,"123123-2","Nom","Pap","Mam","eas@sasd.cl","2132132");
            //crear un objeto cliente a partir de la seleccion en la tabla
            Reserva reserva = tblReserva.getSelectionModel().getSelectedItem();


            ((Node) event.getSource()).getScene().getWindow().hide();

            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("/desktop/subVistas/gesCierreEstadia.fxml"));
            loader.load();
            Parent parent = loader.getRoot();
            Stage stage = new Stage();
            Scene scene = new Scene(parent);
            stage.initModality(Modality.APPLICATION_MODAL); // se inicia stage como modal para no permitir acceso a principal
            stage.setScene(scene);

            stage.setTitle("Cierre Estadia");

            gesCierreEstadiaController  gesCierreEstadia = loader.getController(); //accedo a controlador de pantalla origen
            gesCierreEstadia.setReserva(reserva);
            gesCierreEstadia.setClienteSelec(gesCierreEstadia.clienteactual);//paso objeto cliente

            gesCierreEstadia.estadoVentana(true,true,true,true);

            stage.show();
            lista.clear();
            tblReserva.setItems(lista);


        }

    }

    public void btnCancela(ActionEvent event) throws Exception {


        ((Node) event.getSource()).getScene().getWindow().hide();

        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/desktop/subVistas/gesCierreEstadia.fxml"));
        loader.load();
        Parent parent = loader.getRoot();
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);

        stage.setTitle("Admin Veranum");

        gesCierreEstadiaController cierreEstadiaController = loader.getController(); //accedo a controlador de pantalla origen


        cierreEstadiaController.setClienteSelec(cierreEstadiaController.clienteactual);
        cierreEstadiaController.estadoVentana(false,true,false,false);
        stage.show();
        lista.clear();
        tblReserva.setItems(lista);

    }


}
