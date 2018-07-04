package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.InsumoCocina;
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
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ResourceBundle;
import java.util.Date;

/**
 * Created by Palma Avila on 29-11-2015.
 */
public class invInsumoCocinaController implements Initializable {
    private String nombreHotel, nombreInsumo;
    private int idInsumo, cantidadExistente, cantidadIdeal;
    private LocalDate fechaIngreso;
    private InsumoCocina insumoSeleccionado = null;
    @FXML ComboBox<String> cmbHotel;
    @FXML DatePicker dpFecha = new DatePicker();
    @FXML TextField txtNombreInsumo;
    @FXML NumberTextField txtCantidadExistente;
    @FXML NumberTextField txtCantidadIdeal;

    @FXML TableColumn<InsumoCocina, String> colNombreHotel;
    @FXML TableColumn<InsumoCocina, String> colNombreInsumo;
    @FXML TableColumn<InsumoCocina, Integer> colCantIdeal;
    @FXML TableColumn<InsumoCocina, Integer> colCantExiste;
    @FXML TableColumn<InsumoCocina, Date> colFecha;

    private ObservableList<InsumoCocina> lista = FXCollections.observableArrayList();
    @FXML private TableView<InsumoCocina> tblInsumo = new TableView<>();

    @FXML Label lblError;


    public void initialize(URL url, ResourceBundle rb){
        listarHoteles();
        colNombreHotel.setCellValueFactory(new PropertyValueFactory<InsumoCocina, String>("nombreHotel"));
        colNombreInsumo.setCellValueFactory(new PropertyValueFactory<InsumoCocina, String>("nombreInsumo"));
        colFecha.setCellValueFactory(new PropertyValueFactory<InsumoCocina, Date>("fecha"));
        colCantIdeal.setCellValueFactory(new PropertyValueFactory<InsumoCocina, Integer>("cantidadInsumoIdeal"));
        colCantExiste.setCellValueFactory(new PropertyValueFactory<InsumoCocina, Integer>("cantidadInsumo"));

        listarInsumo();
    }

    public void openMenuDiario(ActionEvent event) throws Exception {



        ((Node) event.getSource()).getScene().getWindow().hide();
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/InvMenu.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Agregar menú");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();


    }

    public void listarInsumo(){
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec InsumoListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new InsumoCocina(
                                rs.getString(1),
                                rs.getInt(2),
                                rs.getString(3),
                                rs.getInt(4),
                                rs.getInt(5),
                                rs.getDate(6)
                        )
                );
            }

            tblInsumo.setItems(lista);
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
    public void listarHoteles(){
        Connection con= ConexionDB.GetConnection();

        try {
            Statement st;
            ResultSet rs = null;

            String sql = "SELECT NombreHotel FROM Hotel;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){
                cmbHotel.getItems().add(rs.getString(1));

            }
            // tblListaHotel.setItems(lista);
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

    public void ingresarInsumo(ActionEvent event)throws Exception{

        nombreHotel = cmbHotel.getValue();
        nombreInsumo = txtNombreInsumo.getText();
        fechaIngreso = dpFecha.getValue();

        if(tryParseInt(txtCantidadExistente.getText()) == true){
            cantidadExistente = java.lang.Integer.parseInt(txtCantidadExistente.getText());
        }
        if(tryParseInt(txtCantidadIdeal.getText()) == true){
            cantidadIdeal = java.lang.Integer.parseInt(txtCantidadIdeal.getText());
        }
        if(validarCampos() == true) {

            Connection miConexion = ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st = miConexion.createStatement();

            try {

                String sql = "exec InsumoCrear @NombreHotel='" + nombreHotel + "', @NombreInsumo='" + nombreInsumo + "', @Fecha='" + fechaIngreso + "', @Cantidad=" + cantidadExistente + ", @CantidadIdeal=" + cantidadIdeal + "   ";
                ps = miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Registro de Insumo");
                alert.setHeaderText("Ingreso de Insumo");
                alert.setContentText("El insumo se ha registrado exitosamente");

                alert.showAndWait();

                //listarServicios();
                //limpiarCampos();

                lista.clear();
                listarInsumo();
                limpiarFormulario();

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
                //limpiarFormulario();
                // lblError.setVisible(false);
                //}
            }
        }
    }
    public void eliminarInsumo(ActionEvent event)throws Exception{
        if(insumoSeleccionado.getIdInsumo() > 0) {
            //Solicitar contrase?a
            //Obtener valores desde input
            idInsumo = insumoSeleccionado.getIdInsumo();

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{

                String sql = "exec InsumoEliminar  @IdInsumo="+idInsumo+";";
                ps=miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Eliminación de insumo");
                alert.setHeaderText("Eliminación insumo");
                alert.setContentText("El insumo se ha eliminado correctamente");

                alert.showAndWait();
                limpiarFormulario();
                listarInsumo();


            }catch (Exception ex) {
                //  System.out.println(ex.getMessage());

                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error Dialog");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText(ex.getMessage());

                alert.showAndWait();
                miConexion=null;

            }

            finally {
                if (ps != null) try { ps.close(); } catch(Exception e) {}
                if (st != null) try { st.close(); } catch(Exception e) {}
                if (miConexion != null) try { miConexion.close(); } catch(Exception e) {}

            }
        }else{
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText("Debe seleccionar un elemento antes de eliminar.");
            alert.showAndWait();
        }
    }
    public void modificarInsumo(ActionEvent event)throws Exception{

        nombreHotel = cmbHotel.getValue();
        fechaIngreso = dpFecha.getValue();
        nombreInsumo = txtNombreInsumo.getText();

        if(tryParseInt(txtCantidadExistente.getText()) == true){
            cantidadExistente = java.lang.Integer.parseInt(txtCantidadExistente.getText());
        }
        if(tryParseInt(txtCantidadExistente.getText()) == true) {
            cantidadIdeal = java.lang.Integer.parseInt(txtCantidadIdeal.getText());
        }


        if(validarCampos() == true) {
            if(insumoSeleccionado.getIdInsumo() > 0) {
                //Solicitar contrase?a
                //Obtener valores desde input
                idInsumo = insumoSeleccionado.getIdInsumo();
                //Integer idUbicacion = null;

                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {
                    String sql = "exec InsumoModificar @IdInsumo="+idInsumo+", @NombreInsumo='"+nombreInsumo+"', @CantidadExistente="+cantidadExistente+", @CantidadIdeal="+cantidadIdeal+", @Fecha='"+fechaIngreso+"';";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Modificación de Insumo");
                    alert.setHeaderText("Modificación de Insumo");
                    alert.setContentText("El insumo se ha modificado exitosamente");

                    alert.showAndWait();

                    listarInsumo();
                    limpiarFormulario();

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
                    limpiarFormulario();
                    //lblError.setVisible(false);
                }
            } else {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error Dialog");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText("Debe seleccionar un elemento antes de modificar.");
                alert.showAndWait();
            }
        }
    }

    public boolean tryParseInt(String valor) {
        try {
            Integer.parseInt(valor);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    public void clickTable(MouseEvent t) {
        insumoSeleccionado = tblInsumo.getSelectionModel().getSelectedItem();

        cmbHotel.setValue(insumoSeleccionado.getNombreHotel());
        Date fecha = insumoSeleccionado.getFecha();
        dpFecha.setValue(Instant.ofEpochMilli(fecha.getTime()).atZone(ZoneId.systemDefault()).toLocalDate());
        txtNombreInsumo.setText(insumoSeleccionado.getNombreInsumo());
        txtCantidadExistente.setText(Integer.toString(insumoSeleccionado.getCantidadInsumo()));
        txtCantidadIdeal.setText(Integer.toString(insumoSeleccionado.getCantidadInsumoIdeal()));
    }
    public void limpiarFormulario(){
        cmbHotel.getSelectionModel().clearSelection();
        txtNombreInsumo.clear();
        txtCantidadExistente.clear();
        txtCantidadIdeal.clear();
    }
    public Boolean validarCampos(){
        boolean formValido;


        if(nombreHotel == null){
            lblError.setText("Error: debe seleccionar un hotel");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(fechaIngreso == null){
            lblError.setText("Error: debe ingresar una fecha");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(nombreInsumo.length() < 3){
            lblError.setText("Error: El insumo debe tener un largo mayor o igual a 3");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(cantidadExistente <= 0){
            lblError.setText("Error: Cantidad existente debe ser mayor a 0");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(cantidadIdeal <= 0){
            lblError.setText("Error: Cantidad ideal debe ser mayor a 0");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(cantidadExistente > cantidadIdeal){
            lblError.setText("Error: Cantidad existente debe ser menor a cantidad ideal");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        return formValido;
    }

}
