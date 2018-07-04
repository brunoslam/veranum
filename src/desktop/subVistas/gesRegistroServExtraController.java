package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.Cliente;
import Modelo.Reserva;
import Modelo.ServicioExtra;
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
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.ResourceBundle;

/**
 * Created by kaos on 19-11-15.
 */
public class gesRegistroServExtraController implements Initializable{
    private ObservableList<ServicioExtra> listaServExtra = FXCollections.observableArrayList();
    public static Cliente clienteactual;
    public static Reserva reservaactual;

    @FXML
    private TableView<ServicioExtra> tblservicios = new TableView<>();

    @FXML
    TableColumn<ServicioExtra, Integer> idservicio;
    @FXML
    TableColumn<ServicioExtra, String> nombreservicio;
    @FXML
    TableColumn<ServicioExtra, Integer> precioservicio;

    @FXML
    Label txtReserva;
    @FXML
    Label txtcliente;
    @FXML
    Button btnSelReserva;
    @FXML
    Button btnSelCliente;
    @FXML
    Button btnLimpiar;
    @FXML
    Button btnGuardar;
    @FXML
    Button btnCancelar;


    @Override
    public void initialize(URL url, ResourceBundle rb){

        idservicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, Integer>("idServicio"));
        nombreservicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, String>("nombreServicio"));
        precioservicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, Integer>("precioServicio"));


    }

    public void seleccionarCliente (ActionEvent event) throws Exception
    {
        ((Node) event.getSource()).getScene().getWindow().hide();
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);//se inicia stage como modal para bloquear acceso a principal

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesRegistroServCliente.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Seleccion de Cliente ");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }

    @FXML
    public void setClienteSelec(Cliente clienteSelec) {

        this.clienteactual = clienteSelec;
        txtcliente.setText(clienteactual.getNombre() + " " + clienteactual.getApPaterno() + " " + clienteactual.getApMaterno());

    }


    @FXML
    public void setReserva(Reserva reserva) {

        this.reservaactual = reserva;


        int diasEstadia= daysBetween(reservaactual.getFechainicioreserva(),reservaactual.getFechafinreserva());


        txtReserva.setText("ID: "+reservaactual.getIdreserva() + " Precio Diario: "+reservaactual.getPreciofinaldiario()+" Dias: "+diasEstadia);
        llenarServiciosExtra();



    }

    public int daysBetween(Date d1, Date d2){
        return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
    }

    @FXML
    public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }


    @FXML
    public void seleccionarReserva (ActionEvent event) throws Exception
    {

        ((Node) event.getSource()).getScene().getWindow().hide();
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);//se inicia stage como modal para bloquear acceso a principal

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesSerExtraReserva.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Seleccion de Reserva ");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }


  public void llenarServiciosExtra(){

        Connection con = ConexionDB.GetConnection();


        try {


            Statement st;
            ResultSet rs = null;

            String sql = "select * from Servicio;";
            rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {

                listaServExtra.add(

                        new ServicioExtra(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getInt(3)

                        )

                );


            }


            tblservicios.setItems(listaServExtra);

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

public void estadoVentana (boolean cliente, boolean reserva, boolean servicios, boolean botones){

    if (cliente){

        btnSelCliente.setDisable(false);
    }else{
        btnSelCliente.setDisable(true);
    }

    if(reserva){
        btnSelReserva.setDisable(false);
    }else {
        btnSelReserva.setDisable(true);
    }

    if(servicios){

        tblservicios.setDisable(false);
    }else {

        tblservicios.setDisable(true);
    }

    if(botones){
        btnGuardar.setDisable(false);
    }else{
        btnGuardar.setDisable(true);
    }


}

    @FXML
    public void btnGuardaServ(ActionEvent event) throws Exception{


        if(tblservicios.getSelectionModel().getSelectedItem() == null){

            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Advertencia");
            alert.setHeaderText("Debe seleccionar un servicio");
            alert.setContentText("Seleccionar correctamente servicio extra a ingresar a reserva");

            alert.showAndWait();

        }else
        {
            ServicioExtra servextra= tblservicios.getSelectionModel().getSelectedItem();

            try{
            inserServExtra(reservaactual.getIdreserva(),servextra.getIdServicio());
            }catch (Exception ex){

                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error Dialog");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText(ex.getMessage());

                alert.showAndWait();

            }finally {
                limpiarCampos();

            }
        }



    }

    public void inserServExtra(int idReserva, int idServicio)
    {

        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;


        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;




        try {

            st = miConexion.createStatement();
            String sql = "exec Reserva_Servicio_Crear @IdReserva="+idReserva+",@IdServicio="+idServicio+";";
            ps = miConexion.prepareCall(sql);
            ps.execute();






        } catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            miConexion = null;

        } finally {
            if (ps != null) try {
                ps.close();
            } catch (Exception e) {
            }
            if (st != null) try {
                st.close();
            } catch (Exception e) {
            }
            if (miConexion != null) try {
                miConexion.close();
            } catch (Exception e) {
            }

            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Informacion ");
            alert.setHeaderText("Reserva servicio");
            alert.setContentText("El registro de servicio extra se ha realizado correctamente");

            alert.showAndWait();
        }//fin try conexion




    }


    public void limpiarCampos()
    {
            txtcliente.setText("");
            txtReserva.setText("");
            clienteactual=null;
            reservaactual=null;
            listaServExtra.clear();
            tblservicios.setItems(listaServExtra);
            estadoVentana(true,false,false,false);


    }



}
