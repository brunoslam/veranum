package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.Hab;
import Validadores.NumberTextField;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

import java.lang.String;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
/**
 * Created by Palma Avila on 03/11/2015.
 */
public class InvHabitacionesController implements Initializable{

    private String nombreHotel, tipoHabitacion, inpeccionSanitaria;
    private int idHabitacion, precio, numeroHabitacion;

    @FXML ComboBox<String> cmbHoteles;
    @FXML ComboBox<String> cmbTipoHabitacion;
    @FXML ComboBox<String> cmbInspeecionSanitaria;

    @FXML NumberTextField txtPrecio;
    @FXML NumberTextField txtNumeroHabitacion;

    private ObservableList<Hab> lista = FXCollections.observableArrayList();
    @FXML private TableView<Hab> tblHbtaciones = new TableView<>();

    @FXML TableColumn<Hab, String> colNombreHotel;
    @FXML TableColumn<Hab, String> colNumeroHab;
    @FXML TableColumn<Hab, String> colTipoHab;
    @FXML TableColumn<Hab, Integer> colPrecioHab;
    @FXML TableColumn<Hab, String> colResSanitaria;

    @FXML Label lblError;
    @FXML Label lblId;
    @FXML
    Button btnCancelar;
    //hotel, numero, tipoHab, precio, resolucions


    public void initialize(URL url, ResourceBundle rb){
        listarHoteles();
        listarTipoHbtacion();
        //listarInspecciones();
        cmbInspeecionSanitaria.getItems().addAll("Aprobada", "Reprobada", "No Inspeccionada");
        colNombreHotel.setCellValueFactory(new PropertyValueFactory<Hab, String>("nombreHotel"));
        colNumeroHab.setCellValueFactory(new PropertyValueFactory<Hab, String>("numeroreal"));
        colTipoHab.setCellValueFactory(new PropertyValueFactory<Hab, String>("tipoHabitacion"));
        colPrecioHab.setCellValueFactory(new PropertyValueFactory<Hab, Integer>("precio"));
        colResSanitaria.setCellValueFactory(new PropertyValueFactory<Hab, String>("resolucionSanitaria"));
        listarHbtacion();
    }


    public void listarHbtacion(){
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec HabitacionListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new Hab(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getInt(4),
                                rs.getString(5),
                                rs.getInt(6)
                        )
                );
            }

            tblHbtaciones.setItems(lista);
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
    public void ingresarHbtacion(ActionEvent event)throws Exception{

        nombreHotel = cmbHoteles.getValue();
        tipoHabitacion = cmbTipoHabitacion.getValue();
        if(tryParseInt(txtPrecio.getText()) == true){
            precio =  java.lang.Integer.parseInt(txtPrecio.getText());
        }
        if(tryParseInt(txtNumeroHabitacion.getText()) == true){
            numeroHabitacion =  java.lang.Integer.parseInt(txtNumeroHabitacion.getText());
        }
        inpeccionSanitaria = cmbInspeecionSanitaria.getValue();

        if(validarCampos() == true){

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{

                String sql = "exec HabitacionCrear  @NombreHotel='"+nombreHotel+"', @TipoHabitacion='"+tipoHabitacion+"', @Precio="+precio+", @Inspeccion='"+inpeccionSanitaria+"', @NumeroHabitacion="+numeroHabitacion+"             ";
                ps=miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Registro de Habitación");
                alert.setHeaderText("Ingreso de Habitación");
                alert.setContentText("La habitación se ha registrado exitosamente");

                alert.showAndWait();

                //listarServicios();
                //limpiarCampos();

                lista.clear();
                listarHbtacion();

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
                //limpiarFormulario();
                lblError.setVisible(false);
            }
        }
    }
    public void eliminarHbtacion(ActionEvent event)throws Exception{
        if(tryParseInt(lblId.getText()) == true) {
            idHabitacion = java.lang.Integer.parseInt(lblId.getText());

            if(existeReservasEnHabitacion(idHabitacion) == false){
                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec HabitacionEliminarNuevo  @IdHabitacion='" + idHabitacion + "';";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Eliminación de habitación");
                    alert.setHeaderText("Eliminación de habitación");
                    alert.setContentText("La habitación se ha eliminado correctamente");

                    alert.showAndWait();

                    listarHbtacion();
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
                    lblId.setText(null);
                }
            }
        }else{
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Eliminación de Hotel");
            alert.setHeaderText("Eliminación de Hotel");
            alert.setContentText("Debe seleccionar un hotel antes de eliminar");

            alert.showAndWait();
        }
    }
    public void actualizarHbtacion(ActionEvent event)throws Exception{
        nombreHotel = cmbHoteles.getValue();
        tipoHabitacion = cmbTipoHabitacion.getValue();
        if(tryParseInt(txtPrecio.getText()) == true){
            precio =  java.lang.Integer.parseInt(txtPrecio.getText());
        }
        if(tryParseInt(txtNumeroHabitacion.getText()) == true){
            numeroHabitacion =  java.lang.Integer.parseInt(txtNumeroHabitacion.getText());
        }
        inpeccionSanitaria = cmbInspeecionSanitaria.getValue();


        if(validarCampos() == true) {
            if (tryParseInt(lblId.getText())) {

                idHabitacion = java.lang.Integer.parseInt(lblId.getText());
                //Integer idUbicacion = null;

                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec HabitacionModificar @IdHabitacion="+ idHabitacion +", @NombreHotel='"+nombreHotel+"', @TipoHabitacion='"+tipoHabitacion+"', @Precio="+precio+", @Inspeccion='"+inpeccionSanitaria+"', @NumeroHabitacion="+numeroHabitacion+";";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Modificación de Hotel");
                    alert.setHeaderText("Modificación de Hotel");
                    alert.setContentText("El hotel se ha modificado exitosamente");

                    alert.showAndWait();

                    listarHbtacion();
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
                    lblError.setVisible(false);
                }
            } else {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error Dialog");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText("Debe seleccionar un elemento antes de eliminar.");
                alert.showAndWait();
            }
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
                cmbHoteles.getItems().add(rs.getString(1));

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

    public void listarTipoHbtacion(){
        Connection con= ConexionDB.GetConnection();

        try {
            Statement st;
            ResultSet rs = null;

            String sql = "SELECT NombreTipoHabitacion FROM TipoHabitacion;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){
                cmbTipoHabitacion.getItems().add(rs.getString(1));

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
    public void listarInspecciones(){
        Connection con= ConexionDB.GetConnection();

        try {
            Statement st;
            ResultSet rs = null;

            String sql = "SELECT ResolucionSanitaria FROM InspeccionSanitaria;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){
                cmbInspeecionSanitaria.getItems().add(rs.getString(1));

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
    public Boolean existeReservasEnHabitacion(int idHabitacion){
        Connection con= ConexionDB.GetConnection();
        Boolean existe = false;

        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec HabitacionReservadaContar @IdHabitacion='"+idHabitacion+"';";
            rs=con.createStatement().executeQuery(sql);
            //lista.removeAll(lista);
            while   (rs.next()){

                int contador = rs.getInt(1);
                if(contador > 0){
                    existe = true;
                }
            }


        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error al buscar la habitación");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;
        }
        if(existe == true){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Eliminar Habitación");
            alert.setHeaderText("Ha ocurrido un error al eliminar la habitación");
            alert.setContentText("Existen reservas activas en la habitación");

            alert.showAndWait();
        }
        return existe;
    }

    public void limpiarFormulario(){
        cmbHoteles.getSelectionModel().clearSelection();
        cmbTipoHabitacion.getSelectionModel().clearSelection();
        txtPrecio.clear();
        txtNumeroHabitacion.clear();
        cmbInspeecionSanitaria.getSelectionModel().clearSelection();
        lblId.setText("");
    }
    public void clickTabla(MouseEvent t) {

        Hab habitacion = tblHbtaciones.getSelectionModel().getSelectedItem();
        lblId.setText(Integer.toString(habitacion.getIdhabitacion()));
        cmbHoteles.setValue(habitacion.getNombreHotel());
        cmbTipoHabitacion.setValue(habitacion.getTipoHabitacion());
        txtPrecio.setText(Integer.toString(habitacion.getPrecio()));
        txtNumeroHabitacion.setText(Integer.toString(habitacion.getNumeroreal()));
        cmbInspeecionSanitaria.setValue(habitacion.getResolucionSanitaria());


    }
    public boolean tryParseInt(String valor) {
        try {
            Integer.parseInt(valor);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    public boolean validarCampos(){
        boolean formValido;


        nombreHotel = cmbHoteles.getValue();
        tipoHabitacion = cmbTipoHabitacion.getValue();

        inpeccionSanitaria = cmbInspeecionSanitaria.getValue();

        if(nombreHotel == null){
            lblError.setText("Error: debe seleccionar un hotel");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }
        if(tipoHabitacion == null){
            lblError.setText("Error: debe seleccionar un tipo de habitación");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }
        if(precio <= 0 ){
            lblError.setText("Error: debe ingresar un valor mayor a 0");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }
        if(numeroHabitacion <= 0 ){
            lblError.setText("Error: debe ingresar un valor mayor a 0 en el campo número habitación");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }
        if(inpeccionSanitaria == null){
            lblError.setText("Error: debe ingresar una inspección sanitaria");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }
        return formValido;
    }
    @FXML
    public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }
}


