package desktop;

import Modelo.Settings;
import Validadores.IPAddressValidator;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import org.apache.commons.validator.routines.UrlValidator;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Created by kaos on 27-10-15.
 */
public class SettingsController implements Initializable {



    @FXML
    TextField txtHost;
    @FXML
    TextField txtBase;
    @FXML
    TextField txtUser;
    @FXML
    TextField txtPass;
    @FXML
    TextField txtUrlRepor;
    @FXML
    Label lblError;


    @Override
    public void initialize (URL url, ResourceBundle rb)
    {

        Settings settings= new Settings();

        settings=settings.loadConfig();

        txtHost.setText(settings.getHost());
        txtBase.setText(settings.getDatabase());
        txtUser.setText(settings.getUser());
        txtPass.setText(settings.getPass());
        txtUrlRepor.setText(settings.getUrlRepor());


    }


    @FXML
    private void  guardarConfig (ActionEvent event)throws Exception
    {   String[] schemes = {"http","https"};
        UrlValidator urlValidator= new UrlValidator(schemes,UrlValidator.ALLOW_LOCAL_URLS);
        IPAddressValidator ipadressvalidator= new IPAddressValidator();

        if((txtUser.getText().equals("") || txtPass.getText().equals("") || txtBase.getText().equals("") ||
        txtHost.getText().equals("") || txtUrlRepor.getText().equals(""))) {
            lblError.setText("No se permiten campos vacios");


        }else if (!urlValidator.isValid(txtUrlRepor.getText().trim()))
        {
            lblError.setText("Url contiene formato incorrecto");

        }else if (!ipadressvalidator.validate(txtHost.getText().trim())){

            lblError.setText("Formato de ip de base de datos incorrecto");

        }
        else {
            Settings settings = new Settings();

            settings.setHost(txtHost.getText());
            settings.setDatabase(txtBase.getText());
            settings.setUser(txtUser.getText());
            settings.setPass(txtPass.getText());
            settings.setUrlRepor(txtUrlRepor.getText());


                settings.writeConfig(settings);

                //mensaje exitoso

                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Configuración");
                alert.setHeaderText("Información");
                alert.setContentText("La configuración se guardo exitosamente!");

                alert.showAndWait();



            // vuelve a login
            ((Node) (event.getSource())).getScene().getWindow().hide();
            Parent parent = FXMLLoader.load(getClass().getResource("/desktop/Login.fxml"));
            Stage stage = new Stage();
            Scene scene = new Scene(parent);
            stage.setScene(scene);
            stage.setTitle("Admin Veranum");
            stage.show();

        }






    }

    @FXML
    private void btntoLogin (ActionEvent event)throws Exception
    {
        ((Node) (event.getSource())).getScene().getWindow().hide();
        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/Login.fxml"));
        Stage stage = new Stage();
        Scene scene = new Scene(parent);
        stage.setScene(scene);
        stage.setTitle("Admin Veranum");
        stage.show();




    }
}
