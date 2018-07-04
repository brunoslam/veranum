package desktop;


import ConexionDB.ConexionDB;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.application.Platform;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.ImageView;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * Created by kaos on 04-10-15.
 */
public class PrincipalController implements Initializable {

@FXML
Label lblUserActual;
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {



    }



    @FXML
    private MenuBar MenuBprincipal;
    @FXML
    private static ImageView imgLogo;


    @FXML
    private void gotoLogin(ActionEvent event)throws Exception {



       // ((Node) (event.getSource())).getScene().getWindow().hide();
        Stage stageOriginal = (Stage) MenuBprincipal.getScene().getWindow(); // Desde un boton en menu bar acceder al stage original
        stageOriginal.close();
        Parent  parent = FXMLLoader.load(getClass().getResource("/desktop/Login.fxml"));
        Stage stage= new Stage();
        Scene scene = new Scene(parent);

        stage.setScene(scene);

        stage.setTitle("Admin Veranum");
        stage.show();
        LoginController.sessionUser="";



    }




    @FXML
    public void salirApp(ActionEvent event) {
        Platform.exit();
    }



    // Abrir subventanas menu
    @FXML
    public void openInvHoteles(ActionEvent event)  throws Exception {


        if (validadRol(LoginController.sessionUser)==3) {
            Stage dialogAPPLICATION_MODAL = new Stage();
            dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

            Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/invHoteles.fxml"));

            Scene sceneAPPLICATION_MODAL = new Scene(parent);

            dialogAPPLICATION_MODAL.setTitle("Inventario Hoteles");
            dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
            dialogAPPLICATION_MODAL.show();

        }else{

            System.out.println("Sin acceso");
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Inventario Hoteles");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText("Usted no tiene privilegios para acceder a esta ventana");

            alert.showAndWait();



        }
    }
    @FXML
    public void openInvenarioHabitaciones(ActionEvent event)  throws Exception {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/invHab.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Inventario Habitaciones");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }
    @FXML
    public void openGesRegistrarEstadia(ActionEvent event)  throws Exception {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesRegistrarEstadia.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Registrar Estadia");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }

    @FXML
    public void openGesRegistroPasajeros(ActionEvent event)  throws Exception {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesRegistroPasajeros.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Registro de Pasajeros");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }

    @FXML
    public void creaUsuario(ActionEvent event) throws Exception
    {




            if (validadRol(LoginController.sessionUser)==3)
            {
                Stage dialogAPPLICATION_MODAL = new Stage();
                dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

                Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/filAdmCreaUsuario.fxml"));

                Scene sceneAPPLICATION_MODAL = new Scene(parent);

                dialogAPPLICATION_MODAL.setTitle("Crear Usuarios AdminVeranum");
                dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
                dialogAPPLICATION_MODAL.show();

            }else
            {
                System.out.println("Sin acceso");
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Crear Usuario");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText("Usted no tiene privilegios para acceder a esta ventana");

                alert.showAndWait();



            }



    }


    public int validadRol (String user){
        int idRol=0;

//        user=LoginController.sessionUser;
        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;




        try{

            st=miConexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            rs=st.executeQuery("exec UsuarioObtenerPorNombre @Nombre='"+user+"';");
            rs.last();
             idRol= rs.getInt("IdRol");

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




    return idRol;
    }


    @FXML
    public void AdminUsuarios(ActionEvent event)throws  Exception
    {


            if (validadRol(LoginController.sessionUser)==3)
            {
                Stage dialogAPPLICATION_MODAL = new Stage();
                dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

                Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/filAdmModUser.fxml"));

                Scene sceneAPPLICATION_MODAL = new Scene(parent);

                dialogAPPLICATION_MODAL.setTitle("Administrar Usuarios AdminVeranum");
                dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
                dialogAPPLICATION_MODAL.show();

            }else
            {
                System.out.println("Sin acceso");
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Administrar Usuario");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText("Usted no tiene privilegios para acceder a esta ventana");

                alert.showAndWait();


            }




    }

    @FXML
    public void abrirReportes(ActionEvent event)throws  Exception
    {


        if (validadRol(LoginController.sessionUser)==3)
        {
           Stage dialogAPPLICATION_MODAL = new Stage();
            dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

            Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesReportes.fxml"));

            Scene sceneAPPLICATION_MODAL = new Scene(parent);

            dialogAPPLICATION_MODAL.setTitle("Sistema de Reporteria");
            dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
            dialogAPPLICATION_MODAL.show();


        }else
        {
            System.out.println("Sin acceso");
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Administrar Usuario");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText("Usted no tiene privilegios para acceder a esta ventana");

            alert.showAndWait();


        }




    }

    public void tiposHabitacion(ActionEvent event)throws  Exception
    {


        if (validadRol(LoginController.sessionUser)==3)
        {
            Stage dialogAPPLICATION_MODAL = new Stage();
            dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

            Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/invTiposHabitacion.fxml"));

            Scene sceneAPPLICATION_MODAL = new Scene(parent);

            dialogAPPLICATION_MODAL.setTitle("Tipos de Habitacion");
            dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
            dialogAPPLICATION_MODAL.show();


        }else
        {
            System.out.println("Sin acceso");
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Administrar Usuario");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText("Usted no tiene privilegios para acceder a esta ventana");

            alert.showAndWait();


        }




    }




    @FXML
    public void about(ActionEvent event) throws Exception
    {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Acerca de Admin Veranum");
        alert.setHeaderText("Admin Veranum 1.0");
        alert.setContentText("Aplicación administración Hotelera AdminVeranum\n" +
                "\n" +
                "Build .178 \n" +
                "\n" +
                "\n" +
                "© 2015 AdminVeranum. Todos los derechos reservados.\n");

        alert.showAndWait();



    }

    @FXML
    public void openMantenedorServiciosHotel(ActionEvent event)  throws Exception {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/invServicios.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Mantenedor Servicios Extras");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }

    @FXML
     public void oeenCierreEstadia(ActionEvent event)  throws Exception {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesCierreEstadia.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Mantenedor Servicios Extras");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }


    @FXML
    public void openRegistroServiExtra(ActionEvent event)  throws Exception {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesRegistroServExtra.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Mantenedor Servicios Extras");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }
    @FXML
    public void openInvInspeccion(ActionEvent event)  throws Exception {


       // if (validadRol(LoginController.sessionUser)==3) {
            Stage dialogAPPLICATION_MODAL = new Stage();
            dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

            Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/invInspeccionSanitaria.fxml"));

            Scene sceneAPPLICATION_MODAL = new Scene(parent);

            dialogAPPLICATION_MODAL.setTitle("Inventario Inspecciones sanitarias");
            dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
            dialogAPPLICATION_MODAL.show();


    }
    @FXML
    public void openInvInsumoCocina(ActionEvent event)  throws Exception {


        // if (validadRol(LoginController.sessionUser)==3) {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/invInsumoCocina.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Inventario Insumos de cocina");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();


    }
    @FXML
    public void openInvMuebleHabitacion(ActionEvent event)  throws Exception {


        // if (validadRol(LoginController.sessionUser)==3) {
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/invMueblesHabitacion.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Inventario muebles habitación");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();


    }
}
