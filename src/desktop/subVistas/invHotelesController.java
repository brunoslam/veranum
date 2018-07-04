package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.Hotel;
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

public class invHotelesController implements Initializable {

    Integer idHotel, cantidadHabVip, cantidadHabBusiness, cantidadHabClassic;
    String nombreRegion, nombreCiudad, nombreHotel, nombreUbicacion;
   // Boolean hasVip, hasBus, hasClas;

    private ObservableList<Hotel> lista = FXCollections.observableArrayList();

    //Elementos Tabla
    @FXML private TableView<Hotel> tblListaHotel = new TableView<>();
    @FXML TableColumn<Hotel, String> colNombreRegion;
    @FXML TableColumn<Hotel, String> colNombreCiudad;
    @FXML TableColumn<Hotel, String> colNombreHotel;
    @FXML TableColumn<Hotel, String> colNombreUbicacion;
    @FXML TableColumn<Hotel, Integer> colVip;
    @FXML TableColumn<Hotel, Integer> colBusiness;
    @FXML TableColumn<Hotel, Integer> colClassic;


    //Input
    @FXML ComboBox<String> cmbRegion;
    @FXML ComboBox<String> cmbCiudad;
    @FXML TextField txtNombreUbicacion;
    @FXML TextField txtNombreHotel;
    @FXML TextField txtCantVip;
    @FXML TextField txtCantBus;
    @FXML TextField txtCantClassic;

    @FXML Label lblCantVip;
    @FXML Label lblCantBus;
    @FXML Label lblCantClassic;
    @FXML Label lblIdHotel;
    @FXML Label lblError;

    @FXML
    Button btnCancelar;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        listarRegiones();
        //listarCiudades();
        colNombreRegion.setCellValueFactory(new PropertyValueFactory<Hotel, String>("nombreRegion"));
        colNombreCiudad.setCellValueFactory(new PropertyValueFactory<Hotel, String>("nombreCiudad"));
        colNombreHotel.setCellValueFactory(new PropertyValueFactory<Hotel, String>("nombreHotel"));
        colNombreUbicacion.setCellValueFactory(new PropertyValueFactory<Hotel, String>("nombreUbicacion"));
        colVip.setCellValueFactory(new PropertyValueFactory<Hotel, Integer>("nroHabVip"));
        colBusiness.setCellValueFactory(new PropertyValueFactory<Hotel, Integer>("nroHabBusiness"));
        colClassic.setCellValueFactory(new PropertyValueFactory<Hotel, Integer>("nroHabClassic"));

        listar();
    }
    //
    public void listar(){
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec HotelListar;";
            rs=con.createStatement().executeQuery(sql);
            //lista.removeAll(lista);
            while   (rs.next()){

                lista.add(
                        //int idHotel, String nombreRegion, String nombreCiudad, String nombreUbicacion, String nombreHotel, String tieneVip, int nroHabVip, String tieneBusiness, int nroHabBusiness, String tieneClassic, int nroHabClassic) {
                        new Hotel(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getInt(6),
                                rs.getInt(7),
                                rs.getInt(8)

                        )
                );
            }
            tblListaHotel.setItems(lista);

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

    public void registrarHotel(ActionEvent event)throws Exception{
        nombreHotel = txtNombreHotel.getText();
        if(buscarHotel(nombreHotel) == false){
            //
            //Obtener valores desde input
            //idUbicacion = java.lang.Integer.parseInt(txtIdUbicacion.getText());
            Integer idUbicacion = null;

            nombreRegion = cmbRegion.getValue();
            nombreCiudad = cmbCiudad.getValue();
            nombreUbicacion = txtNombreUbicacion.getText();

            if(tryParseInt(txtCantVip.getText()) == true){
                cantidadHabVip = java.lang.Integer.parseInt(txtCantVip.getText());
            }

            if(tryParseInt(txtCantBus.getText()) == true){
                cantidadHabBusiness = java.lang.Integer.parseInt(txtCantBus.getText());
            }

            if(tryParseInt(txtCantClassic.getText()) == true){
                cantidadHabClassic = java.lang.Integer.parseInt(txtCantClassic.getText());
            }
            if(validarCampos() == true) {
                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec HotelCrear @NombreCiudad='" + nombreCiudad + "', @NombreUbicacion='" + nombreUbicacion + "', @NombreHotel='" + nombreHotel + "', @HabitacionesVIP=" + cantidadHabVip + ", @HabitacionesBusiness=" + cantidadHabBusiness + ", @HabitacionesBasicas=" + cantidadHabClassic + ";";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Registro de Hotel");
                    alert.setHeaderText("Ingreso de Hotel");
                    alert.setContentText("El hotel se ha registrado exitosamente");

                    alert.showAndWait();
                    limpiarFormulario();
                    listar();

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
                }
            }
            //lblError.setVisible(false);
            //lblError.setText("hola mundo");
            //lblError.setVisible(true);
        }

    }
    public void eliminarHotel(ActionEvent event)throws Exception{

        //idHotel = java.lang.Integer.parseInt(lblIdHotel.getText());
        if(tryParseInt(lblIdHotel.getText()) == true) {
            idHotel = java.lang.Integer.parseInt(lblIdHotel.getText());
            if(existeReservasEnHotel(idHotel) == false){
                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec HotelEliminar  @IdHotel='" + idHotel + "';";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Eliminación de Hotel");
                    alert.setHeaderText("Eliminación de Hotel");
                    alert.setContentText("El hotel se ha eliminado correctamente");

                    alert.showAndWait();

                    listar();
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
                    lblIdHotel.setText(null);
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
    public void actualizarHotel(ActionEvent event)throws Exception{
        nombreRegion = cmbRegion.getValue();
        nombreCiudad = cmbCiudad.getValue();
        nombreUbicacion = txtNombreUbicacion.getText();
        nombreHotel = txtNombreHotel.getText();
        if(tryParseInt(txtCantVip.getText()) == true){
            cantidadHabVip = java.lang.Integer.parseInt(txtCantVip.getText());
        }

        if(tryParseInt(txtCantBus.getText()) == true){
            cantidadHabBusiness = java.lang.Integer.parseInt(txtCantBus.getText());
        }

        if(tryParseInt(txtCantClassic.getText()) == true){
            cantidadHabClassic = java.lang.Integer.parseInt(txtCantClassic.getText());
        }

        if(validarCampos() == true) {
            if (tryParseInt(lblIdHotel.getText())) {

                idHotel = java.lang.Integer.parseInt(lblIdHotel.getText());
                //Integer idUbicacion = null;

                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec HotelModificar @IdHotel=" + idHotel + ",  @NombreHotel='" + nombreHotel + "', @NombreUbicacion='" + nombreUbicacion + "', @HabitacionesVIP=" + cantidadHabVip + ", @HabitacionesBusiness=" + cantidadHabBusiness + ", @HabitacionesBasicas=" + cantidadHabClassic + ";";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Modificación de Hotel");
                    alert.setHeaderText("Modificación de Hotel");
                    alert.setContentText("El hotel se ha modificado exitosamente");

                    alert.showAndWait();

                    listar();
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

    public Boolean buscarHotel(String nombreHotel){
        Connection con= ConexionDB.GetConnection();
        Boolean existe = false;

        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec HotelExisteListar @NombreHotel='"+nombreHotel+"';";
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
            alert.setHeaderText("Ha ocurrido un error al buscar el hotel");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;
        }
        if(existe == true){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Creación Hotel");
            alert.setHeaderText("Ha ocurrido un error al crear el hotel");
            alert.setContentText("Ya existe un hotel con ese nombre, favor escoger otro nombre.");

            alert.showAndWait();
        }
        return existe;

    }
    public Boolean existeReservasEnHotel(int idHotel){
        Connection con= ConexionDB.GetConnection();
        Boolean existe = false;

        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec ReservaEnHotelExisteContar @IdHotel='"+idHotel+"';";
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
            alert.setHeaderText("Ha ocurrido un error al buscar el hotel");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;
        }
        if(existe == true){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Eliminar Hotel");
            alert.setHeaderText("Ha ocurrido un error al eliminar el hotel");
            alert.setContentText("Existen reservas activas en el hotel");

            alert.showAndWait();
        }
        return existe;
    }
    public void listarRegiones(){

        Connection con= ConexionDB.GetConnection();

        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec RegionListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){
                cmbRegion.getItems().add(rs.getString(2));

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
    public void listarCiudades(){
        String region = cmbRegion.getSelectionModel().getSelectedItem().toString();
        Connection con= ConexionDB.GetConnection();
        cmbCiudad.getItems().clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec CiudadListar @nombreRegion='"+ region +"';";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){
                cmbCiudad.getItems().add(rs.getString(1));

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

    public void limpiarFormulario(){
        cmbRegion.getSelectionModel().clearSelection();
        cmbCiudad.getSelectionModel().clearSelection();
        txtNombreUbicacion.clear();
        txtNombreHotel.clear();
        txtCantVip.clear();
        txtCantBus.clear();
        txtCantClassic.clear();
    }
    public void clickTabla(MouseEvent t) {

        Hotel hotel = tblListaHotel.getSelectionModel().getSelectedItem();
        lblIdHotel.setText(Integer.toString(hotel.getIdHotel()));
        cmbRegion.setValue(hotel.getNombreRegion());
        cmbCiudad.setValue(hotel.getNombreCiudad());
        txtNombreUbicacion.setText(hotel.getNombreUbicacion());
        txtNombreHotel.setText(hotel.getNombreHotel());

        txtCantVip.setText(Integer.toString(hotel.getNroHabVip()));


        txtCantBus.setText(Integer.toString(hotel.getNroHabBusiness()));


        txtCantClassic.setText(Integer.toString(hotel.getNroHabClassic()));
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

        if(nombreRegion == null){
            lblError.setText("Error: debe seleccionar una region");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(nombreCiudad == null){
            lblError.setText("Error: debe seleccionar una ciudad");
            lblError.setVisible(true);
            formValido = false;
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(nombreUbicacion.length() < 5){
            formValido = false;
            lblError.setText("Error: El largo de la ubicación del hotel debe ser mayor a 5");
            lblError.setVisible(true);
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(nombreHotel.length() < 5){
            formValido = false;
            lblError.setText("Error: El largo del nombre del hotel debe ser mayor a 5");
            lblError.setVisible(true);
            return formValido;
        }else{
            formValido = true;
            lblError.setVisible(false);
        }

        if(cantidadHabVip == null || cantidadHabBusiness == null || cantidadHabClassic == null){
            formValido = false;
            lblError.setText("Error: Debe ingregar un número de habitaciones igual o mayor a 0");
            lblError.setVisible(true);
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
