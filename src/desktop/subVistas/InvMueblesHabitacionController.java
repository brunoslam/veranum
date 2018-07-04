package desktop.subVistas;


import ConexionDB.ConexionDB;
import Modelo.MueblesHabitacion;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import Validadores.NumberTextField;
import javafx.scene.input.MouseEvent;
//import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * Created by Palma Avila on 29-11-2015.
 */
public class InvMueblesHabitacionController implements Initializable {

    private String nombreHotel, nombreMueble, estadoMueble, tipoMueble;
    private int idMueble, numeroHabitacion, cantidadMueble, precioMueble;


    @FXML ComboBox<String> cmbNombreHotel;
    @FXML ComboBox<Integer> cmbNumeroHabitacion;
    @FXML TextField txtNombreMueble;
    @FXML TextField txtTipoMueble;
    @FXML NumberTextField txtCantidad;
    @FXML NumberTextField txtPrecio;
    @FXML ComboBox<String> cmbEstado;

    private ObservableList<MueblesHabitacion> lista = FXCollections.observableArrayList();
    @FXML private TableView<MueblesHabitacion> tblListaMuebles = new TableView<>();
    @FXML TableColumn<MueblesHabitacion, String> colHotel;
    @FXML TableColumn<MueblesHabitacion, Integer> colHabitacion;
    @FXML TableColumn<MueblesHabitacion, String> colMueble;
    @FXML TableColumn<MueblesHabitacion, String> colEstado;
    @FXML TableColumn<MueblesHabitacion, Integer> colPrecio;
    @FXML TableColumn<MueblesHabitacion, String> colTipo;

    @FXML Label lblError;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        cmbEstado.getItems().addAll("Sin Daño", "Dañado");

        colHotel.setCellValueFactory(new PropertyValueFactory<MueblesHabitacion, String>("nombreHotel"));
        colHabitacion.setCellValueFactory(new PropertyValueFactory<MueblesHabitacion, Integer>("numeroHabitacion"));
        colMueble.setCellValueFactory(new PropertyValueFactory<MueblesHabitacion, String>("nombreMueble"));
        colEstado.setCellValueFactory(new PropertyValueFactory<MueblesHabitacion, String>("estadoMueble"));
        colPrecio.setCellValueFactory(new PropertyValueFactory<MueblesHabitacion, Integer>("precioMueble"));
        colTipo.setCellValueFactory(new PropertyValueFactory<MueblesHabitacion, String>("tipoMueble"));
        listarMuebles();
        listarHoteles();
    }

    public void listarMuebles(){
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec MuebleListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new MueblesHabitacion(
                                rs.getInt(1),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getInt(6),
                                rs.getString(2),
                                rs.getInt(3),
                                rs.getString(7)
                        )
                );
            }

            tblListaMuebles.setItems(lista);
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
                cmbNombreHotel.getItems().add(rs.getString(1));

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
    }
    public void listarNroHabitacion(){
        String hotel = cmbNombreHotel.getSelectionModel().getSelectedItem().toString();
        Connection con= ConexionDB.GetConnection();
        cmbNumeroHabitacion.getItems().clear();
        try {
            Statement st;
            ResultSet rs = null;
            String sql = "SELECT NumeroReal FROM Habitacion WHERE IdHotel = (SELECT IdHotel FROM Hotel Where NombreHotel = '"+ hotel + "') ORDER BY NumeroReal;";
            //String sql = "exec CiudadListar @nombreRegion='"+ region +"';";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){
                cmbNumeroHabitacion.getItems().add(rs.getInt(1));
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

    public void ingresarMueble(ActionEvent event)throws Exception{

        nombreHotel = cmbNombreHotel.getValue();
        if(cmbNumeroHabitacion.getValue() != null){
            numeroHabitacion = cmbNumeroHabitacion.getValue();
        }else{
            numeroHabitacion = 0;
        }
        nombreMueble = txtNombreMueble.getText();
        estadoMueble = cmbEstado.getValue();
        tipoMueble = txtTipoMueble.getText();
        if(tryParseInt(txtCantidad.getText()) == true){
            cantidadMueble =  java.lang.Integer.parseInt(txtCantidad.getText());
        }
        if(tryParseInt(txtPrecio.getText()) == true){
            precioMueble =  java.lang.Integer.parseInt(txtPrecio.getText());
        }
        if(validarCampos(true) == true) {

            Connection miConexion = ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st = miConexion.createStatement();

            try {

                String sql = "exec MuebleCrear @NombreHotel='" + nombreHotel + "', @NumeroHabitacion=" + numeroHabitacion + ", @NombreMueble='" + nombreMueble + "', @TipoMueble='" + tipoMueble + "', @EstadoMueble='" + estadoMueble + "', @Cantidad=" + cantidadMueble + ", @Precio=" + precioMueble + ";";
                ps = miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Registro de Mueble");
                alert.setHeaderText("Ingreso de Mueble");
                alert.setContentText("El mueble se ha registrado exitosamente");

                alert.showAndWait();

                lista.clear();
                listarMuebles();
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
    public void eliminarMueble(ActionEvent event)throws Exception{
        if(muebleSeleccionado.getIdMueble() > 0) {
            //Solicitar contrase?a
            //Obtener valores desde input
            idMueble = muebleSeleccionado.getIdMueble();

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{

                String sql = "exec MuebleEliminar  @IdMueble='"+idMueble+"';";
                ps=miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Eliminación de Mueble");
                alert.setHeaderText("Eliminación mueble");
                alert.setContentText("El mueble se ha eliminado correctamente");

                alert.showAndWait();
                limpiarFormulario();
                listarMuebles();


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
    public void modificarMueble(ActionEvent event)throws Exception{
        nombreHotel = cmbNombreHotel.getValue();

        if(cmbNumeroHabitacion.getValue() != null){
            numeroHabitacion = cmbNumeroHabitacion.getValue();
        }else{
            numeroHabitacion = 0;
        }
        nombreMueble = txtNombreMueble.getText();
        estadoMueble = cmbEstado.getValue();
        tipoMueble = txtTipoMueble.getText();
        if(tryParseInt(txtPrecio.getText()) == true){
            precioMueble = java.lang.Integer.parseInt(txtPrecio.getText());
        }

        if(validarCampos(false)){
            if(muebleSeleccionado.getIdMueble() > 0) {
                idMueble = muebleSeleccionado.getIdMueble();


                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec MuebleModificar @IdMueble=" + idMueble + ", @NombreMueble='" + nombreMueble + "', @Precio=" + precioMueble + ", @Estado='"+estadoMueble+"', @Tipo='"+tipoMueble+"';";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Modificación de Mueble");
                    alert.setHeaderText("Modificación de Mueble");
                    alert.setContentText("El mueble "+muebleSeleccionado.getNombreMueble()+" con ID "+muebleSeleccionado.getIdMueble()+" se ha modificado exitosamente");

                    alert.showAndWait();
                    listarMuebles();
                    limpiarFormulario();

                } catch (Exception ex) {
                    //  System.out.println(ex.getMessage());

                    Alert alert = new Alert(Alert.AlertType.ERROR);
                    alert.setTitle("Error al modificar");
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
                }
            }else{
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

    private MueblesHabitacion muebleSeleccionado = null;
    public void limpiarFormulario(){
        cmbNombreHotel.getSelectionModel().clearSelection();
        cmbNumeroHabitacion.getSelectionModel().clearSelection();
        txtNombreMueble.clear();
        txtCantidad.clear();
        txtTipoMueble.clear();
        txtPrecio.clear();
        cmbEstado.getSelectionModel().clearSelection();
    }
    public void clickTabla(MouseEvent t) {
        limpiarFormulario();
        muebleSeleccionado = tblListaMuebles.getSelectionModel().getSelectedItem();

        cmbNombreHotel.setValue(muebleSeleccionado.getNombreHotel());
        cmbNumeroHabitacion.setValue(muebleSeleccionado.getNumeroHabitacion());
        txtNombreMueble.setText(muebleSeleccionado.getNombreMueble());
        txtTipoMueble.setText(muebleSeleccionado.getTipoMueble());
        //txtCantidad.setText();
        txtPrecio.setText(Integer.toString(muebleSeleccionado.getPrecioMueble()));
        cmbEstado.setValue(muebleSeleccionado.getEstadoMueble());
    }
    public Boolean validarCampos(Boolean isIngresar){
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

        if(numeroHabitacion <= 0){
            lblError.setText("Error: debe seleccionar una habitación");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(nombreMueble.length() < 3){
            lblError.setText("Error: El largo del nombre de mueble debe ser mayor o igual a 3");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(tipoMueble.length() < 3){
            lblError.setText("Error: El largo del tipo de mueble debe ser mayor o igual a 3");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(isIngresar == true){
            if(cantidadMueble <= 0){
                lblError.setText("Error: Cantidad debe ser un valor mayor a 0");
                lblError.setVisible(true);
                formValido = false;
                return formValido;
            }else{
                formValido = true;
                lblError.setVisible(false);
            }
        }

        if(precioMueble <= 0){
            lblError.setText("Error: Precio mueble debe ser mayor a 0");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(estadoMueble == null){
            lblError.setText("Error: debe seleccionar un estado de mueble");
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
