package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.Usuario;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * Created by kaos on 01-11-15.
 */
public class filAdmModUserController implements Initializable{


    private ObservableList<Usuario> lista= FXCollections.observableArrayList();

    @FXML
    private TableView<Usuario> tblUsuarios=new TableView<>();
    @FXML
    TableColumn<Usuario,Integer> colIdusuario;
    @FXML
    TableColumn<Usuario,String> colNombreusuario;
    @FXML
    TableColumn<Usuario,Integer> colIdrol;


    @FXML
    Label lblError;
    @FXML
    Button btnCancelar;
    @FXML
    Button btnLimpiar;
    @FXML
    Button btnEliminar;
    @FXML
    Button btnGuardar;
    @FXML
    Button btnSelect;
    @FXML
    TextField txtUser;
    @FXML
    PasswordField txtPass;
    @FXML
    PasswordField txtPass2;
    @FXML
    ComboBox<String> cbPerfil=new ComboBox<String>();


    @Override
    public void initialize (URL url, ResourceBundle rb)
    {

        colIdusuario.setCellValueFactory(new PropertyValueFactory<Usuario, Integer>("idusuario"));
        colNombreusuario.setCellValueFactory(new PropertyValueFactory<Usuario, String>("nombreusuario"));
        colIdrol.setCellValueFactory(new PropertyValueFactory<Usuario, Integer>("idrol"));
        llenarTabla();
        cbPerfil.getItems().addAll("Seleccione","Administrador","Gerente");
        cbPerfil.setValue("Seleccione");

    }



    public void llenarTabla(){

        Connection con= ConexionDB.GetConnection();

        try {



            Statement st;
            ResultSet rs = null;

            String sql = "exec UsuarioObtenerTodos;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                lista.add(

                        new Usuario(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getInt(3),
                                rs.getInt(4),
                                rs.getString(5)

                        )

                );


            }


            tblUsuarios.setItems(lista);

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
public void modUsuario(ActionEvent event)throws  Exception
{

    if (txtUser.getText().equals("") || txtPass.getText().equals("") || txtPass2.getText().equals(""))
    {

        lblError.setText("No se permiten campos en blanco");


    }else if (cbPerfil.getValue().equals("Seleccione")){

        lblError.setText("Debe seleccionar un perfil");
    }else if (!txtPass.getText().equals(txtPass2.getText()))
    {

        lblError.setText("Las contraseñas ingresadas no coinciden");

    }else
    {
        int perfil=0;

        if(cbPerfil.getValue().equals("Administrador")){

            perfil=2;
        }else  if(cbPerfil.getValue().equals("Gerente")){

            perfil=3;

        }

        Usuario usuario = tblUsuarios.getSelectionModel().getSelectedItem();

        updateUser(usuario.getIdusuario(),txtUser.getText(), perfil, encriptaPass(txtPass.getText()));
        limpiarCampos();
        estadoEntrada(false);

        lista.clear();
        tblUsuarios.setItems(lista);

        //se cargan nuevamente parametros y limpian datos anteriores
        llenarTabla();





    }








}


    public void updateUser(int idusuario,String user, int rol, String pass)
    {

        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;


        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;




        try {

            st = miConexion.createStatement();
            String sql = "exec UsuarioModificar2 @IdUsuario="+idusuario+", @NombreUsuario='"+user+"',@IdRol="+rol+",@Password='"+pass+"';";
            ps = miConexion.prepareCall(sql);
            ps.execute();



            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Dialogo de Información");
            alert.setHeaderText("Actualización de usuario");
            alert.setContentText("El usuario se ha actualizado correctamente");

            alert.showAndWait();



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


    public String encriptaPass (String pass) throws NoSuchAlgorithmException {
        String cadena;


        // encriptación password

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(pass.getBytes());

        byte byteData[] = md.digest();

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        //String buffer sb contiene cadena con password encriptada, convertir con toString
        cadena=sb.toString();

        return cadena;
    }

    public void seleccionUsuario(ActionEvent event) throws Exception {


        if (tblUsuarios.getSelectionModel().getSelectedItem() == null)

        {

            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Advertencia");
            alert.setHeaderText("Debe seleccionar un cliente");
            alert.setContentText("Seleccionar correctamente cliente a Modificar");

            alert.showAndWait();


        } else {


            Usuario usuario = tblUsuarios.getSelectionModel().getSelectedItem();





            estadoEntrada(true);
            txtUser.setText(usuario.getNombreusuario());
            txtPass.setText("");
            txtPass2.setText("");
            if (usuario.getIdrol()==2)
            {
                cbPerfil.setValue("Administrador");
            }else if (usuario.getIdrol()==3)
            {
                cbPerfil.setValue("Gerente");

            }else {
                cbPerfil.setValue("Seleccione");
            }






            tblUsuarios.setItems(lista);


        }

    }

    public void estadoEntrada(Boolean estado){

        if (estado)
        {

            txtUser.setDisable(false);
            txtPass.setDisable(false);
            txtPass2.setDisable(false);
            btnGuardar.setDisable(false);
            btnEliminar.setDisable(false);
            btnLimpiar.setDisable(false);
            cbPerfil.setDisable(false);
            cbPerfil.getItems().clear();
            cbPerfil.getItems().addAll("Seleccione","Administrador","Gerente");
            cbPerfil.setValue("Seleccione");

        }else
        {
            txtUser.setDisable(true);
            txtPass.setDisable(true);
            txtPass2.setDisable(true);
            btnGuardar.setDisable(true);
            btnEliminar.setDisable(true);
            btnLimpiar.setDisable(true);
            cbPerfil.setDisable(true);
            cbPerfil.getItems().clear();
            cbPerfil.setValue(null);



        }

    }

    public void limpiarCampos()
    {

        txtUser.setText("");
        txtPass.setText("");
        txtPass2.setText("");
        cbPerfil.getItems().clear();
        cbPerfil.setValue(null);
        lblError.setText("");
        estadoEntrada(false);

    }


    public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }

}
