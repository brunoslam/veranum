package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.Habitacion;
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
 * Created by kaos on 06-11-15.
 */
public class gesRegistroEstadiaListaHabitacionController implements Initializable{


    private ObservableList<Habitacion> lista= FXCollections.observableArrayList();

    @FXML
    private TableView<Habitacion> tblHabitacion=new TableView<>();
    @FXML
    TableColumn<Habitacion,Integer> colIdhabitacion;
    @FXML
    TableColumn<Habitacion,Integer> colIdhotel;
    @FXML
    TableColumn<Habitacion,Integer> colIdtipohabitacion;
    @FXML
    TableColumn<Habitacion,Integer> colPrecio;
    @FXML
    TableColumn<Habitacion,Integer> colIdinspeccion;
    @FXML
    TableColumn<Habitacion,Integer> colNumreal;


    @FXML
    Button btnSelect;
    @FXML
    Button btnCancela;
    @FXML
    Label lblError;
    @FXML
    Label lblidhabitacion;
    @FXML
    Label lblhotel;
    @FXML
    Label lbltipohabitacion;
    @FXML
    Label lblPrecio;
    @FXML
    Label lblnumeroreal;


    private static LocalDate fechiniAct=null;
    private static LocalDate fechafinAct=null;

@Override
public  void initialize (URL url,ResourceBundle rb)
{

    colIdhabitacion.setCellValueFactory(new PropertyValueFactory<Habitacion, Integer>("idhabitacion"));
    colIdhotel.setCellValueFactory(new PropertyValueFactory<Habitacion, Integer>("idhotel"));
    colIdtipohabitacion.setCellValueFactory(new PropertyValueFactory<Habitacion, Integer>("idtipodehabitacion"));
    colPrecio.setCellValueFactory(new PropertyValueFactory<Habitacion, Integer>("precio"));
    colIdinspeccion.setCellValueFactory(new PropertyValueFactory<Habitacion, Integer>("idinspeccion"));
    colNumreal.setCellValueFactory(new PropertyValueFactory<Habitacion, Integer>("numeroreal"));

        llenarTabla(gesRegistrarEstadiaController.idHotelAct,fechiniAct,fechafinAct);




}



    public void llenarTabla(int idHotel, LocalDate fechaini, LocalDate fechafin){

       Connection con= ConexionDB.GetConnection();

        try {



            Statement st;
            ResultSet rs = null;

            String sql = "EXEC HabitacionesDisponiblesListar2 @IdHotel = "+idHotel+",@FechaInicioReserva = '"+fechaini.toString()+"', @FechaFinReserva = '"+fechafin.toString()+"';";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(

                        new Habitacion(
                                rs.getInt(1),
                                rs.getInt(2),
                                rs.getInt(3),
                                rs.getInt(4),
                                rs.getInt(5),
                                rs.getInt(6)
                        )

                );


            }


            tblHabitacion.setItems(lista);

        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;

        }


    }

    //seleccion de habitacion para "vista previa"
    @FXML
    public void clickTabla(MouseEvent t) {

        if (tblHabitacion.getSelectionModel().getSelectedItem() == null)
        {
            lblError.setText("Debe seleccionar una habitacion");


        }else
        {

            lblError.setText("");
            btnSelect.setDisable(false);
            Habitacion habitacion = tblHabitacion.getSelectionModel().getSelectedItem();

            lblidhabitacion.setText(Integer.toString(habitacion.getIdhabitacion()));
            lblhotel.setText(Integer.toString(habitacion.getIdhotel()));
            lbltipohabitacion.setText(obtenerTipoHabitacion(habitacion.getIdtipodehabitacion()));
            lblPrecio.setText(Integer.toString(habitacion.getPrecio()));
            lblnumeroreal.setText(Integer.toString(habitacion.getNumeroreal()));


        }

    }


    @FXML
    public void seleccionHabitacion(ActionEvent event) throws IOException {


        if (tblHabitacion.getSelectionModel().getSelectedItem() == null)

        {

            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Advertencia");
            alert.setHeaderText("Debe seleccionar una Habitación");
            alert.setContentText("Seleccionar correctamente habitación a reservar");

            alert.showAndWait();


        } else {
            btnSelect.setDisable(false);


            //Cliente cliente = new Cliente(2,"123123-2","Nom","Pap","Mam","eas@sasd.cl","2132132");
            //crear un objeto cliente a partir de la seleccion en la tabla
            Habitacion habitacion = tblHabitacion.getSelectionModel().getSelectedItem();


            ((Node) event.getSource()).getScene().getWindow().hide();

            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("/desktop/subVistas/gesRegistrarEstadia.fxml"));
            loader.load();
            Parent parent = loader.getRoot();
            Stage stage = new Stage();
            Scene scene = new Scene(parent);
            stage.initModality(Modality.APPLICATION_MODAL); // se inicia stage como modal para no permitir acceso a principal
            stage.setScene(scene);

            stage.setTitle("Registro Estadia");

            gesRegistrarEstadiaController registroestadiacontroller = loader.getController(); //accedo a controlador de pantalla origen
            registroestadiacontroller.setHabitacionSelec(habitacion); //paso objeto cliente

            registroestadiacontroller.setFechiniAct(fechiniAct);
            registroestadiacontroller.setfechafinAct(fechafinAct);
            registroestadiacontroller.setClienteSelec(gesRegistrarEstadiaController.clienteactual);
            registroestadiacontroller.estadoEntrada(false,false,true,true);
            stage.show();
            lista.clear();
            tblHabitacion.setItems(lista);


        }

    }

    public void btnCancela(ActionEvent event)throws Exception
    {


         ((Node) event.getSource()).getScene().getWindow().hide();

     FXMLLoader loader = new FXMLLoader();
     loader.setLocation(getClass().getResource("/desktop/subVistas/gesRegistrarEstadia.fxml"));
     loader.load();
     Parent parent = loader.getRoot();
     Stage stage = new Stage();
     Scene scene = new Scene(parent);

     stage.setScene(scene);

     stage.setTitle("Registrar Estadia");


        gesRegistrarEstadiaController registroestadiacontroller = loader.getController(); //accedo a controlador de pantalla origen

        registroestadiacontroller.estadoEntrada(true,true ,false,false);
        registroestadiacontroller.setClienteSelec(gesRegistrarEstadiaController.clienteactual);
     stage.show();
     lista.clear();
     tblHabitacion.setItems(lista);


    }


    public  static void  setFechiniAct(LocalDate fechini) {


        fechiniAct = fechini;
    }

    public  static void setfechafinAct(LocalDate fechfin) {


        fechafinAct = fechfin;
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


}
