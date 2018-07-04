package desktop.subVistas;
import Validadores.ChangeListener;
import ConexionDB.ConexionDB;
import Modelo.Cliente;
import Validadores.EmailValidator;
import Validadores.NumberTextField;
import Validadores.RutValidator;
//import javafx.beans.value.ChangeListener;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * Created by kaos on 05-10-15.
 */
public class gesRegistroPasajerosController implements Initializable {


    @FXML
    TextField txtRut;
    @FXML
    TextField txtNombre;
    @FXML
    TextField txtPaterno;
    @FXML
    TextField txtMaterno;
    @FXML
    TextField txtEmail;
    @FXML
    NumberTextField txtTelefono;
    @FXML
    Label lblErrorRut;
    @FXML
    Label lblErrorEmail;
    @FXML
    Label lblErroTodos;
    private Cliente clienteSelec;

    @Override
    public void initialize(URL url, ResourceBundle rb) {



           /* max length of text field  */
        int maxTel = 10;
        int maxRut = 10;


        /* add ChangeListner to TextField */
        txtRut.textProperty().addListener(new ChangeListener(txtRut,maxRut));
        txtTelefono.textProperty().addListener(new ChangeListener(txtTelefono, maxTel));

    }


    @FXML
    public void openListaClientes(ActionEvent event) throws Exception {



        ((Node) event.getSource()).getScene().getWindow().hide();
       Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);//se inicia stage como modal para bloquear acceso a principal

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/listaClientes.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Seleccion de Clientes ");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();


    }

    //se sobre escribe set para cargar datos en los controles de entrada
    @FXML
    public void setClienteSelec(Cliente clienteSelec) {

        txtRut.setText(clienteSelec.getRutCliente());
        txtNombre.setText(clienteSelec.getNombre());
        txtPaterno.setText(clienteSelec.getApPaterno());
        txtMaterno.setText(clienteSelec.getApMaterno());
        txtEmail.setText(clienteSelec.getEmailCliente());
        txtTelefono.setText(clienteSelec.getTelefonoCliente());

        this.clienteSelec = clienteSelec;
    }

    @FXML
    public void btnlimpiarCampos(ActionEvent event) throws Exception {
        limpiarCampos();


    }


    private void limpiarCampos() {
        txtRut.clear();
        txtNombre.clear();
        txtPaterno.clear();
        txtMaterno.clear();
        txtEmail.clear();
        txtTelefono.clear();


    }

    private void limpiarLabels() {

        lblErrorRut.setText("");
        lblErrorEmail.setText("");
        lblErroTodos.setText("");


    }

    @FXML
    public void registroPasajero(ActionEvent event) throws Exception {
        String rut, nombre, paterno, materno, email, telefono;

        rut = txtRut.getText();
        nombre = txtNombre.getText();
        paterno = txtPaterno.getText();
        materno = txtMaterno.getText();
        email = txtEmail.getText();
        telefono = txtTelefono.getText();


        Connection miConexion = ConexionDB.GetConnection();

        Statement st;
        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;

        ResultSet rs = null;
        st = miConexion.createStatement();


        RutValidator rutValidator = new RutValidator();
        EmailValidator emailValidator = new EmailValidator();


        if (txtRut.getText().equals("") || txtNombre.getText().equals("") || txtPaterno.getText().equals("") ||
                txtMaterno.getText().equals("") || txtEmail.getText().equals("") || txtTelefono.getText().equals("")) {
            System.out.print("Algun campo Vacio");
            lblErroTodos.setText("No se permiten Campos Vacios");
        } else {

            if (!rutValidator.validate(txtRut.getText().trim())) {
                System.out.print("Invalid Rut");
                lblErrorRut.setText("Rut erroneo");
            } else {
                if (!emailValidator.validate(txtEmail.getText().trim())) {
                    System.out.print("Invalid Email ID");
                    lblErrorEmail.setText("Email erroneo");

                } else {

                    try {


                        String sql = "exec ClienteCrear  @RutCliente='" + rut + "',@NombreCliente='" + nombre + "',@ApellidoPaterno='" + paterno + "',@ApellidoMaterno='" + materno + "',@EmailCliente='" + email + "',@TelefonoCliente='" + telefono + "';";
                        ps = miConexion.prepareCall(sql);
                        ps.execute();


                        Alert alert = new Alert(Alert.AlertType.INFORMATION);
                        alert.setTitle("Registro de Usuario");
                        alert.setHeaderText("Ingreso de Usuairo");
                        alert.setContentText("El usuario se ha registrado exitosamente!");

                        alert.showAndWait();


                        limpiarCampos();
                        limpiarLabels();


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
                    }//fin try conexion


                }//Fin Validacion Email

            }//fin Validacion Rut
        }//Fin valida campos vacios


    }
}

