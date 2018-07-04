package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.TipoHabitacion;
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

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * Created by kaos on 09-11-15.
 */
public class invTiposHabitacionController implements Initializable{

    private ObservableList<TipoHabitacion> lista= FXCollections.observableArrayList();

    @FXML
    TableView<TipoHabitacion> tblTipoHabitacion=new TableView<>();
    @FXML
    TableColumn<TipoHabitacion,Integer> colId;
    @FXML
    TableColumn<TipoHabitacion,String> colNom;
    @FXML
    TableColumn<TipoHabitacion,Integer> colcantidad;
    @FXML
    Label lblid;
    @FXML
    TextField txtNombre;
    @FXML
    NumberTextField txtCantidad;
    @FXML
    Button btnCancelar;
    @FXML
    Label lblError;






    @Override
    public void initialize(URL url, ResourceBundle rb){
        colId.setCellValueFactory(new PropertyValueFactory<TipoHabitacion, Integer>("idtipohabitacion"));
        colNom.setCellValueFactory(new PropertyValueFactory<TipoHabitacion, String>("nombretipohabitacion"));
        colcantidad.setCellValueFactory(new PropertyValueFactory<TipoHabitacion, Integer>("capacidadpersonas"));

        llenarTabla();

    }



    public void llenarTabla(){

        Connection con= ConexionDB.GetConnection();

        try {



            Statement st;
            ResultSet rs = null;

            String sql = "exec TipoHabitacionListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(

                        new TipoHabitacion(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getInt(3)

                        )

                );


            }


            tblTipoHabitacion.setItems(lista);

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
    public void clickTabla(MouseEvent t) {

        TipoHabitacion tipoHabitacion = tblTipoHabitacion.getSelectionModel().getSelectedItem();
        lblid.setText(Integer.toString(tipoHabitacion.getIdtipohabitacion()));
        txtNombre.setText(tipoHabitacion.getNombretipohabitacion());
        txtCantidad.setText(Integer.toString(tipoHabitacion.getCapacidadpersonas()));

    }

    public void insertipoHabitacion(int id, String nombre, int cantiadad)
    {

        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;


        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;




        try {

            st = miConexion.createStatement();
            String sql = "exec TipoHabitacionCrear @IdTipoHabitacion="+id+",@NombreTipoHabitacion='"+nombre+"',@CapacidadPersonas="+cantiadad+";";
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




    }


    public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }


    public void opcionRegistrar(ActionEvent event)throws Exception
    {

        if(tblTipoHabitacion.getSelectionModel().getSelectedItem() == null)
        {

            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Dialogo de Información");
            alert.setHeaderText("Registro tipo Habitación");
            alert.setContentText("Debe Seleccionar un tipo de habitación");

            alert.showAndWait();

        }else {

            int idTipo = Integer.parseInt(lblid.getText());
            String nombre = txtNombre.getText();
            int cantidad = Integer.parseInt(txtCantidad.getText());


            if ((idTipo == 0) || (nombre.equals("")) || (cantidad == 0)) {

                lblError.setText("No se permiten campos vacios");


            } else {


                insertipoHabitacion(idTipo, nombre, cantidad);
                //  limpiaCampos();

                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Dialogo de Información");
                alert.setHeaderText("Registro tipo Habitación");
                alert.setContentText("El tipo de habitación se ha registrado correctamente");

                alert.showAndWait();


            }
        }



    }
}

