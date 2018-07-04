package desktop;


import ConexionDB.ConexionDB;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import java.security.MessageDigest;
import java.sql.*;


public class LoginController   {

    public static String sessionUser;
    @FXML
    private Label lblLoginMessage;
    @FXML
    private TextField txtUser;
    @FXML
    private PasswordField txtPassword;

    @FXML
    private void btnLoginAction(ActionEvent event) throws Exception {


        if (txtUser.getText().equals("") || txtPassword.getText().equals("") )
        {
//
//

            // se mejora pop up de error nativo de jdk 8

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText("recuerda ingresar usuario y/o contraseña!");

            alert.showAndWait();


        }else {

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            ResultSet rs = null;


            st=miConexion.createStatement();


            String user=txtUser.getText();
            String pass=txtPassword.getText();

            // encriptación password

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(pass.getBytes());

            byte byteData[] = md.digest();

            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            //String buffer sb contiene cadena con password encriptada, convertir con toString

            st=miConexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            try{



               // rs=st.executeQuery("select * from Usuario where NombreUsuario='"+user+"' and Password='"+sb.toString()+"'");
                rs=st.executeQuery("exec UserAdmObtener @usuario='"+user+"', @password='"+sb.toString()+"';");
                rs.last();
                int encontrado= rs.getRow();



                if (encontrado ==1)  {

                    int idRol= rs.getInt("IdRol");

                    if ((idRol==2) || (idRol==3)){
                    ((Node) (event.getSource())).getScene().getWindow().hide();
                    Parent parent = FXMLLoader.load(getClass().getResource("/desktop/Principal.fxml"));
                    Stage stage = new Stage();
                    Scene scene = new Scene(parent);
                    stage.setWidth(1024);
                    stage.setHeight(600);
                    stage.setScene(scene);
                    stage.setTitle("Admin Veranum");
                    stage.show();
                    sessionUser=txtUser.getText();}
                    else{

                        lblLoginMessage.setText("Usuario y contraseña invalido");
                        // se mejora pop up de error nativo de jdk 8

                        Alert alert = new Alert(Alert.AlertType.ERROR);
                        alert.setTitle("Error Dialog");
                        alert.setHeaderText("Ha ocurrido un error");
                        alert.setContentText("Usuario no cumple con privilegios para acceder a sistema");

                        alert.showAndWait();


                    }




                } else

                {
                    lblLoginMessage.setText("Usuario y contraseña invalido");
                    // se mejora pop up de error nativo de jdk 8

                    Alert alert = new Alert(Alert.AlertType.ERROR);
                    alert.setTitle("Error Dialog");
                    alert.setHeaderText("Ha ocurrido un error");
                    alert.setContentText("Usuario y contraseña erroneo, favor reintentar!");

                    alert.showAndWait();




                }

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


        }


    }

    @FXML
    private void btnConfig (ActionEvent event)throws Exception
    {
        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/Settings.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);
       // stage.setWidth(1024);
        //stage.setHeight(600);
        stage.setScene(scene);
        stage.setTitle("Configuración Veranum");
        stage.show();




    }




}
