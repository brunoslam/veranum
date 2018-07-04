package desktop.subVistas;

import ConexionDB.ConexionDB;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
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
public class filAdmCreaUsuarioController implements Initializable {

    @FXML
    ComboBox<String> cbPerfil=new ComboBox<String>();
    @FXML
    Button btnCancelar;
    @FXML
    Button btnGuardar;
    @FXML
    TextField txtUser;
    @FXML
    TextField txtPass;
    @FXML
    TextField txtPass2;
    @FXML
    Label lblError;

    @Override
    public void initialize (URL url, ResourceBundle rb){


        cbPerfil.getItems().addAll("Seleccione","Administrador","Gerente");
        cbPerfil.setValue("Seleccione");

    }

    @FXML
    public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }


    @FXML
    public void opcionRegistrar(ActionEvent event)throws Exception
    {

        String user=txtUser.getText();
        String pass=txtPass.getText();
        String pass2=txtPass2.getText();





        if ((txtUser.getText().equals("")) || (txtPass.getText().equals("")) || (txtPass2.getText().equals("")))
        {

            lblError.setText("No se permiten campos vacios");

        }else if(cbPerfil.getValue().equals("Seleccione"))
        {
            lblError.setText("Debe seleccionar un perfil");

        }else if (verificaUser(txtUser.getText()))
        {

            lblError.setText("Usuario ingresado ya existe, favor ingresar otro");


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


            inserUsuario(user,perfil,encriptaPass(pass));
            limpiaCampos();

            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Dialogo de Información");
            alert.setHeaderText("Registro de usuario");
            alert.setContentText("El usuario se ha registrado correctamente");

            alert.showAndWait();




        }




    }

    public void inserUsuario(String user, int rol, String pass)
    {

        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;


        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;




        try {

            st = miConexion.createStatement();
            String sql = "exec UsuarioCrear2 @NombreUsuario='"+user+"',@IdCliente=NULL,@IdRol="+rol+",@Password='"+pass+"';";
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


    public Boolean verificaUser(String user)
    {
        Boolean encontrado=false;




        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;



        try{

            st=miConexion.createStatement();

            st=miConexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


            // rs=st.executeQuery("select * from Usuario where NombreUsuario='"+user+"' and Password='"+sb.toString()+"'");
            rs=st.executeQuery("exec UsuarioObtenerPorNombre @Nombre='"+user+"';");
            rs.last();
            int existe= rs.getRow();


            encontrado = existe == 1;

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
            if (rs != null) try { rs.close(); } catch(Exception e) {}
            if (st != null) try { st.close(); } catch(Exception e) {}
            if (miConexion != null) try { miConexion.close(); } catch(Exception e) {}
        }








        return encontrado;
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


    public void limpiaCampos(){

        txtUser.clear();
        txtPass.clear();
        txtPass2.clear();
        lblError.setText("");
        cbPerfil.setValue("Seleccione");

    }








}
