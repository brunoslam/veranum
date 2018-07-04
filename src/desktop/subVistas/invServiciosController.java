package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.ServicioExtra;
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

public class invServiciosController implements Initializable {

    Integer idServicioExtra, precioServicio;
    String nombreServicio;

    private ObservableList<ServicioExtra> lista = FXCollections.observableArrayList();

    //Elementos Tabla
    @FXML private TableView<ServicioExtra> tblListaServicios = new TableView<>();
    @FXML TableColumn<ServicioExtra,Integer> colId;
    @FXML TableColumn<ServicioExtra, String> colNombreServicio;
    @FXML TableColumn<ServicioExtra,Integer> colPrecioServicio;

    //Input
    @FXML TextField txtIdServicio;
    @FXML TextField txtNombreServicio;
    @FXML TextField txtPrecioServicio;

    @FXML Label lblIdServicio;
    @FXML Label lblError;

    @FXML
    Button btnCancelar;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        colId.setCellValueFactory(new PropertyValueFactory<ServicioExtra, Integer>("idServicio"));
        colNombreServicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, String>("nombreServicio"));
        colPrecioServicio.setCellValueFactory(new PropertyValueFactory<ServicioExtra, Integer>("precioServicio"));

        listarServicios();

    }

    public void listarServicios(){
        Connection con= ConexionDB.GetConnection();
        lista.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec ServiciolListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(
                        new ServicioExtra(rs.getInt(1), rs.getString(2), rs.getInt(3))
                );
            }

            tblListaServicios.setItems(lista);
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

    public void ingresarServicio(ActionEvent event)throws Exception{
        nombreServicio = txtNombreServicio.getText();
        if(tryParseInt(txtPrecioServicio.getText()) == true){
            precioServicio = java.lang.Integer.parseInt(txtPrecioServicio.getText());
        }
        if(validarCampos() == true){

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{

                String sql = "exec ServicioCrear  @NombreServicio='"+nombreServicio+"', @Precio='" + precioServicio + "' ;";
                ps=miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Registro de Servicio");
                alert.setHeaderText("Ingreso de Servicio Extra");
                alert.setContentText("El servicio extra se ha registrado exitosamente");

                alert.showAndWait();

                listarServicios();
                //limpiarCampos();



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
                limpiarFormulario();
            }

        }


    }
    public void actualizarServicio(ActionEvent event)throws Exception{
        nombreServicio = txtNombreServicio.getText();
        if(tryParseInt(txtPrecioServicio.getText()) == true){
            precioServicio = java.lang.Integer.parseInt(txtPrecioServicio.getText());
        }

        if(validarCampos()){
            if(tryParseInt(lblIdServicio.getText())) {
                idServicioExtra = java.lang.Integer.parseInt(lblIdServicio.getText());


                Connection miConexion = ConexionDB.GetConnection();

                Statement st;
                //se utiliza para las consultas o procedimientos que no retornan datos.
                PreparedStatement ps = null;
                st = miConexion.createStatement();

                try {

                    String sql = "exec ServicioModificar @IdServicio=" + idServicioExtra + ", @NombreServicio='" + nombreServicio + "', @PrecioServicio=" + precioServicio + ";";
                    ps = miConexion.prepareCall(sql);
                    ps.execute();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Modificación de Servicio");
                    alert.setHeaderText("Modificación de Servicio");
                    alert.setContentText("El servicio se ha modificado exitosamente");

                    alert.showAndWait();
                    listarServicios();

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
            }else{
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error Dialog");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText("Debe seleccionar un elemento antes de modificar.");
                alert.showAndWait();
            }
        }

    }
    public void eliminarServicio(ActionEvent event)throws Exception{
        if(tryParseInt(lblIdServicio.getText())) {
            //Solicitar contrase?a
            //Obtener valores desde input
            idServicioExtra = java.lang.Integer.parseInt(lblIdServicio.getText());

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{

                String sql = "exec ServicioEliminar  @IdServicio='"+idServicioExtra+"';";
                ps=miConexion.prepareCall(sql);
                ps.execute();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Eliminación de Servicio");
                alert.setHeaderText("Eliminación servicio");
                alert.setContentText("El servicio se ha eliminado correctamente");

                alert.showAndWait();
                limpiarFormulario();
                listarServicios();


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

    public Boolean validarCampos() {
        boolean formValido;

        if(nombreServicio.length() < 5){
            formValido = false;
            lblError.setText("Error: El largo del nombre de servicio debe ser mayor a 5");
            lblError.setVisible(true);
            return formValido;
        }else{
            formValido = true;
        }


        if(precioServicio == null){
            formValido = false;
            lblError.setText("Error: Debe ingregar un precio igual o mayor a 0");
            lblError.setVisible(true);
            return formValido;
        }else{
            formValido = true;
        }

        return formValido;
    }
    public void clickTabla(MouseEvent t) {
        ServicioExtra servicioExtra = tblListaServicios.getSelectionModel().getSelectedItem();
        lblIdServicio.setText(Integer.toString(servicioExtra.getIdServicio()));
        txtNombreServicio.setText(servicioExtra.getNombreServicio());
        txtPrecioServicio.setText(Integer.toString(servicioExtra.getPrecioServicio()));

    }
    public boolean tryParseInt(String valor) {
        try {
            Integer.parseInt(valor);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    public void limpiarFormulario(){
        lblIdServicio.setText(null);
        txtNombreServicio.clear();
        txtPrecioServicio.clear();
        lblError.setVisible(false);
    }

    @FXML
    public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }


}
