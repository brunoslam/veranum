package ConexionDB;


import Modelo.Settings;
import javafx.scene.control.Alert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Felipe Parra
 */
public class ConexionDB {

    public static Connection GetConnection()
    {
        Connection conexion=null;
        Settings settings=new Settings();



        try
        {

            settings= settings.loadConfig();


            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //String url = "jdbc:sqlserver://10.37.129.13;databaseName=VERANUM;user=sa;password=Sql#2012;loginTimeout=30;socketTimeout=30";
            String url = "jdbc:sqlserver://"+settings.getHost()+";databaseName="+settings.getDatabase()+";user="+settings.getUser()+";password="+settings.getPass()+";loginTimeout=30;socketTimeout=30";
            conexion= DriverManager.getConnection(url);
        }
        catch(ClassNotFoundException ex)
        {
           // JOptionPane.showMessageDialog(null, ex,, JOptionPane.ERROR_MESSAGE);



            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText( "Error1 en la Conexión con la BD "+ex.getMessage());

            alert.showAndWait();
            conexion=null;
        }
        catch(SQLException ex)
        {
            //JOptionPane.showMessageDialog(null, ex, "Error2 en la Conexión con la BD "+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText( "Error2 en la Conexión con la BD "+ex.getMessage());

            alert.showAndWait();
            conexion=null;
        }
        catch(Exception ex)
        {
           // JOptionPane.showMessageDialog(null, ex, "Error3 en la Conexión con la BD "+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText( "Error3 en la Conexión con la BD "+ex.getMessage());

            alert.showAndWait();
            conexion=null;
        }

        finally
        {
            return conexion;
        }
    }
}