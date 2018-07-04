package desktop.subVistas;
import ConexionDB.ConexionDB;
import Modelo.Hab;
import Modelo.Hotel;
import Modelo.InspeccionSanitaria;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.ResourceBundle;

/**
 * Created by Palma Avila on 14-11-2015.
 */
public class invInspeccionSanitariaController implements Initializable {
    private String nombreHotel, tipoHabitacion, inpeccionSanitaria;
    private int idInspeccion, numeroHabitacion;
    private LocalDate fechaResolucion;
    private InspeccionSanitaria inspeccionSeleccionada = null;
    @FXML ComboBox<String> cmbHotel;
    @FXML ComboBox<Integer> cmbNumeroHabitacion;
    @FXML ComboBox<String> cmbResolucion;
    @FXML DatePicker dtFechaRes =new DatePicker();

    private ObservableList<InspeccionSanitaria> lista = FXCollections.observableArrayList();
    @FXML private TableView<InspeccionSanitaria> tblInspeccion = new TableView<>();


    @FXML TableColumn<InspeccionSanitaria, String> colNombreHotel;
    @FXML TableColumn<InspeccionSanitaria, Integer> colNumHab;
    @FXML TableColumn<InspeccionSanitaria, String> colTipoHabitacion;
    @FXML TableColumn<InspeccionSanitaria, String> colResSanitaria;
    @FXML TableColumn<InspeccionSanitaria, Date> colFechaResolucion;

    @FXML Label lblError;
    public void initialize(URL url, ResourceBundle rb){
        cmbResolucion.getItems().addAll("Aprobada", "Reprobada", "No Inspeccionada");
        listarHoteles();
        colNombreHotel.setCellValueFactory(new PropertyValueFactory<InspeccionSanitaria, String>("nombreHotel"));
        colNumHab.setCellValueFactory(new PropertyValueFactory<InspeccionSanitaria, Integer>("numeroHabitacion"));
        colTipoHabitacion.setCellValueFactory(new PropertyValueFactory<InspeccionSanitaria, String>("tipoHabitacion"));
        colResSanitaria.setCellValueFactory(new PropertyValueFactory<InspeccionSanitaria, String>("resolucionSanitaria"));
        colFechaResolucion.setCellValueFactory(new PropertyValueFactory<InspeccionSanitaria, Date>("fechaResolucion"));

        listarInspeccion();
    }


    public void listarInspeccion(){
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec InspeccionListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new InspeccionSanitaria(
                                rs.getInt(1),
                                rs.getString(5),
                                rs.getDate(6),
                                rs.getString(2),
                                rs.getInt(3),
                                rs.getString(4)
                        )
                );
            }

            tblInspeccion.setItems(lista);
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
    public void listarInspeccionAprobada(){
        String hotel = cmbHotel.getSelectionModel().getSelectedItem();
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec InspeccionEstadoListar @NombreHotel='"+ hotel +"', @Resolucion='Aprobada';";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new InspeccionSanitaria(
                                rs.getInt(1),
                                rs.getString(5),
                                rs.getDate(6),
                                rs.getString(2),
                                rs.getInt(3),
                                rs.getString(4)
                        )
                );
            }

            tblInspeccion.setItems(lista);
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
    public void listarInspeccionReprobada(){
        String hotel = cmbHotel.getSelectionModel().getSelectedItem();
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec InspeccionEstadoListar @NombreHotel='"+ hotel +"', @Resolucion='Reprobada';";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new InspeccionSanitaria(
                                rs.getInt(1),
                                rs.getString(5),
                                rs.getDate(6),
                                rs.getString(2),
                                rs.getInt(3),
                                rs.getString(4)
                        )
                );
            }

            tblInspeccion.setItems(lista);
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
    public void listarInspeccionNoInspeccionada(){
        String hotel = cmbHotel.getSelectionModel().getSelectedItem();
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec InspeccionEstadoListar @NombreHotel='"+ hotel +"', @Resolucion='No inspeccionada';";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new InspeccionSanitaria(
                                rs.getInt(1),
                                rs.getString(5),
                                rs.getDate(6),
                                rs.getString(2),
                                rs.getInt(3),
                                rs.getString(4)
                        )
                );
            }

            tblInspeccion.setItems(lista);
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
    public void listarTodasInspeccionPorHotel(){
        String hotel = cmbHotel.getSelectionModel().getSelectedItem();
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec InspeccionEstadoTodasListar @NombreHotel='"+ hotel +"', @Resolucion='No inspeccionada';";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new InspeccionSanitaria(
                                rs.getInt(1),
                                rs.getString(5),
                                rs.getDate(6),
                                rs.getString(2),
                                rs.getInt(3),
                                rs.getString(4)
                        )
                );
            }

            tblInspeccion.setItems(lista);
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
                //cmbHotel.getItems().add(rs.getString(1));
                System.out.println(rs.getString(1));
                cmbHotel.getItems().add(rs.getString(1));

            }
            // tblListaHotel.setItems(lista);
        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error al obtener los hoteles");
            alert.setContentText(ex.getMessage());
            alert.showAndWait();
            con=null;
        }
    }
    public void listarNroHabitacion(){
        String hotel = cmbHotel.getSelectionModel().getSelectedItem().toString();
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

    public void ingresarInspeccion(ActionEvent event)throws Exception{
        nombreHotel = cmbHotel.getValue();
        if(cmbNumeroHabitacion.getValue() != null){
            numeroHabitacion =  cmbNumeroHabitacion.getValue();
        }else{
            numeroHabitacion = 0;
        }

        inpeccionSanitaria =  cmbResolucion.getValue();
        fechaResolucion = dtFechaRes.getValue();

        if(validarCampos() == true){

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{

                String sql = "exec InspeccionCrear  @NombreHotel='"+nombreHotel+"', @NumeroHabitacion="+ numeroHabitacion +", @Resolucion='"+ inpeccionSanitaria +"', @Fecha='"+ fechaResolucion +"' ";
                ps=miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Registro de Inspección de Habitación");
                alert.setHeaderText("Ingreso de Inspección");
                alert.setContentText("La inspección de la habitación se ha registrado exitosamente");

                alert.showAndWait();
                lista.clear();
                listarInspeccion();
                limpiarFormulario();


                //listarHbtacion();

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
               // lblError.setVisible(false);
            }
        }
    }
    public void InspeccionModificar(ActionEvent event)throws Exception{

        nombreHotel = cmbHotel.getValue();
        if(cmbNumeroHabitacion.getValue() != null){
            numeroHabitacion =  cmbNumeroHabitacion.getValue();
        }else{
            numeroHabitacion = 0;
        }
        inpeccionSanitaria = cmbResolucion.getValue();
        fechaResolucion = dtFechaRes.getValue();
        idInspeccion = inspeccionSeleccionada.getIdInspeccion();



        if(validarCampos() == true) {
            if (inspeccionSeleccionada.getIdInspeccion() > 0) {

                idInspeccion = inspeccionSeleccionada.getIdInspeccion();
                //Integer idUbicacion = null;

                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec InspeccionModificar @IdInspeccion="+idInspeccion+",  @NombreHotel='"+nombreHotel+"', @Resolucion='"+inpeccionSanitaria+"', @Fecha='"+fechaResolucion+"';";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Modificación de Inspección");
                    alert.setHeaderText("Modificación de Inspección");
                    alert.setContentText("La inspección se ha modificado exitosamente");

                    alert.showAndWait();

                    listarInspeccion();
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
                alert.setContentText("Debe seleccionar un elemento antes de modificar.");
                alert.showAndWait();
            }
        }
    }
    public void inspeccionEliminar(ActionEvent event)throws Exception{
        if(inspeccionSeleccionada.getIdInspeccion() > 0) {
            //Solicitar contrase?a
            //Obtener valores desde input
            idInspeccion = inspeccionSeleccionada.getIdInspeccion();

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{

                String sql = "exec InspeccionEliminar  @IdInspeccion="+idInspeccion+";";
                ps=miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Eliminación de Servicio");
                alert.setHeaderText("Eliminación servicio");
                alert.setContentText("El servicio se ha eliminado correctamente");

                alert.showAndWait();
                limpiarFormulario();
                listarInspeccion();


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

    public void clickTabla(MouseEvent t) {
        inspeccionSeleccionada = tblInspeccion.getSelectionModel().getSelectedItem();
        //InspeccionSanitaria inspeccion = tblInspeccion.getSelectionModel().getSelectedItem();
        //lblIdInspeccion.setText(Integer.toString(inspeccionSeleccionada.getIdInspeccion()));

        cmbHotel.setValue(inspeccionSeleccionada.getNombreHotel());
        cmbNumeroHabitacion.setValue(inspeccionSeleccionada.getNumeroHabitacion());
        cmbResolucion.setValue(inspeccionSeleccionada.getResolucionSanitaria());

        Date fecha = inspeccionSeleccionada.getFechaResolucion();


        dtFechaRes.setValue(Instant.ofEpochMilli(fecha.getTime()).atZone(ZoneId.systemDefault()).toLocalDate());
       // dtFechaRes.setValue(date);
    }
    public void limpiarFormulario(){
        cmbHotel.getSelectionModel().clearSelection();
        cmbNumeroHabitacion.getSelectionModel().clearSelection();
        cmbResolucion.getSelectionModel().clearSelection();
        dtFechaRes.getEditor().clear();
    }
    public boolean tryParseInt(String valor) {
        try {
            Integer.parseInt(valor);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
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

        if(numeroHabitacion <= 0){
            lblError.setText("Error: debe seleccionar un habitación");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(inpeccionSanitaria == null){
            lblError.setText("Error: debe seleccionar una inspección");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(fechaResolucion == null){
            lblError.setText("Error: debe ingresar una fecha de resolución");
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
