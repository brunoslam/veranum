package Modelo;

import java.io.*;
import java.util.Properties;

/**
 * Created by kaos on 27-10-15.
 */
public class Settings {


    private String host;
    private String database;
    private String user;
    private String pass;
    private String urlRepor;

    public Settings(String host, String database, String user, String pass, String urlRepor) {
        this.host = host;
        this.database = database;
        this.user = user;
        this.pass = pass;
        this.urlRepor=urlRepor;
    }

    public Settings() {
        host = "";
        database = "";
        user = "";
        pass = "";
        urlRepor="";


    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }


    public String getUrlRepor() {
        return urlRepor;
    }

    public void setUrlRepor(String urlRepor) {
        this.urlRepor = urlRepor;
    }

    public Settings loadConfig() {
        Properties prop = new Properties();
        InputStream input = null;
        Settings settings = new Settings();


        try {

            input = new FileInputStream("config.properties");

            // load a properties file
            prop.load(input);

            // get the property value and print it out
            settings.setHost(prop.getProperty("host"));
            settings.setDatabase(prop.getProperty("database"));
            settings.setUser(prop.getProperty("user"));
            settings.setPass(prop.getProperty("pass"));
            settings.setUrlRepor(prop.getProperty("urlRepor"));

            System.out.println("Configuracion Cargada Exitosamente");

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }


        return settings;
    }

    public void writeConfig(Settings settings)
    {
        Properties prop = new Properties();
        OutputStream output = null;

        try {


           // File ar = new File("config.properties");
           // System.out.println(ar.getAbsolutePath());
          //  output=new FileOutputStream(ar);
            output = new FileOutputStream("config.properties");

            // set the properties value
            prop.setProperty("host", settings.getHost());
            prop.setProperty("database", settings.getDatabase());
            prop.setProperty("user", settings.getUser());
            prop.setProperty("pass", settings.getPass());
            prop.setProperty("urlRepor",settings.getUrlRepor());


            // save properties to project root folder
            prop.store(output,"Prueba");
            System.out.println("Configuracion Guardada Exitosamente");

        } catch (IOException io) {
            io.printStackTrace();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
    }



}
