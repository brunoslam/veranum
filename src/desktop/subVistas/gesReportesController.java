package desktop.subVistas;

import Modelo.Settings;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Created by kaos on 02-11-15.
 */
public class gesReportesController implements Initializable {


    @FXML
     private WebView webview;


    @Override
    public void initialize (URL url, ResourceBundle rb) {

        Settings settings= new Settings();

        settings=settings.loadConfig();

        WebEngine webengine= webview.getEngine();
        webengine.load(settings.getUrlRepor()+"/Index.aspx");

    }



}
