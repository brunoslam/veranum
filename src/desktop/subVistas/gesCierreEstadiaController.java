package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.Cliente;
import Modelo.Reserva;
import Modelo.ServicioExtra;
import Validadores.NumberTextField;
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
import java.util.ListIterator;
import java.util.ResourceBundle;

/**
 * Created by kaos on 19-11-15.
 */
public class gesCierreEstadiaController implements Initializable {

    public static Cliente clienteactual;
    public static Reserva reservaactual;
    public static int totalEstadia;
    public static int totalServicios;
    public static int danios;
    public static int montoTotal;
    @FXML
    Button btnSeleccionCliente;
    @FXML
    Button btnSelReserva;
    @FXML
    Button btnCancelar;
    @FXML
    Button btnLimpiar;
    @FXML
    Button btnGuardar;
    @FXML
    Label lblCliente;
    @FXML
    Label lblEstadia;
    @FXML
    TableColumn<ServicioExtra, Integer> idservicio;
    @FXML
    TableColumn<ServicioExtra, String> nombreservicio;
    @FXML
    TableColumn<ServicioExtra, Integer> precioservicio;
    @FXML
    Label lblTotalEstadia;
    @FXML
    Label lblTotalExtras;
    @FXML
    Label lblDanios;
    @FXML
    Label lblTotal;
    @FXML
    Label lblError;

    @FXML
    NumberTextField txtMontoCancelado;

    private ObservableList<ServicioExtra> listaServExtra = FXCollections.observableArrayList();
    @FXML
    private TableView<ServicioExtra> tblServExtra = new TableView<>();

    @Override
    public void initialize(URL url, ResourceBundle rb){

        idservicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, Integer>("idServicio"));
        nombreservicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, String>("nombreServicio"));
        precioservicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, Integer>("precioServicio"));


    }




    @FXML
    public void seleccionarCliente (ActionEvent event) throws Exception
    {



        ((Node) event.getSource()).getScene().getWindow().hide();
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);//se inicia stage como modal para bloquear acceso a principal

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesCierreEstadiaListaCliente.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Seleccion de Clientes ");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }


    @FXML
    public void setClienteSelec(Cliente clienteSelec) {

        this.clienteactual = clienteSelec;
        lblCliente.setText(clienteactual.getNombre() + " " + clienteactual.getApPaterno() + " " + clienteactual.getApMaterno());

    }


    @FXML
    public void setReserva(Reserva reserva) {

        this.reservaactual = reserva;


        int diasEstadia= daysBetween(reservaactual.getFechainicioreserva(),reservaactual.getFechafinreserva());


        lblEstadia.setText("ID: "+reservaactual.getIdreserva() + " Precio Diario: "+reservaactual.getPreciofinaldiario()+" Dias: "+diasEstadia);
        llenarServiciosExtra();
        realizarCalculos();


    }

    public int daysBetween(Date d1, Date d2){
        return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
    }

    public void llenarServiciosExtra(){

        Connection con = ConexionDB.GetConnection();
        int idReserva=gesCierreEstadiaController.reservaactual.getIdreserva();

        try {


            Statement st;
            ResultSet rs = null;

            String sql = "EXEC Reserva_Servicio_ListarporReserva @IdReserva ="+idReserva+";";
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


            tblServExtra.setItems(listaServExtra);

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
    public void seleccionarReserva (ActionEvent event) throws Exception
    {



        ((Node) event.getSource()).getScene().getWindow().hide();
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);//se inicia stage como modal para bloquear acceso a principal

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesCierreEstadiaListaReserva.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Seleccion de Reserva ");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }


    public void realizarCalculos (){


        totalEstadia=reservaactual.getPreciofinal();
        totalServicios=0;
        danios=obtenerMontodaños(reservaactual.getIdreserva());

        ListIterator<ServicioExtra> li =listaServExtra.listIterator();


        while (li.hasNext())
        {   ServicioExtra servi= li.next();
            totalServicios=totalServicios+servi.getPrecioServicio();
        }

        lblTotalEstadia.setText(Integer.toString(totalEstadia));
        lblTotalExtras.setText(Integer.toString(totalServicios));
        lblDanios.setText(Integer.toString(danios));

        montoTotal=totalEstadia+totalServicios+danios;

        lblTotal.setText(Integer.toString(montoTotal));





    }



    public int obtenerMontodaños( int idReserva) {
        int monto = 0;

        Connection miConexion = ConexionDB.GetConnection();

        Statement st = null;
        ResultSet rs = null;


        try {


            st = miConexion.createStatement();


            st = miConexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            rs = st.executeQuery("exec listarDaniosporReserva @IdReserva=" + idReserva + ";");
            rs.last();
            int encontrado = rs.getRow();
            monto = rs.getInt(1);

        } catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            miConexion = null;

        } finally {
            if (rs != null) try {
                rs.close();
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
        }


  return monto;
}

 @FXML
 public void btnGuardarCheckout(ActionEvent event) throws Exception{

     int montoIngresado=0;

     montoIngresado=Integer.parseInt(txtMontoCancelado.getText());

     if (montoIngresado >= montoTotal){

        if(montoIngresado>montoTotal){

            int vuelto = 0;

            vuelto = montoIngresado-montoTotal;

            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Atención");
            alert.setHeaderText(null);
            alert.setContentText("Monto ingresado excede el cobro, entregar :$"+vuelto+" como diferencia");

            alert.showAndWait();
            inserCheckout(montoIngresado,reservaactual.getIdreserva());

        }else if(montoIngresado==montoTotal){


            inserCheckout(montoIngresado,reservaactual.getIdreserva());
        }



     }else{


         lblError.setText("Debe Ingresar un monto igual o superior al total");


     }



 }


    public void estadoVentana(boolean cliente, boolean estadia, boolean servextra, boolean cobros){

        if (cliente){
            btnSeleccionCliente.setDisable(false);
        }else {
            btnSeleccionCliente.setDisable(true);
        }

        if(estadia){
            btnSelReserva.setDisable(false);

        }else{

            btnSelReserva.setDisable(true);
        }
        if(servextra){
            tblServExtra.setDisable(false);

        }else
        {
            tblServExtra.setDisable(true);

        }

        if(cobros)
        {
            txtMontoCancelado.setDisable(false);
           // btnLimpiar.setDisable(false);
            btnGuardar.setDisable(false);

        }else{
            txtMontoCancelado.setDisable(true);
            //btnLimpiar.setDisable(true);
            btnGuardar.setDisable(true);

        }




    }


    @FXML
    public void limpiarCampos ()
    {

         clienteactual=null;
         reservaactual=null;
         totalEstadia=0;
         totalServicios=0;
        danios=0;
         montoTotal=0;
        clienteactual=null;
        lblCliente.setText("");
        lblEstadia.setText("");
        lblTotalEstadia.setText("");
        lblTotalExtras.setText("");
        lblTotal.setText("");
        txtMontoCancelado.setText("");

        estadoVentana(true, false, false, false);
        lblError.setText("");

    }


@FXML
public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }


    public void inserCheckout(int totalCancelado, int idReserva)
    {

        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;


        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;




        try {

            st = miConexion.createStatement();
            String sql = "exec ReservaCerrar @IdReserva="+idReserva+",@TotalCancelado="+totalCancelado+";";
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
            limpiarCampos();
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
            alert.setHeaderText("Cierre de estadia");
            alert.setContentText("La Estadia se a cerrado correctamente");

            alert.showAndWait();
        }//fin try conexion




    }


}
