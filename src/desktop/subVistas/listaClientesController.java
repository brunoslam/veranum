package desktop.subVistas;


import desktop.subVistas.gesRegistroPasajerosController;
import ConexionDB.ConexionDB;
import Modelo.Cliente;
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
import java.sql.*;
import java.util.Optional;
import java.util.ResourceBundle;

/**
 * Created by kaos on 23-10-15.
 */
public class listaClientesController implements Initializable {



    private ObservableList<Cliente> lista=FXCollections.observableArrayList();

    @FXML
    private TableView<Cliente> tblListaClientes=new TableView<>();
    @FXML
    TableColumn<Cliente,Integer> colId;
    @FXML
    TableColumn<Cliente,String> colRut;
    @FXML
    TableColumn<Cliente,String> colNombre;
    @FXML
    TableColumn<Cliente,String> colApPaterno;
    @FXML
    TableColumn<Cliente,String> colApMaterno;
    @FXML
    TableColumn<Cliente,String> colEmail;
    @FXML
    TableColumn<Cliente,String> colTelefono;
    @FXML
    Label lblRut;
    @FXML
    Label lblNombre;
    @FXML
    Label lblPaterno;
    @FXML
    Label lblMaterno;






    @Override
    public void initialize(URL url, ResourceBundle rb) {


        colId.setCellValueFactory(new PropertyValueFactory<Cliente, Integer>("idCliente"));
        colRut.setCellValueFactory(new PropertyValueFactory<Cliente, String>("rutCliente"));
        colNombre.setCellValueFactory(new PropertyValueFactory<Cliente, String>("nombre"));
        colApPaterno.setCellValueFactory(new PropertyValueFactory<Cliente, String>("apPaterno"));
        colApMaterno.setCellValueFactory(new PropertyValueFactory<Cliente, String>("apMaterno"));
        colEmail.setCellValueFactory(new PropertyValueFactory<Cliente, String>("emailCliente"));
        colTelefono.setCellValueFactory(new PropertyValueFactory<Cliente, String>("telefonoCliente"));

        llenarTabla();
    }


    public void llenarTabla(){

        Connection con= ConexionDB.GetConnection();

        try {



            Statement st;
            ResultSet rs = null;

            String sql = "exec ClienteListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(

                        new Cliente(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getString(6),
                                rs.getString(7)

                        )

                );


            }


            tblListaClientes.setItems(lista);

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

    @FXML
    public void seleccionUsuario(ActionEvent event) throws IOException {


        if (tblListaClientes.getSelectionModel().getSelectedItem() == null)

        {

            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Advertencia");
            alert.setHeaderText("Debe seleccionar un cliente");
            alert.setContentText("Seleccionar correctamente cliente a Modificar");

            alert.showAndWait();


        } else {


            //Cliente cliente = new Cliente(2,"123123-2","Nom","Pap","Mam","eas@sasd.cl","2132132");
            //crear un objeto cliente a partir de la seleccion en la tabla
            Cliente cliente = tblListaClientes.getSelectionModel().getSelectedItem();


            ((Node) event.getSource()).getScene().getWindow().hide();

            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("/desktop/subVistas/gesRegistroPasajeros.fxml"));
            loader.load();
            Parent parent = loader.getRoot();
            Stage stage = new Stage();
            Scene scene = new Scene(parent);
            stage.initModality(Modality.APPLICATION_MODAL); // se inicia stage como modal para no permitir acceso a principal
            stage.setScene(scene);

            stage.setTitle("Admin Veranum");

            gesRegistroPasajerosController registroPasajerosController = loader.getController(); //accedo a controlador de pantalla origen
            registroPasajerosController.setClienteSelec(cliente); //paso objeto cliente


            stage.show();
            lista.clear();
            tblListaClientes.setItems(lista);


        }

    }



    //seleccion de cliente para "vista previa"
    @FXML
    public void clickTabla(MouseEvent t) {

        Cliente cliente = tblListaClientes.getSelectionModel().getSelectedItem();
        lblRut.setText(cliente.getRutCliente());
        lblNombre.setText(cliente.getNombre());
        lblPaterno.setText(cliente.getApPaterno());
        lblMaterno.setText(cliente.getApMaterno());

    }



    @FXML
    public  void eliminaCliente(ActionEvent event)throws Exception
    {

        if (tblListaClientes.getSelectionModel().getSelectedItem()==null)

        {

            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Advertencia");
            alert.setHeaderText("Debe seleccionar un cliente");
            alert.setContentText("Seleccionar correctamente cliente a eliminar");

            alert.showAndWait();




        }else
        {


            //Inicio ventana confirmacion
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setTitle("Confirmación Eliminacion Cliente");
            alert.setHeaderText("Atención, esta seguro de querer eliminar un cliente?\n Esta acción no se puede deshacer");
            alert.setContentText("Escoja su opción.");

            Optional<ButtonType> result=alert.showAndWait();

            //fin ventana confirmacion


        if (result.get() == ButtonType.OK )  {
            //se obtiene datos del cliente seleccionado
            Cliente cliente = tblListaClientes.getSelectionModel().getSelectedItem();

            int id =cliente.getIdCliente();

            Connection miConexion = ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;

            ResultSet rs = null;
            st = miConexion.createStatement();

            try {


                String sql = "EXEC ClientEliminar @IdCliente ="+id+";";
                ps = miConexion.prepareCall(sql);
                ps.execute();

                //ventana informacion cliente eliminado
                Alert alertEliminacion = new Alert(Alert.AlertType.INFORMATION);
                alertEliminacion.setTitle("Eliminacion Cliente");
                alertEliminacion.setHeaderText("Eliminación Cliente");
                alertEliminacion.setContentText("El Cliente se ha eliminado exitosamente!");
                alertEliminacion.showAndWait();




                lista.clear();
                tblListaClientes.setItems(lista);

                //se cargan nuevamente parametros y limpian datos anteriores
                llenarTabla();
                lblRut.setText("");
                lblNombre.setText("");
                lblPaterno.setText("");
                lblMaterno.setText("");



            } catch (Exception ex) {
                //  System.out.println(ex.getMessage());

                Alert alertError = new Alert(Alert.AlertType.ERROR);
                alertError.setTitle("Error Dialog");
                alertError.setHeaderText("Ha ocurrido un error");
                alertError.setContentText(ex.getMessage());

                alertError.showAndWait();
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
            }




        }
        else {
            // ... user chose CANCEL or closed the dialog


        }

    }

    }





 @FXML
    public void canceltoRegistro(ActionEvent event)throws Exception{

     ((Node) event.getSource()).getScene().getWindow().hide();

     FXMLLoader loader = new FXMLLoader();
     loader.setLocation(getClass().getResource("/desktop/subVistas/gesRegistroPasajeros.fxml"));
     loader.load();
     Parent parent = loader.getRoot();
     Stage stage = new Stage();
     Scene scene = new Scene(parent);

     stage.setScene(scene);

     stage.setTitle("Admin Veranum");

     stage.show();
     lista.clear();
     tblListaClientes.setItems(lista);

 }



}