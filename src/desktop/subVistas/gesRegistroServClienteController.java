package desktop.subVistas;

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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * Created by kaos on 07-12-15.
 */
public class gesRegistroServClienteController implements Initializable{



    private ObservableList<Cliente> lista = FXCollections.observableArrayList();
    @FXML
    private TableView<Cliente> tblListaClientes = new TableView<>();
    @FXML
    TableColumn<Cliente, Integer> colId;
    @FXML
    TableColumn<Cliente, String> colRut;
    @FXML
    TableColumn<Cliente, String> colNombre;
    @FXML
    TableColumn<Cliente, String> colApPaterno;
    @FXML
    TableColumn<Cliente, String> colApMaterno;
    @FXML
    TableColumn<Cliente, String> colEmail;
    @FXML
    TableColumn<Cliente, String> colTelefono;

    @FXML
    Label lblRut;
    @FXML
    Label lblNombre;
    @FXML
    Label lblPaterno;
    @FXML
    Label lblMaterno;
    @FXML
    Button btnSelect;
    @FXML
    Button btnCancela;
    @FXML
    Label lblError;



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


    public void llenarTabla() {

        Connection con = ConexionDB.GetConnection();

        try {


            Statement st;
            ResultSet rs = null;

            String sql = "EXEC ClienteListar;";
            rs = con.createStatement().executeQuery(sql);

            while (rs.next()) {

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


        if (tblListaClientes.getSelectionModel().getSelectedItem() == null)
        {

            lblError.setText("Debe seleccionar un cliente");

        }else {

            lblError.setText("");
            btnSelect.setDisable(false);
            Cliente cliente = tblListaClientes.getSelectionModel().getSelectedItem();
            lblRut.setText(cliente.getRutCliente());
            lblNombre.setText(cliente.getNombre());
            lblPaterno.setText(cliente.getApPaterno());
            lblMaterno.setText(cliente.getApMaterno());
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
            loader.setLocation(getClass().getResource("/desktop/subVistas/gesRegistroServExtra.fxml"));
            loader.load();
            Parent parent = loader.getRoot();
            Stage stage = new Stage();
            Scene scene = new Scene(parent);
            stage.initModality(Modality.APPLICATION_MODAL); // se inicia stage como modal para no permitir acceso a principal
            stage.setScene(scene);

            stage.setTitle("Registro Servicios");

            gesRegistroServExtraController  registroServicios = loader.getController(); //accedo a controlador de pantalla origen
            registroServicios.setClienteSelec(cliente); //paso objeto cliente
            registroServicios.estadoVentana(false, true, false, false);


            stage.show();
            lista.clear();
            tblListaClientes.setItems(lista);


        }

    }


    public void btnCancela(ActionEvent event) throws Exception {


        ((Node) event.getSource()).getScene().getWindow().hide();

        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("/desktop/subVistas/gesRegistroServExtra.fxml"));
        loader.load();
        Parent parent = loader.getRoot();
        Stage stage = new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);
        gesRegistroServExtraController  registroServicios = loader.getController();
        registroServicios.estadoVentana(true,false,false,false);
        stage.setTitle("Admin Veranum");

        stage.show();
        lista.clear();
        tblListaClientes.setItems(lista);

    }
}
